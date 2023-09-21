#include <iostream>
#include <random>
using namespace std;
bool resultCheck(int);
int inputCheckNum(string);
int num;
int random_number;
int main(){
	random_device rd; 
    mt19937 gen(rd());
    uniform_int_distribution<int> distribution(1, 100);
    random_number = distribution(gen);
	string input;
	cout << "Guess The Random Generated Number From 1 to 100: ";
	for(;;){
		getline(cin >> ws, input);
		num = inputCheckNum(input);
		bool flag = resultCheck(num);
		if (flag == true){
			break;
		}
		else{
			cout << "\n\nEnter Next Number: ";
			continue;
		}

	}
}

int inputCheckNum(string str)
{
	int num;
	bool flag = false;
	bool wrongInput = false;
	wrongInputJump:
	if (wrongInput == true){
		cout << "Invalid input\n\nPlease Re-enter your number: ";
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
		if (str.length()>2 && str!="100"){
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

bool resultCheck(int num){
	if (num == random_number){
		cout << "--- You Have Guessed The Number!";
		return true;	
	}
	else if(num>random_number){
		cout << "--- Your Number " << num << " is Greater Than That Number";
		return false;
	}
	else {
		cout << "--- Your Number " << num << " is Smaller Than That Number";
		return false;
	}
}