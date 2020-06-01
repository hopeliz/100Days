import processing.serial.*;

Serial serialData;
String fullMessage = "00,00";

PShader shader;

String xMap = "";
String yMap = "";
float xCoord = 0.0;
float yCoord = 0.0;

void setup() {
  size(640, 360, P2D);
  noStroke();
  
  String portToUse = Serial.list()[0];
  serialData = new Serial(this, portToUse, 115200);

  shader = loadShader("shader.frag");
}

void draw() {

  while (serialData.available() > 0) {
    fullMessage = serialData.readString();
    println(fullMessage + " " + fullMessage.length());
  }
  if (fullMessage.length() == 9) {
    xMap = fullMessage.substring(0,3);
    yMap = fullMessage.substring(4,7);
    
    if (float(xMap) > -1) {
      xCoord = float(xMap) +25;
    }
    if (float(yMap) > -1) {
      yCoord = float(yMap) +25;
    }
  }
  shader.set("u_resolution", float(width), float(height));
  //shader.set("u_mouse", float(mouseX), float(abs(mouseY-height)));
  shader.set("u_mouse", xCoord, abs(yCoord));
  shader.set("u_time", millis() / 1000.0);
  shader(shader);
  rect(0, 0, width, height);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      yCoord += 10;
    }
    if (keyCode == DOWN) {
      yCoord -= 10;
    }
    if (keyCode == LEFT) {
      xCoord -=10;
    }
    if (keyCode == RIGHT) {
      xCoord += 10;
    }
  }
}
