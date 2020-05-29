PShader shader;
PFont font;

PVector sphereLocation, lightColor;
float sphereSize;

PVector sphereXSlider, sphereZSlider, sphereSizeSlider, redSlider, greenSlider, blueSlider, sliderSize, sliderHandleSize;
PVector sphereXSliderPos, sphereZSliderPos, sphereSizeSliderPos, redSliderPos, greenSliderPos, blueSliderPos;
PVector sphereXSliderNorm, sphereZSliderNorm, sphereSizeSliderNorm, redSliderNorm, greenSliderNorm, bludeSliderNorm;

color sliderDefaultColor, sliderHoverColor, sliderSelectedColor;
color sphereXSliderColor, sphereZSliderColor, sphereSizeSliderColor, redSliderColor, greenSliderColor, blueSliderColor;

void setup() {
  size(800, 475, P2D);
  background(0);
  
  // Load shader and font
  shader = loadShader("light.frag");
  //font = createFont("Arial", 14);
  
  // Set slider colors
  sliderDefaultColor = color(75);
  sliderHoverColor = color(150);
  sliderSelectedColor = color(15);
  
  sphereXSliderColor = sliderDefaultColor;
  sphereZSliderColor = sliderDefaultColor;
  sphereSizeSliderColor = sliderDefaultColor;
  redSliderColor = sliderDefaultColor;
  greenSliderColor = sliderDefaultColor;
  blueSliderColor = sliderDefaultColor;
  
  // Set slider positions
  sphereXSlider = new PVector(550, 100);
  sphereZSlider = new PVector(550, 150);
  sphereSizeSlider = new PVector(550, 200);
  redSlider = new PVector(550, 250);
  greenSlider = new PVector(550, 300);
  blueSlider = new PVector(550, 350);
  sliderHandleSize = new PVector(550, 450);
  
  sphereXSliderPos = new PVector(650, 100);
  sphereZSliderPos = new PVector(650, 150);
  sphereSizeSliderPos = new PVector(575, 200);
  redSliderPos = new PVector(735, 250);
  greenSliderPos = new PVector(735, 300);
  blueSliderPos = new PVector(735, 350);
  
  // Set slider sizes
  sliderSize = new PVector(200, 15);
  sliderHandleSize = new PVector(sliderSize.y, sliderSize.y);
  
  // Set values
  sphereSize = 0.25;
  sphereLocation = new PVector(0.0, 6.0);
  lightColor = new PVector (1, 1, 1);
}

