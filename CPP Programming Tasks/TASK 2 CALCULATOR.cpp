#include <iostream>
#include <conio.h>
using namespace std;
void takeInputs();
int inputCheckNum(string);
void myOptions();
int number1;
int number2;
char option;

int main(){
	for(;;){
		takeInputs();
		myOptions();	
	}
}

void takeInputs(){
	string input;
	cout << "\tSimple Calculator\n\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\n";
	cout << "Enter 1st Number: ";
	getline(cin >> ws, input);
	number1 = inputCheckNum(input);
	cout << "Enter 2nd Number: ";
	getline(cin >> ws, input);
	number2 = inputCheckNum(input);
}



int inputCheckNum(string str)
{
	int num;
	bool flag = false;
	bool wrongInput = false;
	wrongInputJump:
	if (wrongInput == true){
		cout << "Wrong Number\nPlease Re-enter your number: ";
		getline(cin >> ws, str);
		wrongInput = false;
	}
	char arr[str.length() + 1];
	strcpy(arr, str.c_str()); 
	for (int i = 0; i < str.length(); i++)
	{
		if (arr[i]>=48 && arr[i]<=57)
		{
			flag = true;
		}
		else
		{
			flag = false;
			wrongInput = true;
			goto wrongInputJump;
		}
	}
	if (flag == true && str.length() < 8)
	{
		num = stoi(str);
		return num;
	}
	goto wrongInputJump;
}

void myOptions(){
	cout << "\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\n";
	cout << "1. Addition (+) \n2. Substraction (-) \n3. Multiplication (x) \n4. Division (/)\n5. Remainder (%) "<<endl;
	cout << "\t\t---------" <<endl;
		reselect:
		cout << "Which Operation do you want to perform: ";
		option = getch();
			switch (option){
				case '1':
					cout << "1. Addition (+)";
					cout << "\n\n-------------------------------------------------------------\n";
					cout << number1 << " + " << number2 << " = " <<number1+number2 <<endl <<endl;
					break;
				case '2':
					cout << "2. Substraction (-)";
					cout << "\n\n-------------------------------------------------------------\n";	
					cout << number1 << " - " << number2 << " = " <<number1-number2 <<endl <<endl;
					break;
				case '3':
					cout << "3. Substraction (x)";			
					cout << "\n\n-------------------------------------------------------------\n";			
					cout << number1 << " x " << number2 << " = " <<number1*number2 <<endl <<endl;
					break;
				case '4':
					cout << "4. Divison (/)";			
					cout << "\n\n-------------------------------------------------------------\n";				
					cout << number1 << " / " << number2 << " = " <<number1/number2 <<endl <<endl;
					break;	
				case '5':
					cout << "5. Remainder (%)";					
					cout << "\n\n-------------------------------------------------------------\n";				
					cout << number1 << " % " << number2 << " = " <<number1%number2 <<endl <<endl;
					break;	
				default: 
					cout << "Invalid Selection"<<endl;
					goto reselect;
					break;
				}
			system("pause");
			system("CLS");
}