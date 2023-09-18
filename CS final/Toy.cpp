#include "Toy.h"
#include <string>
#include <iomanip>
using namespace std;


using namespace std;

string Toy::GetName() const { return name; }	    // Do NOT change
int Toy::GetNumInStock() const { return numInStock; } // Do NOT change
// TO DO: add the needed implementations of the required methods
Toy::Toy(string toyName, int numToStock) {
    if (toyName.size() > 0){
        name = toyName;
    }
    else{
        name = "unknown";
    }

    if ((numToStock > 0) && (numToStock <= 20)){
        numInStock = numToStock;
    }
    if (numToStock > 20){
        numInStock = MAX_IN_STOCK;
    }

}



void Toy::SetNumInStock(int numToStock) {
    if ((numToStock > 0) && (numToStock <= 20)){
        numInStock = numToStock;
    }
    if (numToStock > 20){
        numInStock = MAX_IN_STOCK;
    }

}

void Toy::SetName(string toyName) {
    if (toyName.size() > 0){
        name = toyName;
    }
}

string Toy::ToString() const{
    string toyInfo;
    toyInfo = to_string(numInStock) + " " + name + " in stock";
    return toyInfo;

}