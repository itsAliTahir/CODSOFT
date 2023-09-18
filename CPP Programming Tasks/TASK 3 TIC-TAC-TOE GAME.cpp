#include <iostream>
#include <windows.h>
#include <conio.h>
using namespace std;
void topMenu();
void grid();
void turnIndicator();
void winChecker();
void bottomText();
void nextRound();
char gridEnteries[9] = {'1','2','3','4','5','6','7','8','9'};
char gridColor[9] = {14,14,14,14,14,14,14,14,14};
char input;
int player1Wins = 0;
int player2Wins = 0;
int draws = 0;
int isActive = 1;
string bottomString = "    Red Turn  (x) ";
bool p1turn = true;
bool beepSound = true;

int main(){
	for (;;){
		system("CLS");
		topMenu();
		cout <<endl;
	}
}

void topMenu(){
	HANDLE console_color;
    console_color = GetStdHandle(STD_OUTPUT_HANDLE);
	cout << "\t\t     TicTacToe Game\n";
	cout << "\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\xcd\n\n\n";
	SetConsoleTextAttribute(console_color, 12);
	cout << " Red Wins: " << player1Wins;
	SetConsoleTextAttribute(console_color, 7);
	cout << " \t\tDraws: " << draws;
	SetConsoleTextAttribute(console_color, 9);
	cout << "\t   Blue Wins: " << player2Wins <<endl;
	SetConsoleTextAttribute(console_color, 7);
	cout << "--------------------------------------------------------\n";
	cout << "\t\t\tRound: "<< player1Wins+player2Wins+draws+isActive <<endl <<endl<<endl;
	grid();
	bottomText();
	cout << "--------------------------------------------------------\n\n";
	if(isActive == 1){
		beepSound = true;
		turnIndicator();
	}
	else {
		nextRound();
	}
}

void grid(){
	HANDLE console_color;
    console_color = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleTextAttribute(console_color, 7);
	cout << "\t\t       ";
	SetConsoleTextAttribute(console_color, gridColor[0]);
	cout <<gridEnteries[0];
	SetConsoleTextAttribute(console_color, 7);
	cout <<" | ";
	SetConsoleTextAttribute(console_color, gridColor[1]);
	cout <<gridEnteries[1];
	SetConsoleTextAttribute(console_color, 7);
	cout <<" | ";
	SetConsoleTextAttribute(console_color, gridColor[2]);
	cout <<gridEnteries[2]; 
	SetConsoleTextAttribute(console_color, 7);
	cout <<" \n\t\t      -----------\n\t\t       ";
	SetConsoleTextAttribute(console_color, gridColor[3]);
	cout <<gridEnteries[3];
	SetConsoleTextAttribute(console_color, 7);
	cout <<" | ";
	SetConsoleTextAttribute(console_color, gridColor[4]);
	cout <<gridEnteries[4];
	SetConsoleTextAttribute(console_color, 7);
	cout <<" | ";
	SetConsoleTextAttribute(console_color, gridColor[5]);
	cout <<gridEnteries[5];
	SetConsoleTextAttribute(console_color, 7);
	cout <<" \n\t\t      -----------\n\t\t       ";
	SetConsoleTextAttribute(console_color, gridColor[6]);
	cout <<gridEnteries[6];
	SetConsoleTextAttribute(console_color, 7);
	cout <<" | ";
	SetConsoleTextAttribute(console_color, gridColor[7]);
	cout <<gridEnteries[7];
	SetConsoleTextAttribute(console_color, 7);
	cout <<" | ";
	SetConsoleTextAttribute(console_color, gridColor[8]);
	cout <<gridEnteries[8];
	SetConsoleTextAttribute(console_color, 7);
	cout <<endl<<endl;
}

void turnIndicator(){
	cout << " Enter Target Box Number: ";
	input = getch();
	for (int i=0; i<9; i++){
		if (input == gridEnteries[i]){
			if (p1turn == true){
				gridEnteries[i] = 'X';
				gridColor[i]= 12;
				p1turn = false;
				beepSound = false;
			}
			else{
				gridEnteries[i] = 'O';
				gridColor[i]= 9;
				p1turn = true;
				beepSound = false;
			}
			
		}
		else {   
		}
	}
	if (p1turn == true){
		bottomString = "    Red Turn  (x) ";
	}
	else{
		bottomString = "    Blue Turn  (o) ";
	}
	if (beepSound == true){
		beepSound = false;
		Beep(523,500);
	}
	winChecker();
}

