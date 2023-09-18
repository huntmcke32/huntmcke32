#include <iostream>
#include <stdio.h>
#include <iomanip>
#include <cmath>
using namespace std;

//place function prototypes here...
double CalcRectanglePerimeter(double height, double width);
void PrintRectanglePerimeter(double height, double width);
void DoubleRectanglePerimeter(double &height, double &width);
double CalcCircumferenceOfCircle(double circleRadius);
double CalcAreaOfCircle(double circleRadius);
double CalcVolumeOfSphere(double circleRadius);
void Swap(int &valueA, int &valueB);
void Swap(double &randomA2, double &randomB2);

const double PI = 3.14; //constant ALL_CAPS


//main function
int main(){
    cout << "Getting this line to print earns you points!\n";

    double height = 0;
    double width = 0;
    double radius = 0;
    double circleRadius = 0;
    int valueA = 0;
    int valueB = 0;
    double randomA2 = 0;
    double randomB2 = 0;
    cin >> height >> width >> radius;

    PrintRectanglePerimeter(height, width);
    cout << CalcRectanglePerimeter(height, width) << std::endl;
    cout << "... about to double height and width...\n";
    DoubleRectanglePerimeter(height, width);
    PrintRectanglePerimeter(height, width);

    CalcCircumferenceOfCircle(circleRadius);
    CalcAreaOfCircle(circleRadius);

    CalcVolumeOfSphere(circleRadius);

    Swap(valueA, valueB);

    Swap(randomA2, randomB2);


    return 0;
}

double CalcRectanglePerimeter(double height, double width) {
    double rectanglePerimeter = 0.0;
    rectanglePerimeter = 2 * (height + width);
    return rectanglePerimeter;
}

void PrintRectanglePerimeter(double height, double width) {
    double CalcRecPer = 0.0;
    CalcRecPer = CalcRectanglePerimeter(height, width);
    cout << fixed << setprecision(1);
    cout << "A rectangle with height " << height << " and width " << width << " has a perimeter of " <<
         CalcRecPer << "." << endl;
}

void DoubleRectanglePerimeter(double &height, double &width) {
    height = height * 2.0;
    width = width * 2.0;
}


double CalcCircumferenceOfCircle(double circleRadius) {
    double circleCircumference = 0.0;
    circleCircumference = (PI * circleRadius) * 2;
    return circleCircumference;
}

double CalcAreaOfCircle(double circleRadius) {
    double circleArea = 0.0;
    circleArea = (circleRadius * circleRadius) * PI;
    return circleArea;
}

double CalcVolumeOfSphere(double circleRadius) {
    double circleVolume = 0.0;
    circleVolume = (4.0 / 3.0) * PI * (circleRadius * circleRadius * circleRadius);
    return circleVolume;
}

void Swap(int &valueA, int &valueB) {
    int temp = valueA;
    valueA = valueB;
    valueB = temp;
}

void Swap(double &randomA2, double &randomB2) {
    double temp = randomA2;
    randomA2 = randomB2;
    randomB2 = temp;

}