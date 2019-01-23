import com.phidget22.*;
int carX,carY;
int speed;
float score;
Car car = new Car(270,500,60,120);
PImage img, ambulance, flue;
Police Police1 = new Police(70,0,60,120);
Police Police2 = new Police(470,0,60,120);
Fuel fuel = new Fuel(270,0,80,90,500);
VoltageRatioInput chRota; // The channel for the Rotation senso
VoltageRatioInput chRota1;
VoltageRatioInput speedControl;
void setup() {
  size(600, 800);  // Size should be the first statement
  stroke(255);     // Set stroke color to white
  img = loadImage("car.jpg");
  ambulance = loadImage("ambulance.png");
  flue = loadImage("flue.png");
     try {
 chRota = new VoltageRatioInput();
 chRota.setDeviceSerialNumber(275238);
 chRota.setChannel(1);
 chRota.open();
 chRota1 = new VoltageRatioInput();
 chRota1.setDeviceSerialNumber(275238);
 chRota1.setChannel(2);
 chRota1.open();
 speedControl = new VoltageRatioInput();
 speedControl.setDeviceSerialNumber(275238);
 speedControl.setChannel(5);
 speedControl.open();
 } catch (PhidgetException e) {
 System.out.println(e);
 }
 noLoop();
}
void draw() { 
  // draw the game background.
  background(0);   // Set the background to black
  line(200, 0, 200, height);
  line(400, 0, 400, height);
  ellipse(300, 920, 800, 600);
  fill(0,0,0);
  ellipse(170, 720, 160, 160);
  ellipse(430, 720, 160, 160);
  rect(260, 700, 80, 80, 7);
  line(10, 720, 250, 720);
  line(590, 720, 350, 720);
  fill(255,255,255);
  textSize(35);
  text("FUEL", 130, 700);
  text("SPEED", 380, 700);
  text((int)car.fuel, 125, 760);
  text(speed, 410, 760);
  textSize(30);
  text((int)score, 260, 750);
  
  //start();
  // get the y coordinate from hardware.
  try{
 if((int)(300*chRota1.getSensorValue()+360)<500){
   carY = (int)(300*chRota1.getSensorValue()+360);
 }else{
   carY = 500;
 }
 // get the x coordinate. 
 carX = (int)(500*chRota.getSensorValue()+50); 
 // get the speed level.
 speed = (int)(10*speedControl.getSensorValue());
 if(speed<=1){
 speed = 1;
 }else{
 speed = (int)(10*speedControl.getSensorValue());
 }
  } catch (PhidgetException e) {
 System.out.println(e);
 }
  
  car.show();
  Police1.show();
  Police2.show();
  fuel.show();

  car.setX(carX);
  car.setY(carY);
  Police1.setY(Police1.y+speed);
  Police2.setY(Police2.y+speed);
  fuel.setY(fuel.y+speed);
  // judge if the car will collide with the police1. (from the front)
  if(car.x+car.getWidth()>=Police1.x&&car.x+car.getWidth()<=Police1.x+Police1.getWidth()){
    if(car.y+car.getHeight()>=Police1.y&&car.y+car.getHeight()<=Police1.y+Police1.getHeight()){
      noLoop();
      background(0); 
    textSize(32);
    text("GAME OVER!", 100,300);
    text("Current score: " + (int)score, 100, 400);
    text("Current speed: " + speed, 100, 500);
    reset();
    }
  }
  // judge if the car will collide with the police1. (from sides)
  if(car.x>=Police1.x&&car.x<=Police1.x+Police1.getWidth()){
    if(car.y>=Police1.y&&car.y<=Police1.y+Police1.getHeight()){
    noLoop();
    background(0); 
    textSize(32);
    text("GAME OVER!", 100,300);
    text("Current score: " + (int)score, 100, 400);
    text("Current speed: " + speed, 100, 500);
    reset();
    }
  }
  // judge if the car will collide with the police2. (from the front)
  if(car.x+car.getWidth()>=Police2.x&&car.x+car.getWidth()<=Police2.x+Police2.getWidth()){
    if(car.y+car.getHeight()>=Police2.y&&car.y+car.getHeight()<=Police2.y+Police2.getHeight()){
      noLoop();
      background(0); 
    textSize(32);
    text("GAME OVER!", 100,300);
    text("Current score: " + (int)score, 100, 400);
    text("Current speed: " + speed, 100, 500);
    reset();
    }
  }
  // judge if the car will collide with the police1. (from sides)
  if(car.x>=Police2.x&&car.x<=Police2.x+Police2.getWidth()){
    if(car.y>=Police2.y&&car.y<=Police2.y+Police2.getHeight()){
    noLoop();
    background(0); 
    textSize(32);
    text("GAME OVER!", 100,300);
    text("Current score: " + (int)score, 100, 400);
    text("Current speed: " + speed, 100, 500);
    reset();
    }
  }
  // judge if the car get the fuel bin (front)
  if(car.x+car.getWidth()>=fuel.x&&car.x+car.getWidth()<=fuel.x+fuel.getWidth()){
    if(car.y+car.getHeight()>=fuel.y&&car.y+car.getHeight()<=fuel.y+fuel.getHeight()){
      car.getFuel(fuel.value);
       if(fuel.getX()==470){
         fuel.setX(70);
       }else{
      fuel.setX(fuel.x+200);
       }
      fuel.setY(-300);
    }
  }
  // judge if the car get the fuel bin (sides)
  if(car.x>=fuel.x&&car.x<=fuel.x+Police1.getWidth()){
    if(car.y>=fuel.y&&car.y<=fuel.y+fuel.getHeight()){
      car.getFuel(fuel.value);
       if(fuel.getX()==470){
         fuel.setX(70);
       }else{
      fuel.setX(fuel.x+200);
       }
      fuel.setY(-300);
    }
  }
  if(Police1.y>500){
    Police1.setY((int)random(-1500,-900));
    if(Police1.getX()==470){
      Police1.setX(70);
    }else{
    Police1.setX(Police1.x+200);
    }
  }
  if(Police2.y>500){
    Police2.setY((int)random(-1000,-500));
    if(Police2.getX()==470){
      Police2.setX(70);
    }else{
    Police2.setX(Police2.x+200);
    }
    
  }
  if(fuel.y>500){
    fuel.setY((int)random(-1000,-500));
    if(fuel.getX()==470){
         fuel.setX(70);
       }else{
      fuel.setX(fuel.x+200);
       }
  }
  if(car.getFuel()<=0){
    noLoop();
    background(0); 
    textSize(32);
    text("GAME OVER!", 100,300);
    text("Current score: " + (int)score, 50, 100);
    text("Current speed: " + speed, 50, 170);
    reset();
  }
  
  car.fuel = car.fuel - speed*0.1;
  score = score + 0.3*speed;

  if(car.fuel<=500){
  text("YOU NEED MORE FUEL!", 100,300);
  }
}

void mousePressed() {
  loop();
}

void reset(){
car.fuel = 1000;
score = 0;
Police1.setY((int)random(-750,-880));
Police2.setY((int)random(-450,-650));
fuel.setY(-200);
}
