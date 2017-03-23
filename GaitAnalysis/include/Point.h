#ifndef POINT_H
#define POINT_H
#include <iostream>
#include <cmath>
struct Point
{
	Point(float xVal, float yVal, float zVal) : x(xVal), y(yVal), z(zVal) {}
	Point() : x(0), y(0) {}
	float x;
	float y;
	float z;
	friend std::ostream &operator<<(std::ostream& os, Point& point)
	{
		os << "(" << point.x << ", " << point.y << ", " << point.z << ")";
		return os;
	}
	Point& operator+=(const Point& point)
	{
		x += point.x;
		y += point.y;
		z += point.z;
		return *this;
	}
	Point& operator/=(const Point& point)
	{
		x /= point.x;
		y /= point.y;
		z /= point.z;
		return *this;
	}
	Point& operator/=(const int size)
	{
		x /= size;
		y /= size;
		z /= size;
		return *this;
	}
	double Distance(Point& point)
	{
		return std::sqrt(std::pow(((float)(x - point.x)), 2) + std::pow(((float)(y - point.y)), 2) + std::pow(((float)(z - point.z)), 2));
	}
};
#endif
