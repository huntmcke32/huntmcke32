#include <iostream>
#include <vector>
using namespace std;

void ShowVector(const vector<int>& mulVec);
void InvertVector(vector<int>& mulVec);

int main() {
    int vectorSize;
    int multiplier;
    cout << "Please enter the size of the vector: " << endl;
    cin >> vectorSize;
    cout << "Please input the multiplier: " << endl;
    cin >> multiplier;
    vector<int> mulVec(vectorSize);

    for (int i = 0; i < vectorSize; ++i) {
        mulVec.at(i) = i * multiplier;
    }

    ShowVector(mulVec);
    InvertVector(mulVec);
    ShowVector(mulVec);
    
    return 0;
}


void ShowVector(const vector<int>& mulVec){
    for (int i = 0; i < mulVec.size(); ++i) {
        cout << mulVec.at(i) << endl;
    }
}

void InvertVector(vector<int>& mulVec){
    int tmpVar;      // Temp variable for swapping

    for (int i = 0; i < (mulVec.size() / 2); ++i) {
        tmpVar = mulVec.at(i); // These statements swap
        mulVec.at(i) = mulVec.at(mulVec.size() - 1 - i);
        mulVec.at(mulVec.size() - 1 - i) = tmpVar;
    }
}


