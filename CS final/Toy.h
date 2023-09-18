#ifndef TOY_H
#define TOY_H

#include <string>

using namespace std;

class Toy {

private:
    string name;  // the toy name, e.g. firetruck
    int numInStock;    // how many of this toy is in stock

    const int MAX_IN_STOCK = 20;
    // maximum number of a toy that can be kept in stock

public:

    // Accessors
    string GetName() const;    // Do NOT change
    int GetNumInStock() const;// Do NOT change
    Toy(string toyName, int numToStock);
    void SetNumInStock(int numToStock);
    void SetName(string toyName);
    string ToString() const;
};

#endif // TOY_H