void draw() {
  // Set Shader variables
  shader.set("u_resolution", float(width/2 + 25), float(height+75));
  shader.set("u_mouse", float(mouseX), float(abs(mouseY-height)));
  shader.set("u_time", millis() / 1000.0);
  shader.set("sphereLocation", sphereLocation.x, sphereLocation.y);
  shader.set("sphereSize", sphereSize);
  shader.set("lightColor", lightColor.x, lightColor.y, lightColor.z);
  
  rectMode(CORNER);
  
  // Update values from sliders
  sphereLocation.x = (sphereXSliderPos.x - sphereXSlider.x - 100)/75;
  sphereLocation.y = (sphereZSliderPos.x - sphereZSlider.x - 100)/25 + 6;
  sphereSize = (sphereSizeSliderPos.x - sphereSizeSlider.x - 0.2)/125 + 0.25;
  lightColor.x = (redSliderPos.x - redSlider.x)/200;
  lightColor.y = (greenSliderPos.x - greenSlider.x)/200;
  lightColor.z = (blueSliderPos.x - blueSlider.x)/200;
  
  // Draw sliders
  
  // Sphere X Position Slider
  textAlign(CENTER);
  fill(0);
  rect(sphereXSlider.x, sphereXSlider.y - 25, sliderSize.x, sliderSize.y + 5);
  noStroke();
  fill(255);
  text("Sphere X Position", sphereXSlider.x + sliderSize.x/2, sphereXSlider.y - 10);
  fill(255);
  rect(sphereXSlider.x, sphereXSlider.y, sliderSize.x, sliderSize.y);
  fill(sphereXSliderColor);
  rect(sphereXSliderPos.x, sphereXSliderPos.y, sliderHandleSize.x, sliderHandleSize.y);
  
  if (mouseX >= sphereXSliderPos.x && mouseX <= sphereXSliderPos.x + sliderHandleSize.x && mouseY <= sphereXSliderPos.y && mouseY >= sphereXSliderPos.y + sliderHandleSize.y) {
    sphereXSliderColor = sliderHoverColor; 
  } else {
    sphereXSliderColor = sliderDefaultColor;
  }
  
  // Sphere Z Position Slider
  textAlign(CENTER);
  fill(0);
  rect(sphereZSlider.x, sphereZSlider.y - 25, sliderSize.x, sliderSize.y + 5);
  noStroke();
  fill(255);
  text("Sphere Z Position", sphereZSlider.x + sliderSize.x/2, sphereZSlider.y - 10);
  fill(255);
  rect(sphereZSlider.x, sphereZSlider.y, sliderSize.x, sliderSize.y);
  fill(sphereZSliderColor);
  rect(sphereZSliderPos.x, sphereZSliderPos.y, sliderHandleSize.x, sliderHandleSize.y);
  
  if (mouseX >= sphereZSliderPos.x && mouseX <= sphereZSliderPos.x + sliderHandleSize.x && mouseY <= sphereZSliderPos.y && mouseY >= sphereZSliderPos.y + sliderHandleSize.y) {
    sphereZSliderColor = sliderHoverColor; 
  } else {
    sphereZSliderColor = sliderDefaultColor;
  }
  
  // Sphere Size Slider
  textAlign(CENTER);
  fill(0);
  rect(sphereSizeSlider.x, sphereSizeSlider.y - 25, sliderSize.x, sliderSize.y + 5);
  noStroke();
  fill(255);
  text("Sphere Size", sphereSizeSlider.x + sliderSize.x/2, sphereSizeSlider.y - 10);
  fill(255);
  rect(sphereSizeSlider.x, sphereSizeSlider.y, sliderSize.x, sliderSize.y);
  fill(sphereSizeSliderColor);
  rect(sphereSizeSliderPos.x, sphereSizeSliderPos.y, sliderHandleSize.x, sliderHandleSize.y);
  
  if (mouseX >= sphereSizeSliderPos.x && mouseX <= sphereSizeSliderPos.x + sliderHandleSize.x && mouseY <= sphereSizeSliderPos.y && mouseY >= sphereSizeSliderPos.y + sliderHandleSize.y) {
    sphereSizeSliderColor = sliderHoverColor; 
  } else {
    sphereSizeSliderColor = sliderDefaultColor;
  }
  
  // Red Slider
  textAlign(CENTER);
  fill(0);
  rect(redSlider.x, redSlider.y - 25, sliderSize.x, sliderSize.y + 5);
  noStroke();
  fill(255);
  text("Red Light", redSlider.x + sliderSize.x/2, redSlider.y - 10);
  fill(255);
  rect(redSlider.x, redSlider.y, sliderSize.x, sliderSize.y);
  fill(redSliderColor);
  rect(redSliderPos.x, redSliderPos.y, sliderHandleSize.x, sliderHandleSize.y);
  
  if (mouseX >= redSliderPos.x && mouseX <= redSliderPos.x + sliderHandleSize.x && mouseY <= redSliderPos.y && mouseY >= redSliderPos.y + sliderHandleSize.y) {
    redSliderColor = sliderHoverColor; 
  } else {
    redSliderColor = sliderDefaultColor;
  }
  
  // Green Slider
  textAlign(CENTER);
  fill(0);
  rect(greenSlider.x, greenSlider.y - 25, sliderSize.x, sliderSize.y + 5);
  noStroke();
  fill(255);
  text("Green Light", greenSlider.x + sliderSize.x/2, greenSlider.y - 10);
  fill(255);
  rect(greenSlider.x, greenSlider.y, sliderSize.x, sliderSize.y);
  fill(greenSliderColor);
  rect(greenSliderPos.x, greenSliderPos.y, sliderHandleSize.x, sliderHandleSize.y);
  
  if (mouseX >= greenSliderPos.x && mouseX <= greenSliderPos.x + sliderHandleSize.x && mouseY <= greenSliderPos.y && mouseY >= greenSliderPos.y + sliderHandleSize.y) {
    greenSliderColor = sliderHoverColor; 
  } else {
    greenSliderColor = sliderDefaultColor;
  }
  
  // Blue Slider
  textAlign(CENTER);
  fill(0);
  rect(blueSlider.x, blueSlider.y - 25, sliderSize.x, sliderSize.y + 5);
  noStroke();
  fill(255);
  text("Blue Light", blueSlider.x + sliderSize.x/2, blueSlider.y - 10);
  fill(255);
  rect(blueSlider.x, blueSlider.y, sliderSize.x, sliderSize.y);
  fill(blueSliderColor);
  rect(blueSliderPos.x, blueSliderPos.y, sliderHandleSize.x, sliderHandleSize.y);
  
  if (mouseX >= blueSliderPos.x && mouseX <= blueSliderPos.x + sliderHandleSize.x && mouseY <= blueSliderPos.y && mouseY >= blueSliderPos.y + sliderHandleSize.y) {
    blueSliderColor = sliderHoverColor; 
  } else {
    blueSliderColor = sliderDefaultColor;
  }
  
  // Canvas area
  fill(255);
  shader(shader);
  rect(50, 25, 400, 400);
  resetShader();
}

