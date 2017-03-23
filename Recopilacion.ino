// Naomi Macias Honti   a01282098
// Marzo-Mayo 2017
// Recopilacion de codigos.

// CODIGO 1.
int led = 13;
int led2 = 12;
int led3 = 8;
int inPin = 7;
int val;

void setup() {
// CODIGO 1.
  pinMode(led, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);
  pinMode(inPin, INPUT);
}

void loop() {
  
  //CODIGO 1. Turn on tree leds when the pin is on, and only turn on the second led when the pin is off.
  val=digitalRead(inPin);
  if(val==HIGH){
  digitalWrite(led, HIGH);
  delay(1000);
  digitalWrite(led, LOW);
  delay(1000);
  digitalWrite(led2, HIGH);
  delay(1000);
  digitalWrite(led2, LOW);
  delay(1000);
  digitalWrite(led3, HIGH);
  delay(1000);
  digitalWrite(led3, LOW);
  delay(1000);
  }
  else{
    digitalWrite(led,LOW);
    digitalWrite(led3,LOW);
    digitalWrite(led2,HIGH);
    delay(1000);
    digitalWrite(led2,LOW);
    delay (1000);
  }
  
  // END.
}
