#ifndef GAIT_ANALYSIS_H
#define GAIT_ANALYSIS_H
#include <string>
#include <vector>

class GaitAnalysis
{
public:
	GaitAnalysis();
	void ReadCSVFile(std::string csvFile);
	void WriteArffFile(std::string file);

private:

};
#endif
