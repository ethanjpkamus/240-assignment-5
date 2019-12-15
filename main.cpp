//Author: Ethan Kamus
//Email: ethanjpkamus@csu.fullerton.edu

/*
 * The purpose of this assignment is to learn how to code in x86-64 assembly
 * by conducting simple math with integers and returning the hypotenuse to a
 * driver module.
 */

#include <stdio.h>
#include <iostream>

extern "C" double hypotenuse();

int main(){
	double pass;
	std::cout << "\nThis program was made by Ethan Kamus\n\n";

 	pass = hypotenuse();

	std::cout << "\nThe driver recieved " << pass << " from the assembly\n"
	     << "The Main function will now return 0 to the operating system\n"
	     << "Bye\n";

	return 0;
}
