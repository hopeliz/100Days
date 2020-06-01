PVector blur, size, colorValue;

PVector locSlider1, locSlider2, locSlider3, locSlider4;
PVector locSliderSize;
PVector slider1Pos, slider2Pos, slider3Pos, slider4Pos;
float sliderHandleSize, slider1norm, slider2norm, slider3norm, slider4norm;
color sliderDefaultColor, sliderHoverColor, sliderSelectedColor, radio1Color, radio2Color, radio3Color, slider1Color, slider2Color, slider3Color, slider4Color;

PShader shader;
int shape;
boolean xOn, yOn, xyOn;

PFont font, font2;

void setup() {
  size(800,600, P2D);
  background(0);
  
  shader = loadShader("color.frag");
  font = createFont("Courier", 14);
  font2 = createFont("Arial", 14);
  
  sliderDefaultColor = color(75);
  sliderHoverColor = color(150);
  sliderSelectedColor = color(15);
  
  slider1Color = sliderDefaultColor;
  slider2Color = sliderDefaultColor;
  slider3Color = sliderDefaultColor;
  slider4Color = sliderDefaultColor;
  
  radio1Color = color(255);
  radio2Color = color(255);
  radio3Color = color(255);
  
  locSlider1 = new PVector(650, 450);
  locSlider2 = new PVector(650, 500);
  locSlider3 = new PVector(650, 550);
  locSlider4 = new PVector(650, 400);
  
  // Slider width and height
  locSliderSize = new PVector(200, 15);
  sliderHandleSize = locSliderSize.y;
  
  slider1Pos = new PVector(locSlider1.x - sliderHandleSize/2 + 5, locSlider1.y);
  slider2Pos = new PVector(locSlider2.x - sliderHandleSize/2 + 5, locSlider2.y);
  slider3Pos = new PVector(locSlider3.x - sliderHandleSize/2 + 5, locSlider3.y);
  slider4Pos = new PVector(locSlider4.x - sliderHandleSize/2 + 5, locSlider4.y);
  
  blur = new PVector(0,0,0);
  size = new PVector(0,0,0);
  colorValue = new PVector(0,0,0);
  
  shape = 0;
  xOn = false;
  yOn = false;
  xyOn = false;
}

