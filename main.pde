String level;
int levelWidth = 64;
int levelHeight = 16;
float cameraPosX = 0.0;
float cameraPosY = 0.0;
float playerPosX = 0.0;
float playerPosY = 0.0;
float playerVelX = 0.0;
float playerVelY = 0.0;
boolean UP_ARROW = false;
boolean DOWN_ARROW = false;
boolean LEFT_ARROW = false;
boolean RIGHT_ARROW = false;
boolean playerOnGround = false;
void settings() {
  size(160*2, 120*2);
  level+="................................................................";
  level+="................................................................";
  level+="................................................................";
  level+="................................................................";
  level+="................................................................";
  level+=".......................########.................................";
  level+=".......#..............###..............#.#......................";
  level+="....................###....o...........#.#......................";
  level+="...................####.........................................";
  level+="####################################.##############.....########";
  level+="...................................#.#...............###........";
  level+="........................############.#............###...........";
  level+="........................#............#.........###..............";
  level+="........................#.############......###.................";
  level+="........................#................###....................";
  level+="........................#################.......................";
  level+="................................................................";
}
void draw() {
  playerVelX = 0.0;
  //playerVelY = 0.0;
  if (LEFT_ARROW) {
    playerVelX = -.15;
  }  
  if (RIGHT_ARROW) {
    playerVelX = .15;
  }
  playerVelY += .02;
  float newPlayerPosX = playerPosX + playerVelX;
  float newPlayerPosY = playerPosY + playerVelY;
  
  if(GetTile(newPlayerPosX, newPlayerPosY)=='o')
  SetTile(newPlayerPosX, newPlayerPosY, '.');
  if (playerVelX>.3)
    playerVelX=.3;
  if (playerVelX<-.3)
    playerVelX=-.3;
  if (playerVelY>.75)
    playerVelY=.75;
  if (playerVelY<-.75)
    playerVelY=-.75;
  //collision

  if (playerVelX<=0) {
    if (GetTile(newPlayerPosX, playerPosY)!='.'||GetTile(newPlayerPosX, playerPosY+.99)!='.') {
      newPlayerPosX = int(newPlayerPosX) + 1;
      playerVelX = 0;
    }
  } else {
    if (GetTile(newPlayerPosX+1, playerPosY)!='.'||GetTile(newPlayerPosX+1, playerPosY+.8)!='.') {
      newPlayerPosX = int(newPlayerPosX);
      playerVelX = 0;
    }
  }
  if (playerVelY<=0) {
    if (GetTile(newPlayerPosX, newPlayerPosY)!='.'||GetTile(newPlayerPosX+.8, newPlayerPosY)!='.') {
      newPlayerPosY = int(newPlayerPosY) + 1;
      playerVelY = 0;
    }
  } else {
    if (GetTile(newPlayerPosX, newPlayerPosY+1)!='.'||GetTile(newPlayerPosX+.8, newPlayerPosY+1)!='.') {
      newPlayerPosY = int(newPlayerPosY);
      playerVelY = 0;
      playerOnGround = true;
    }
  }
  playerPosX = newPlayerPosX;
  playerPosY = newPlayerPosY;

  cameraPosX = playerPosX;
  cameraPosY = playerPosY;
  background(0);
  fill(0, 255, 255);
  noStroke();
  int tileWidth = 16;
  int tileHeight = 16;
  rect(0, 0, width, height);
  int visibleTilesX = width/tileWidth;
  int visibleTilesY = height/tileHeight;
  float offsetX = cameraPosX - float(visibleTilesX) / 2.0;
  float offsetY = cameraPosY - float(visibleTilesY) / 2.0;
  if (offsetX<0) offsetX = 0;
  if (offsetY<0) offsetY = 0;
  if (offsetX>levelWidth-visibleTilesX) offsetX = levelWidth-visibleTilesX;
  if (offsetY>levelHeight-visibleTilesY) offsetY = levelHeight-visibleTilesY;
  float tileOffsetX = (offsetX - int(offsetX)) * tileWidth;
  float tileOffsetY = (offsetY - int(offsetY)) * tileHeight;
  for (int x = -1; x < visibleTilesX+1; x++) {
    for (int y = -1; y < visibleTilesY+1; y++) {
      char tileID = GetTile(x + offsetX, y + offsetY);
      switch(tileID) {
      case '.':
        fill(0, 255, 255);
        rect(x*tileWidth-tileOffsetX, y*tileHeight-tileOffsetY, tileWidth+tileOffsetX, tileHeight+tileOffsetY);
        break;
      case '#':
        fill(255, 0, 0);
        rect(x*tileWidth-tileOffsetX, y*tileHeight-tileOffsetY, tileWidth+tileOffsetX, tileHeight+tileOffsetY);
        break;
      case 'o':
        fill(255, 255, 0);
        rect(x*tileWidth-tileOffsetX, y*tileHeight-tileOffsetY, tileWidth+tileOffsetX, tileHeight+tileOffsetY);
        break;
      default:
        break;
      }
    }
  }
  fill(0, 255, 0);
  rect((playerPosX - offsetX)*tileWidth, (playerPosY - offsetY)*tileHeight, tileWidth, tileHeight);
}

char GetTile(float x, float y) {
  if (x >= 0 && x < levelWidth && y >= 0 && y < levelHeight) {
    return level.charAt(int(y) * levelWidth + int(x));
  } else {
    return ' ';
  }
}

void SetTile(float Tx, float Ty, char c) {
  String temp = "";
  int x = int(Tx);
  int y = int(Ty);
  if (x >= 0 && x < levelWidth && y >= 0 && y < levelHeight) {
    for (int i = 0; i<level.length(); i++) {
      if (i==y*levelWidth+x) {
        temp+=c;
      } else {
        temp+=level.charAt(y*levelWidth+x);
      }
    }
    level = temp;
  }
}
void keyPressed() {
  if (key == ' ') {
    if (playerVelY==0)
      playerVelY=-.4;
  }
  switch(keyCode) {
  case UP:
    UP_ARROW=true;
    break;
  case DOWN:
    DOWN_ARROW=true;
    break;
  case LEFT:
    LEFT_ARROW=true;
    break;
  case RIGHT:
    RIGHT_ARROW=true;
    break;
  }
}
void keyReleased() {
  switch(keyCode) {
  case UP:
    UP_ARROW=false;
    break;
  case DOWN:
    DOWN_ARROW=false;
    break;
  case LEFT:
    LEFT_ARROW=false;
    break;
  case RIGHT:
    RIGHT_ARROW=false;
    break;
  }
}
