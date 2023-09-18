#include <iostream>
#include <cmath>
using namespace std;

void printArray(int randArray[], const int numVals);
int evenArray(int randArray[], const int numVals);

int main() {
    int NUM_ELEMENTS;
    cout << "Please enter a size: " << endl;
    cin >> NUM_ELEMENTS;
    int randArray[NUM_ELEMENTS];
    int setSeed;
    int upperV = 100;
    int lowerV = 10;

    cout << "Please enter a random seed: " << endl;
    cin >> setSeed;
    srand(setSeed);


    for (int i = 0; i < NUM_ELEMENTS; ++i) {
        randArray[i] = ((rand() % (upperV - lowerV + 1) + lowerV));
    }

    printArray(randArray , NUM_ELEMENTS);
    cout << "Number of Even Values in the list: " <<  evenArray(randArray, NUM_ELEMENTS) << endl;

    return 0;
}


void printArray(int randArray[], const int numVals){
    cout << "List: ";
    for (int i = 0; i < numVals; ++i) {
        cout << randArray[i] << " ";
    }
    cout << endl;
}

int evenArray(int randArray[], const int numVals){
    int numEvens = 0;
    for (int i = 0; i < numVals; ++i) {
        if (randArray[i] % 2 == 0){
            numEvens = numEvens + 1;
        }
    }
    return numEvens;
}
