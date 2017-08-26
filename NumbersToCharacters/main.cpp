#include <iostream>

using namespace std;

int main()
{
    int number, res;
    cout << "Enter the number: ";
    cin >> number;
    char DigitsC[2]={0};
    res=number%10;
    number=number/10;
    res=res+48;
    DigitsC[1]=res;
    res=number%10;
    res=res+48;
    DigitsC[0]=res;
    cout << DigitsC[0] << DigitsC[1];

    return 0;
}