void draw() {

  shader.set("u_resolution", float(width/2 + 25), float(height+75));
  shader.set("u_mouse", float(mouseX), float(abs(mouseY-height)));
  shader.set("u_time", millis() / 1000.0);
  shader.set("blr", blur.x, blur.y, blur.z);
  shader.set("sz", size.x, size.y, size.z);
  shader.set("clr", colorValue.x, colorValue.y, colorValue.z);
  shader.set("shape", shape);
  
  // Update values from sliders
  slider1norm = (slider1Pos.x - 547.5)/200;
  slider2norm = (slider2Pos.x - 547.5)/200;
  slider3norm = (slider3Pos.x - 547.5)/200;
  slider4norm = (slider4Pos.x - 547.5)/200;
  
  colorValue.x = slider1norm;
  colorValue.y = slider2norm;
  colorValue.z = slider3norm;
  size.x = slider4norm;
  
  // Set rectMode
  rectMode(CORNER);
  ellipseMode(CENTER);
  
  fill(0);
  rect(locSlider4.x - 60, locSlider4.y - 100, 150, 20);
  textAlign(CENTER);
  textSize(12);
  fill(255);
  textFont(font2, 12);
  text("x", locSlider4.x - 50, locSlider4.y - 90);
  text("y", locSlider4.x + 50, locSlider4.y - 90);
  fill(radio1Color);
  ellipse(locSlider4.x - 50, locSlider4.y - 70, 20, 20);
  fill(radio2Color);
  ellipse(locSlider4.x + 50, locSlider4.y - 70, 20, 20);
  
  rectMode(CENTER);
  
  // SIZE slider
  textAlign(CENTER);
  fill(0);
  rect(locSlider4.x, locSlider4.y -20, locSliderSize.x, locSliderSize.y);
  textFont(font2, 12);
  fill(255);
  text("SIZE Value: " + slider4norm, locSlider4.x, locSlider4.y - 15);
  noStroke();
  fill(255);
  rect(locSlider4.x, locSlider4.y, locSliderSize.x + 15, locSliderSize.y);
  fill(slider1Color);
  rect(slider4Pos.x, slider4Pos.y, sliderHandleSize, sliderHandleSize);
  
  if (mouseX >= slider4Pos.x - sliderHandleSize/2 - 3 && mouseX <= slider4Pos.x + sliderHandleSize/2 + 3 && mouseY >= slider4Pos.y - sliderHandleSize/2 - 3 && mouseY <= slider4Pos.y + sliderHandleSize/2 + 3) {
    slider4Color = sliderHoverColor;
  } else {
    slider4Color = sliderDefaultColor;
  }
  
  // RED slider
  textAlign(CENTER);
  fill(0);
  rect(locSlider1.x, locSlider1.y -20, locSliderSize.x, locSliderSize.y);
  textFont(font2, 12);
  fill(255);
  text("RED Value: " + slider1norm, locSlider1.x, locSlider1.y - 15);
  noStroke();
  fill(255);
  rect(locSlider1.x, locSlider1.y, locSliderSize.x + 15, locSliderSize.y);
  fill(slider1Color);
  rect(slider1Pos.x, slider1Pos.y, sliderHandleSize, sliderHandleSize);
  
  if (mouseX >= slider1Pos.x - sliderHandleSize/2 - 3 && mouseX <= slider1Pos.x + sliderHandleSize/2 + 3 && mouseY >= slider1Pos.y - sliderHandleSize/2 - 3 && mouseY <= slider1Pos.y + sliderHandleSize/2 + 3) {
    slider1Color = sliderHoverColor;
  } else {
    slider1Color = sliderDefaultColor;
  }
  
  
  // GREEN slider
  fill(0);
  rect(locSlider2.x, locSlider2.y -20, locSliderSize.x, locSliderSize.y);
  textFont(font2, 12);
  fill(255);
  text("GREEN Value: " + slider2norm, locSlider2.x, locSlider2.y - 15);
  fill(255);
  rect(locSlider2.x, locSlider2.y, locSliderSize.x + 15, locSliderSize.y);
  fill(slider2Color);
  rect(slider2Pos.x, slider2Pos.y, sliderHandleSize, sliderHandleSize);
  
  if (mouseX >= slider2Pos.x - sliderHandleSize/2 - 3 && mouseX <= slider2Pos.x + sliderHandleSize/2 + 3 && mouseY >= slider2Pos.y - sliderHandleSize/2 - 3 && mouseY <= slider2Pos.y + sliderHandleSize/2 + 3) {
    slider2Color = sliderHoverColor;
  } else {
    slider2Color = sliderDefaultColor;
  }
  
  // BLUE slider
  textAlign(CENTER);
  fill(0);
  rect(locSlider3.x, locSlider3.y -20, locSliderSize.x, locSliderSize.y);
  textFont(font2, 12);
  fill(255);
  text("BLUE Value: " + slider3norm, locSlider3.x, locSlider3.y - 15);
  noStroke();
  fill(255);
  rect(locSlider3.x, locSlider3.y, locSliderSize.x + 15, locSliderSize.y);
  fill(slider3Color);
  rect(slider3Pos.x, slider3Pos.y, sliderHandleSize, sliderHandleSize);
  
  if (mouseX >= slider3Pos.x - sliderHandleSize/2 - 3 && mouseX <= slider3Pos.x + sliderHandleSize/2 + 3 && mouseY >= slider3Pos.y - sliderHandleSize/2 - 3 && mouseY <= slider3Pos.y + sliderHandleSize/2 + 3) {
    slider3Color = sliderHoverColor;
  } else {
    slider3Color = sliderDefaultColor;
  }
  
  // Code Area
  rectMode(CORNER);
  textAlign(LEFT);
  fill(0);
  rect(25, 450, 500, 150);
  textFont(font);
  noStroke();
  fill(255);
  if (shape == 0) {
    text("gl_FragColor = vec4(" + colorValue.x + ", " + colorValue.y + ", " + colorValue.z + ", 1.0);", 50, 500);
  }
  if (shape == 1) {
    text("y = step(" + size.x + ", st.x);", 50, 475);
  }
  if (shape == 2) {
    text("y = step(" + size.x + ", st.y);", 50, 475);
  }
  if (shape == 3) {
    text("y = step(" + size.x + ", st.x * st.y);", 50, 475);
  }
  
  if (shape > 0) {
    text("color = y * vec3(" + colorValue.x + ", " + colorValue.y + ", " + colorValue.z + ");", 50, 500);
    text("gl_FragColor = vec4(color, 1.0);", 50, 525);
  }
  
  // Rectangle Viewing area
  rectMode(CORNER);
  shader(shader);
  rect(25, 25, 400, 400);
  resetShader();
}

