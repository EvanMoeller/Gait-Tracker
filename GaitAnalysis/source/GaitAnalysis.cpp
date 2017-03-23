#include "GaitAnalysis.h"

GaitAnalysis::GaitAnalysis()
{

}
void GaitAnalysis::ReadCSVFile(std::string csvFile)
{

}
void GaitAnalysis::WriteArffFile(std::string file)
{
	//NOTE: This is old code from another program. It will need to be modified extensively.
	//Putting it here for reference.
//	std::ofstream out;
//	std::ofstream out2;
//	out2.open(file2);
//	out.open(file);
//	out << "% 1. Title: ASD Classification\n"
//		<< "%\n"
//		<< "% 2. Sources :\n"
//		<< "% (a)Creator : NIH and Binghamton SRI 2016\n"
//		<< "% (b)Date : Fall 2016\n"
//		<< "%\n"
//		<< "@RELATION asd\n"
//		<< "\n"
//		<< "@ATTRIBUTE gender NUMERIC\n"
//		<< "@ATTRIBUTE age NUMERIC\n";
//	//going to add a new feature here at the end
//
////out2 << "Here is a test to see if anything is being written to file " << std::endl;
//	int size(100000);
//	for (auto& subject : data)
//	{
//		out2 << subject.fileName << " " << subject.age << std::endl;
//		if (subject.avgGaze.size() < size)
//		{
//			size = static_cast<int>(subject.avgGaze.size());
//			//out2 << subject.fileName << std::endl;
//		}
//	}
//	std::cout << size << std::endl;
//
//	for (int i = 0; i < 100000; ++i)
//	{
//		std::string gazeX = "gazeX_" + std::to_string(i);
//		std::string gazeY = "gazeY_" + std::to_string(i);
//		std::string gazeXLine = "@ATTRIBUTE " + gazeX + " NUMERIC";
//		std::string gazeYLine = "@ATTRIBUTE " + gazeY + " NUMERIC";
//		out << gazeXLine << std::endl << gazeYLine << std::endl;
//	}
//	//going to add a new feature here at the end
//	std::string meanX = "@ATTRIBUTE meanX NUMERIC";
//	std::string meanY = "@ATTRIBUTE meanY NUMERIC";
//	std::string sdX = "@ATTRIBUTE sdX NUMERIC";
//	std::string sdY = "@ATTRIBUTE sdY NUMERIC";
//	out << meanX << std::endl << meanY << std::endl;
//	out << sdX << std::endl << sdY << std::endl;
//	out << "@ATTRIBUTE class { low, medium, high, ASD }\n"
//		<< "\n@DATA\n";
//	WriteArffGazePoints(out, 100000);
//	out.close();
//	out2.close();
}