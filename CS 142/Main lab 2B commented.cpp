#include <iostream>
#include <cmath>                   
using namespace std;

int main() {
   int partyGuests = 0; // number of gues
   int largePizzas = 0; // number of large pizzas
   int medPizzas = 0; // number of medium pizzas
   int smallPizzas = 0; // number of small pizzas
   const int LRG_PIZZA_FEEDS = 9; // how many people a large pizza feeds
   const int MED_PIZZA_FEEDS = 5; // how many people a medium pizza feeds
   const int SMALL_PIZZA_FEEDS = 2; // how many people a small pizza feeds
   const int LARGE_DIAMETER = 24; // large pizza's diameter
   const int MED_DIAMETER = 18; // medium pizza's diameter
   const int SMALL_DIAMETER = 14; // small pizza's diameter
   const double pi = 3.14159265; // constant value of pi
   double totalPizzaArea = 0.0; // area in of all pizzas in square inches
   double pizzaPerGuest = 0.0; // how many square inches of pizza each guest can each
   const int LARGE_RADIUS = (LARGE_DIAMETER / 2); // constant value of large pizza radius 
   const int MED_RADIUS = (MED_DIAMETER / 2); // constant value of medium pizza radius
   const int SMALL_RADIUS = (SMALL_DIAMETER / 2); // constant value of small pizza radius
   const double LARGE_PRICE = 15.78; // constant value of large pizza cost
   const double MED_PRICE = 13.25;  // constant value of medium pizza cost
   const double SMALL_PRICE = 8.39; // constant value of small pizza cost
   double pizzaTotalCost = 0.0; // total costs of pizzas + tip
   double tip = 0.0; // value of tip which gets added onto total pizza cost
   int roundedPizzaCost = 0; // rounding the total pizza cost
   
   cout << "Please enter how many guests to order for: " << endl;
   cin >> partyGuests;
   largePizzas = (partyGuests / LRG_PIZZA_FEEDS); // number of large pizzas to order
   
   medPizzas = (partyGuests % LRG_PIZZA_FEEDS) / MED_PIZZA_FEEDS; // number of medium pizzas to order
   
   smallPizzas = ((partyGuests % LRG_PIZZA_FEEDS) % MED_PIZZA_FEEDS) / SMALL_PIZZA_FEEDS; // number of small pizzas to order
   
   cout << largePizzas << " large pizzas, " << medPizzas << " medium pizzas, and " 
   << smallPizzas << " small pizzas will be needed." << endl; 
   //output showing how many of each pizza type will be ordered
   
   cout << endl;
   
   totalPizzaArea = largePizzas * (pow(LARGE_RADIUS, 2.0) * pi) + medPizzas * (pow(MED_RADIUS, 2.0) * pi) + 
   smallPizzas * (pow(SMALL_RADIUS, 2.0) * pi);
   // calculating the total area of pizza in square inches by multiplying the area of each type of pizza by the
   // numbered of pizzas ordered that are of the sampe type. 
   
   pizzaPerGuest = totalPizzaArea / partyGuests;
   // pizza in square inches is total pizza area divided by total number of guests
   
   cout << "A total of " << totalPizzaArea << " square inches of pizza will be ordered " << "(" 
   << pizzaPerGuest << " per guest)." << endl;
   //output saying how much pizza will be ordered and how much each person can eat
   
   cout << endl;
   
   cout << "Please enter the tip as a percentage (i.e. 10 means 10%): " << endl;
   cin >> tip;
   // enter tip value
   pizzaTotalCost = (largePizzas * LARGE_PRICE) + (medPizzas * MED_PRICE) + (smallPizzas * SMALL_PRICE);
   // total costs of pizza without the tip
   
   tip = pizzaTotalCost * (tip / 100); 
   //calculation for tip value
   
   pizzaTotalCost = pizzaTotalCost + tip;
   // total costs of pizza with the tip
   
   roundedPizzaCost = round(pizzaTotalCost);
   // rounded total costs of pizza
   
   cout << "The total cost of the event will be: $" << roundedPizzaCost << endl;
   // output of what the total cost will be when rounded
   
}