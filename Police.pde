class Police{
  int x,y;
  int width, height;
  Police(int x, int y, int width, int height){
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
  int getX(){
    return x;
  }
  int getWidth(){
    return width;
  }
  int getHeight(){
    return height;
  }
  void show(){
     rect(x, y, width, height);
     image(ambulance, x, y, width+1, height+1);
  }
}