void winChecker(){
	if ((gridEnteries[0] == gridEnteries[1]) && (gridEnteries[1] == gridEnteries[2])){
		isActive = 0;
		if(gridEnteries[0] == 'X'){
			bottomString = "      Red Wins";
			gridColor[0]=116;
			gridColor[1]=116;
			gridColor[2]=116;
			player1Wins++;
		}
		else{
			bottomString = "     Blue Wins";
			gridColor[0]=113;
			gridColor[1]=113;
			gridColor[2]=113;
			player2Wins++;
		}
		
	}
	else if ((gridEnteries[3] == gridEnteries[4]) && (gridEnteries[4] == gridEnteries[5])){
		isActive = 0;
		if(gridEnteries[3] == 'X'){
			bottomString = "      Red Wins";
			gridColor[3]=116;
			gridColor[4]=116;
			gridColor[5]=116;
			player1Wins++;
		}
		else{
			bottomString = "     Blue Wins";
			gridColor[3]=113;
			gridColor[4]=113;
			gridColor[5]=113;
			player2Wins++;
		}
			
	} 
	else if((gridEnteries[6] == gridEnteries[7]) && (gridEnteries[7] == gridEnteries[8])){
		isActive = 0;
		if(gridEnteries[6] == 'X'){
			bottomString = "      Red Wins";
			gridColor[6]=116;
			gridColor[7]=116;
			gridColor[8]=116;
			player1Wins++;
		}
		else{
			bottomString = "     Blue Wins";
			gridColor[6]=113;
			gridColor[7]=113;
			gridColor[8]=113;
			player2Wins++;
		}			
	}
	
	else if((gridEnteries[0] == gridEnteries[3]) && (gridEnteries[3] == gridEnteries[6])){
		isActive = 0;
		if(gridEnteries[0] == 'X'){
			bottomString = "      Red Wins";
			gridColor[0]=116;
			gridColor[3]=116;
			gridColor[6]=116;
			player1Wins++;
		}
		else{
			bottomString = "     Blue Wins";
			gridColor[0]=113;
			gridColor[3]=113;
			gridColor[6]=113;
			player2Wins++;
		}
	}
	else if((gridEnteries[1] == gridEnteries[4]) && (gridEnteries[4] == gridEnteries[7])){
		isActive = 0;
		if(gridEnteries[1] == 'X'){
			bottomString = "      Red Wins";
			gridColor[1]=116;
			gridColor[4]=116;
			gridColor[7]=116;
			player1Wins++;
		}
		else{
			bottomString = "     Blue Wins";
			gridColor[1]=113;
			gridColor[4]=113;
			gridColor[7]=113;
			player2Wins++;
		}
		
	} 
	else if((gridEnteries[2] == gridEnteries[5]) && (gridEnteries[5] == gridEnteries[8])){
		isActive = 0;
		if(gridEnteries[2] == 'X'){
			bottomString = "      Red Wins";
			gridColor[2]=116;
			gridColor[5]=116;
			gridColor[8]=116;
			player1Wins++;
		}
		else{
			bottomString = "     Blue Wins";
			gridColor[3]=113;
			gridColor[5]=113;
			gridColor[8]=113;
			player2Wins++;
		}
		
	}
		
	else if((gridEnteries[0] == gridEnteries[4]) && (gridEnteries[4] == gridEnteries[8])){
		isActive = 0;
		if(gridEnteries[0] == 'X'){
			bottomString = "      Red Wins";
			gridColor[0]=116;
			gridColor[4]=116;
			gridColor[8]=116;
			player1Wins++;
		}
		else{
			bottomString = "     Blue Wins";
			gridColor[0]=113;
			gridColor[4]=113;
			gridColor[8]=113;
			player2Wins++;
		}	
		
	}
	else if((gridEnteries[2] == gridEnteries[4]) && (gridEnteries[4] == gridEnteries[6])){
		isActive = 0;
		if(gridEnteries[2] == 'X'){
			bottomString = "      Red Wins";
			gridColor[2]=116;
			gridColor[4]=116;
			gridColor[6]=116;
			player1Wins++;
		}
		else{
		
			bottomString = "     Blue Wins";
			gridColor[2]=113;
			gridColor[4]=113;
			gridColor[6]=113;
			player2Wins++;
		}
	}
	else if(gridEnteries[0]!='1' && gridEnteries[1]!='2' && gridEnteries[2]!='3' && gridEnteries[3]!='4' && gridEnteries[4]!='5' && gridEnteries[5]!='6' && gridEnteries[6]!='7' && gridEnteries[7]!='8' && gridEnteries[8]!='9'){
		bottomString = "     Game Draw";
		draws++;
		isActive=0;
	}
}

void bottomText(){
	HANDLE console_color;
    console_color = GetStdHandle(STD_OUTPUT_HANDLE);
	if (bottomString == "     Blue Wins" || bottomString == "     Game Draw" || bottomString == "      Red Wins"){
		SetConsoleTextAttribute(console_color, 10);
	}
	else if(bottomString == "    Red Turn  (x) " ){
		SetConsoleTextAttribute(console_color, 12);
	}
	else if(bottomString == "    Blue Turn  (o) "){
		SetConsoleTextAttribute(console_color, 9);
	}
	cout << "\n\t\t  " << bottomString<<endl;
	SetConsoleTextAttribute(console_color, 7);

}

void nextRound(){
	HANDLE console_color;
    console_color = GetStdHandle(STD_OUTPUT_HANDLE);  
	cout << " Press ";
	SetConsoleTextAttribute(console_color, 6);
	cout << "'Y'";
	SetConsoleTextAttribute(console_color, 7);
	cout << " to play again: ";
	input = getch();
	if (input == 'y' || input == 'Y'){
		for (int i=0; i<9;i++){
			gridColor[i] = 14;
			gridEnteries[i] = 49+i;			
		}
		if (p1turn == true){
			isActive = 1;
			bottomString = "    Red Turn  (x) ";
		}
		else{
			isActive = 1;
			bottomString = "    Blue Turn  (o) ";
		}
	}
}