void mouseDragged() {
  // Sphere X Position Slider
  if (mouseX >= sphereXSlider.x && mouseX <= sphereXSlider.x + sliderSize.x && mouseY >= sphereXSlider.y && mouseY <= sphereXSlider.y + sliderSize.y) {
    sphereXSliderColor = sliderSelectedColor;
    if (mouseX >= sphereXSlider.x && mouseX <= sphereXSlider.x + sliderSize.x) {
      sphereXSliderPos.x = mouseX;
    }
  }
  
  // Sphere Z Position Slider
  if (mouseX >= sphereZSlider.x && mouseX <= sphereZSlider.x + sliderSize.x && mouseY >= sphereZSlider.y && mouseY <= sphereZSlider.y + sliderSize.y) {
    sphereZSliderColor = sliderSelectedColor;
    if (mouseX >= sphereZSlider.x && mouseX <= sphereZSlider.x + sliderSize.x) {
      sphereZSliderPos.x = mouseX;
    }
  }
  
  // Sphere Size Slider
  if (mouseX >= sphereSizeSlider.x && mouseX <= sphereSizeSlider.x + sliderSize.x && mouseY >= sphereSizeSlider.y && mouseY <= sphereSizeSlider.y + sliderSize.y) {
    sphereSizeSliderColor = sliderSelectedColor;
    if (mouseX >= sphereSizeSlider.x && mouseX <= sphereSizeSlider.x + sliderSize.x) {
      sphereSizeSliderPos.x = mouseX;
    }
  }
  
  // Red Light Slider
  if (mouseX >= redSlider.x && mouseX <= redSlider.x + sliderSize.x && mouseY >= redSlider.y && mouseY <= redSlider.y + sliderSize.y) {
    redSliderColor = sliderSelectedColor;
    if (mouseX >= redSlider.x && mouseX <= redSlider.x + sliderSize.x) {
      redSliderPos.x = mouseX;
    }
  }
  
  // Green Light Slider
  if (mouseX >= greenSlider.x && mouseX <= greenSlider.x + sliderSize.x && mouseY >= greenSlider.y && mouseY <= greenSlider.y + sliderSize.y) {
    greenSliderColor = sliderSelectedColor;
    if (mouseX >= greenSlider.x && mouseX <= greenSlider.x + sliderSize.x) {
      greenSliderPos.x = mouseX;
    }
  }
  
  // Blue Light Slider
  if (mouseX >= blueSlider.x && mouseX <= blueSlider.x + sliderSize.x && mouseY >= blueSlider.y && mouseY <= blueSlider.y + sliderSize.y) {
    blueSliderColor = sliderSelectedColor;
    if (mouseX >= blueSlider.x && mouseX <= blueSlider.x + sliderSize.x) {
      blueSliderPos.x = mouseX;
    }
  }
}