void mousePressed() {
  // X Radio Button
  if (mouseX >= locSlider4.x - 60 && mouseX <= locSlider4.x - 40 && mouseY >= locSlider4.y - 80 && mouseY <= locSlider4.y - 60) {
    if (xOn) {
      xOn = false;
      radio1Color = color(255);
      if (yOn) {
        shape = 2;
      } else {
        shape = 0;
      }
    } else {
      xOn = true;
      radio1Color = color(150);
      if (yOn) {
        shape = 3;
      } else {
        shape = 1;
      }
    }
  }
  
  // Y Radio Button
  if (mouseX >= locSlider4.x + 40 && mouseX <= locSlider4.x +60 && mouseY >= locSlider4.y - 80 && mouseY <= locSlider4.y - 60) {
    if (yOn) {
      yOn = false;
      radio2Color = color(255);
      if (xOn) {
        shape = 1;
      } else {
        shape = 0;
      }
    } else {
      yOn = true;
      radio2Color = color(150);
      if (xOn) {
        shape = 3;
      } else {
        shape = 2;
      }
    }
  }
}

void mouseDragged() {
  
  // SIZE slider
  if (mouseX >= slider4Pos.x - sliderHandleSize/2 - 3 && mouseX <= slider4Pos.x + sliderHandleSize/2 + 3 && mouseY >= slider4Pos.y - sliderHandleSize/2 - 3 && mouseY <= slider4Pos.y + sliderHandleSize/2 + 3) {
    slider4Color = sliderSelectedColor;
    if (mouseX >= locSlider4.x - locSliderSize.x/2 + sliderHandleSize/2 - 10  && mouseX <= locSlider4.x + locSliderSize.x/2 - sliderHandleSize/2 + 15) {
      slider4Pos.x = mouseX;
      size.x = slider4norm;
    }
  }
  
  // RED slider
  if (mouseX >= slider1Pos.x - sliderHandleSize/2 - 3 && mouseX <= slider1Pos.x + sliderHandleSize/2 + 3 && mouseY >= slider1Pos.y - sliderHandleSize/2 - 3 && mouseY <= slider1Pos.y + sliderHandleSize/2 + 3) {
    slider1Color = sliderSelectedColor;
    if (mouseX >= locSlider1.x - locSliderSize.x/2 + sliderHandleSize/2 - 10  && mouseX <= locSlider1.x + locSliderSize.x/2 - sliderHandleSize/2 + 15) {
      slider1Pos.x = mouseX;
      colorValue.x = slider1norm;
    }
  }
  
  // GREEN slider
  if (mouseX >= slider2Pos.x - sliderHandleSize/2 - 3 && mouseX <= slider2Pos.x + sliderHandleSize/2 + 3 && mouseY >= slider2Pos.y - sliderHandleSize/2 - 3 && mouseY <= slider2Pos.y + sliderHandleSize/2 + 3) {
    slider2Color = sliderSelectedColor;
    if (mouseX >= locSlider2.x - locSliderSize.x/2 + sliderHandleSize/2 - 10  && mouseX <= locSlider2.x + locSliderSize.x/2 - sliderHandleSize/2 + 15) {
        slider2Pos.x = mouseX;
        colorValue.y = slider2norm;
    }
  }
  
  // BLUE slider
  if (mouseX >= slider3Pos.x - sliderHandleSize/2 - 3 && mouseX <= slider3Pos.x + sliderHandleSize/2 + 3 && mouseY >= slider3Pos.y - sliderHandleSize/2 - 3 && mouseY <= slider3Pos.y + sliderHandleSize/2 + 3) {
    slider3Color = sliderSelectedColor;
    if (mouseX >= locSlider3.x - locSliderSize.x/2 + sliderHandleSize/2 - 10  && mouseX <= locSlider3.x + locSliderSize.x/2 - sliderHandleSize/2 + 15) {
        slider3Pos.x = mouseX;
        colorValue.z = slider3norm;
    }
  }
  
  
}
