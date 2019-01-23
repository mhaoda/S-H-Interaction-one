class Car{
  int x,y;
  int width, height;
  double fuel = 1000.0;
    Car(int x,int y,int width, int height){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
  void setWidth(int width){
    this.width = width;
  }
  void setHeight(int height){
    this.height = height;
  }
  void setX(int x){
    this.x = x;
  }
  void setY(int y){
    this.y = y;
  }
  double getFuel(){
    return fuel;
  }
  int getX(){
    return x;
  }
  int getY(){
    return y;
  }
  int getWidth(){
    return width;
  }
  int getHeight(){
    return height;
  }
  void getFuel(double value){
    fuel = fuel + value;
  }
  void show(){
     rect(x, y, width, height);
     image(img, x, y, width+1, height+1);
   }}
