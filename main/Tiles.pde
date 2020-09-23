class Tiles{
  float sizeX, sizeY, x, y;
  int pos;
  boolean pressed;
  boolean lowest;
  
  Tiles(){
    sizeX = width/4;
    sizeY = height/4;
  
    pos = int(random(4));
    while(pos==last){
      pos = int(random(4));
    }
    last = pos;
  
    x = pos*sizeX;
    y = -sizeY;
    
    pressed = false;
  }

  void update(int i){
    this.y += speed;
    if(y>=height){
      if(pressed){
        tiles[i] = new Tiles();
      } else {
        gameOver = true;
      }
    }
  }
  
  void show(){
    if(pressed){
      fill(200);
    } else {
      fill(0);
    }
    rect(x, y, sizeX, sizeY);
  }
}