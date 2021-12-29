
/*
Copyright (c) 2011, Matt Gordon
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer 
in the documentation and/or other materials provided with the distribution.

Neither the name of the author nor the names of its contributors may be used to endorse or promote products 
derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, 
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include "targetver.h"

#define VC_EXTRALEAN
#define WIN32_LEAN_AND_MEAN
#include <windows.h> //for TEXT macro

#include <tchar.h>

#include <string>
#include <iostream>
#include <fstream>


//map STL string and c-out to TCHAR
typedef std::basic_string<TCHAR> tstring;

#ifdef UNICODE

#define tcout std::wcout
//capital S maps unicode down to ASCII for consistent output format.
static const char* kCommentFormat = "\n";
static const char* kNamespaceFormat = "namespace %S \n{\n";
static const char* kIdentifierFormat = "%S";

#else

#define tcout std::cout
static const char* kCommentFormat = "\n";
static const char* kNamespaceFormat = "namespace %s \n{\n";
static const char* kIdentifierFormat = "%s";

#endif

//prints help to stdout
void Help()
{
	std::cout << "bin2h utility v1.01\n\n";

	std::cout << "Interprets any file as plain binary data and dumps to a raw C/C++ array.\n";
	std::cout << "usage: bin2h <in-file> <out-file> <opt-args>\n\n";
	
	std::cout << "valid optional arguments:\n";
	std::cout << "-id=<name> the C array is identified as \"name\". identifier is \"data\" if this argument is not present. bin2h does not check the identifier is valid in C/C++.\n";
	std::cout << "-ns=<namespace> causes the data to be wrapped in a namespace. no namespace is inserted if this argument is not used.\n";
}

//checks if main() argument looks like it might be an (optional) argument
bool IsArg(_TCHAR* arg)
{
	return (_tcsncmp(arg, TEXT("-"), 1) == 0);
}

struct Arguments
{
	tstring ns;
	tstring id;

	Arguments() : id(TEXT("data")) {}
};

//read in optional arguments from the command line
void ReadArgs(int argc, int start, _TCHAR* argv[], Arguments& outArgs)
{
	for(int i=start; i<argc; ++i)
	{
		if(_tcsncmp(argv[i], TEXT("-id="), 4) == 0)
		{
			outArgs.id = argv[i] + 4;	//highly dubious against TCHARs, but oh well...
		}
		else if(_tcsncmp(argv[i], TEXT("-ns="), 4) == 0)
		{
			outArgs.ns = argv[i] + 4;
		}
	}
}


//so far as tchar-ness goes, the output should always be purely narrow character (native codepage).
//the program itself should compile for either narrow or unicode mode.

int _tmain(int argc, _TCHAR* argv[])
{
	//argv 1 should be a valid filename, and argv 2 is optionally something that a output stream
	//can be opened against. after that, options.
	if(argc < 2 || IsArg(argv[1]))
	{
		Help();
		return 0;
	}

	bool bFileout = argc >2 && !IsArg(argv[2]);

	//check input file can be opened
	std::ifstream in(argv[1], std::ios_base::binary);
	if(!in.is_open())
	{
		tcout << L"couldn't open " << argv[1] << L" for reading.\n\n";
		Help();
		return 0;
	}

	//check output file can be opened
	std::ofstream outfile;
	if(bFileout)
	{
		outfile.open(argv[2], std::ios_base::trunc);
		if(!outfile.is_open())
		{
			tcout << L"couldn't open " << argv[2] << L"for writing.\n\n";
			Help();
			in.close();
			return 0;
		}
	}	

	//stream to the output file, or std out if no file was provided
	std::ostream& out = outfile.is_open() ? outfile : std::cout;

	Arguments A;
	ReadArgs(argc, bFileout ? 2:1, argv, A);

	//write out pre-amble

	//insert a comment to indicate that this file was auto generated from some other file
	{
		char out_buffer[1024];
		int  sprintf_count = sprintf_s(out_buffer, kCommentFormat, argv[1]);
		out.write(out_buffer, sprintf_count);
	}

	bool bWroteNamespace = false;
	if(!A.ns.empty())
	{
		char out_buffer[1024];
		int  sprintf_count = sprintf_s(out_buffer, kNamespaceFormat, A.ns.c_str());
		out.write(out_buffer, sprintf_count);
		bWroteNamespace = true;
	}

	//usual cheese to get file size
	in.seekg(0, std::ios_base::end);
	size_t filesize = in.tellg();
	in.seekg(0, std::ios_base::beg);

	//same trick as for namespace to get the id out
	{
		char out_buffer[1024];
		int sprintf_count = sprintf_s(out_buffer, kIdentifierFormat, A.id.c_str());
	
		//array size, for use in code
		//out << "size_t ";
		//out.write(out_buffer, sprintf_count);
		//out << "_len = " << filesize << ";" << std::endl;

		//and now, the array
		out << "unsigned char "; 
		out.write(out_buffer, sprintf_count);
	}

	out << "[]=\n{\n\t";

	//stream the data through
	int restart = 0;
	unsigned i = 0;
	for(i=0; i<filesize; )
	{
		static const size_t bufferLen = 1024;
		//buffer has to be unsigned for the sprintf to work as required.
		unsigned char in_buffer[bufferLen];

		const size_t chunk = i+bufferLen < filesize ? bufferLen : filesize-i;
		in.read(reinterpret_cast<char*>(in_buffer), chunk);

		for(unsigned j=0; j<chunk; ++j)
		{
			char out_buffer[128];
			if (j + i == filesize - 1){
				sprintf_s(out_buffer, "0x%.2hX", in_buffer[j]);
			}
			else {
				sprintf_s(out_buffer, "0x%.2hX,", in_buffer[j]);
			}
			out << out_buffer;

			++restart;
			if(restart > 15)
			{
				if (j + i != filesize - 1) {
					out << "\n\t";
					restart = 0;
				}
			}
		}

		i += chunk;
	}

	//post-amble - close array, then namespace
	out << "\n};\n";
	if(bWroteNamespace)
	{
		out << "}//end namespace\n";
	}

	if(outfile.is_open())
		outfile.close();
	in.close();

	return 0;
}

