Tiles[] tiles = new Tiles[5];
float speed;
int last, score, lowestTile;
boolean gameOver, onPress;

void setup(){
  for(int i = 0; i< tiles.length; i++){
    tiles[i] = new Tiles();
    tiles[i].y += tiles[i].sizeY*(i-3);
  }
  score = 0;
  speed = 10;
  last = -1;
  lowestTile = 4;
  gameOver = true;
  onPress = true;
  
  // default setting
  noStroke();
  // android
  fullScreen();
  // on desktop
  //size(400, 700);
  textAlign(CENTER, CENTER);
}

void draw(){
  background(255);
  for(int i=0; i<tiles.length; i++){
    tiles[i].update(i);
    tiles[i].show();
  }
  
  fill(255,0,0);
  textSize(width/10);
  text(score, width/2, height/8);
  
  if(mousePressed){
    if(gameOver && !onPress){
      setup();
      gameOver = false;
      onPress = true;
    }
    if(mouseX>tiles[lowestTile].x && mouseX<(tiles[lowestTile].x+tiles[lowestTile].sizeX) && !gameOver){
      score += 1;
      tiles[lowestTile].pressed = true;
      onPress = true;
      if(lowestTile>0){
        lowestTile -= 1;
      } else {
        lowestTile = 4;
      }
    } else if(!onPress) {
      gameOver = true;
      onPress = true;
    }
  } else if(onPress) {
    onPress = false;
  }
  
  if(!gameOver){
    speed += 0.01;
  } else {
    speed = 0;
  }
}
