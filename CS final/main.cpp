#include <iostream>
#include <string>
#include "Toy.h"
using namespace std;


int main() {
    int addStock;
    int currStock;

    Toy Truck("Truck", 8);
    Toy Blocks("Blocks", 19);

    cout << Truck.ToString() << endl;
    cout << Blocks.ToString() << endl;

    Blocks.SetName("Blocks Plus");
    cout << Blocks.ToString() << endl;

    cout << "How many more trucks would you like to stock?" << endl;
    cin >> addStock;

    currStock = Truck.GetNumInStock();

    Truck.SetNumInStock(currStock + addStock);
    cout << Truck.ToString() << endl;


    return 0;
}