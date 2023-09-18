#include <iostream>
#include <string>
using namespace std;

int main(){
    double northSouth;
    double eastWest;
    const int ONE_HUNDRED_TWO_LINE = 102;
    const int NINETY_SIX_LINE = 96;
    const int NINETY_LINE = 90;
    const int FORTY_THREE_LINE = 43;
    const int FORTY_LINE = 40;
    const int THIRTY_SEVEN_LINE = 37;
    string location;

   // cout << "Please enter the latitude of the location: " << endl;
    cin >>  northSouth;
    //cout << northSouth << endl;

   // cout << "Please enter the longitude of the location: " << endl;
    cin >> eastWest;
    //cout << eastWest << endl;

    if((northSouth < FORTY_THREE_LINE) && (northSouth > FORTY_LINE) && (eastWest > NINETY_SIX_LINE) && (eastWest < ONE_HUNDRED_TWO_LINE)){
        location = "Nebraska";
    }
    if((northSouth < FORTY_THREE_LINE) && (northSouth > FORTY_LINE) && (eastWest > NINETY_LINE) && (eastWest < NINETY_SIX_LINE)){
        location = "Iowa";
    }

    if((northSouth < FORTY_LINE) && (northSouth > THIRTY_SEVEN_LINE) && (eastWest > NINETY_SIX_LINE) && (eastWest < ONE_HUNDRED_TWO_LINE)){
        location = "Kansas";
    }

    if((northSouth < FORTY_LINE) && (northSouth > THIRTY_SEVEN_LINE) && (eastWest > NINETY_LINE) && (eastWest < NINETY_SIX_LINE)){
        location = "Missouri";
    }


    if (eastWest > ONE_HUNDRED_TWO_LINE){
        location = "the Western Area";
    }

    if (eastWest < NINETY_LINE) {
        location = "the Eastern Area";
    }

    if(northSouth > FORTY_THREE_LINE){
        location = "the Northern Area";
    }

    if (northSouth < THIRTY_SEVEN_LINE){
        location = "the Southern Area";
    }

    cout << "The location is found in " << location << endl;


    return 0;
}



