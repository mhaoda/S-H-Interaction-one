class Fuel{
  int x,y;
  int width, height;
  double value;
  Fuel(int x, int y, int width, int height, double value){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.value = value;
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
  int getX(){
  return x;
}
  void setY(int y){
    this.y = y;
  }
  int getWidth(){
    return width;
  }
  int getHeight(){
    return height;
  }
  void show(){
     rect(x, y, width, height);
     image(flue, x, y, width+1, height+1);
  }
}
