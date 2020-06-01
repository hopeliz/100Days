// Knob 1
#define outputA1 10
#define outputB1 9

// Knob 2
#define outputA2 8
#define outputB2 7

// Knob 1
int counter1 = 0;
int counter1b = 0;
int aState1;
int aLastState1;

// Knob 2
int counter2 = 0;
int counter2b = 0;
int aState2;
int aLastState2;

void setup() {
  // Knob 1
  pinMode(outputA1, INPUT);
  pinMode(outputB1, INPUT);

  // Knob 2
  pinMode(outputA2, INPUT);
  pinMode(outputB2, INPUT);

  // Begin serial connection
  Serial.begin(115200);

  // Reads the initial state of outputA for all knobs
  aLastState1 = digitalRead(outputA1);
  aLastState2 = digitalRead(outputA2);
}

void loop() {
  // Read current state of outputA for all knobs
  aState1 = digitalRead(outputA1);
  aState2 = digitalRead(outputA2);

  // See if pulse occured on Knob 1
  if (aState1 != aLastState1) {

    // See if rotatng clockwise
    if (digitalRead(outputB1) != aState1) {
      if (counter1 > 0) {
        counter1--;
      }
    }
    else {
      counter1++;
    }

    // Print result
    if (counter1 < 100) {
      Serial.print(0);
    }
    if (counter1 < 10) {
      Serial.print(0);
    }
    Serial.print(counter1);
    Serial.print(",");
    if (counter2 < 100) {
      Serial.print(0);
    }
    if (counter2 < 10) {
      Serial.print(0);
    }
    Serial.println(counter2);
  }

  // See if pulse occured on Knob 2
  if (aState2 != aLastState2) {
    
    // See if rotatng clockwise
    if (digitalRead(outputB2) != aState2) {
      if (counter2 > 0) {
        counter2--;
      }
    }
    else {
      counter2++;
    }

    // Print result
    if (counter1 < 100) {
      Serial.print(0);
    }
    if (counter1 < 10) {
      Serial.print(0);
    }
    Serial.print(counter1);
    Serial.print(",");
    if (counter2 < 100) {
      Serial.print(0);
    }
    if (counter2 < 10) {
      Serial.print(0);
    }
    Serial.println(counter2);
  }

  // Update the previous state with the current state on all knobs
  aLastState1 = aState1;
  aLastState2 = aState2;
}
