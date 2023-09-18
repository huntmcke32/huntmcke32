#include <iostream>
#include <cmath>
#include <string>
using namespace std;
int main() {
    int newArray[10];
    string newString;

    for (int i = 0; i < 10; ++i) {
        cin >> newArray[i];
    }

    cin >> newString;

    if (newString == "print") {
        for (int i = 0; i < 10; ++i) {
            cout << newArray[i] << " ";
        }
    }

    if (newString == "divide"){
        for (int i = 0; i < 10; ++i) {
            if (newArray[i]%2 == 0){
                newArray[i] = 1;
            }
            else {
                newArray[i] = 0;
            }
            cout << newArray[i] << " ";
        }
    }

    if (newString == "reverse"){
        for (int i = 9; i >= 0; --i) {
            cout << newArray[i] << " ";

        }
    }

    return 0;
}
