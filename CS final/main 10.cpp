#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;


const int SEC_IN_DAY = 86400;
const double MU = 1.3274745e20;
const double R_EARTH = 149600000000;
const double PI = acos(-1); // arccos(-1) produces the value pi

double ConvertSecondsToDays(double seconds);
double CubedSum(double v1, double v2);
double HohmannTime(double r1, double r2 = R_EARTH);
double DirectTime (double rDestination){
    return 2.0 * sqrt(fabs(rDestination - 1.496e11) / 10) / 86400.0;
}


int main() {
    //HohmannTime(2.28e11);

    //venus
    HohmannTime(1.08e11);
    DirectTime(1.08e11);

    //Jupiter
    HohmannTime(7.78e11);
    DirectTime(7.78e11);

    //Pluto
    HohmannTime(5.91e12);
    DirectTime(5.91e12);

    cout << setw(10) << left << "Planet";
    cout << setw(15) << left << "Hohmann Time";
    cout << left << "Direct Time\n";
    cout << setw(10) <<left << "Venus";
    cout << fixed << setprecision(2);
    cout << setw(15) << left << HohmannTime(1.08e11);
    cout << left << DirectTime(1.08e11) << endl;
    cout << setw(10) << left << "Jupiter";
    cout << setw(15) << left << HohmannTime(7.78e11);
    cout << left << DirectTime(7.78e11) << endl;
    cout << setw(10) << left << "Pluto";
    cout << setw(15) << left << HohmannTime(5.91e12);
    cout << left << DirectTime(5.91e12) << endl;


    return 0;
}

double ConvertSecondsToDays(double seconds){
    double days;
    days = seconds / SEC_IN_DAY;
    return days;

}

double CubedSum(double v1, double v2){
    double base;
    double result;
    double power = 3.0;
    base = v1 + v2;
    result = pow(base,power);
    return result;
}

double HohmannTime(double r1, double r2){
    double timeInSeconds;
    double timeInDays;
    timeInSeconds = PI * sqrt(CubedSum(r1,r2)/(8.0 * MU));
    timeInDays = ConvertSecondsToDays(timeInSeconds);
  //cout << timeInDays << endl;
    return timeInDays;
}
