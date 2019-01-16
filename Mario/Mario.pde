String level;
int levelWidth = 64;
int levelHeight = 16;
float cameraPosX = 0.0;
float cameraPosY = 0.0;
float playerPosX = 0.0;
float playerPosY = 0.0;
float playerVelX = 0.0;
float playerVelY = 0.0;
void settings() {
  size(160*2, 120*2);
  level+="................................................................";
  level+="................................................................";
  level+="................................................................";
  level+="................................................................";
  level+="................................................................";
  level+=".......................########.................................";
  level+=".......#..............###..............#.#......................";
  level+="....................###................#.#......................";
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
  cameraPosX = playerPosX;
  cameraPosY = playerPosY;
  background(0);
  fill(0, 255, 255);
  noStroke();
  int tileWidth = 16;
  int tileHeight = 16;
  rect(0, 0, tileWidth*4, tileHeight);
  int visibleTilesX = width/tileWidth;
  int visibleTilesY = height/tileHeight;
  float offsetX = cameraPosX - float(visibleTilesX) / 2.0;
  float offsetY = cameraPosY - float(visibleTilesY) / 2.0;
  if (offsetX<0) offsetX = 0;
  if (offsetY<0) offsetY = 0;
  if (offsetX>levelWidth-visibleTilesX) offsetX = levelWidth-visibleTilesX;
  if (offsetY>levelHeight-visibleTilesY) offsetY = levelHeight-visibleTilesY;
  for (int x = 0; x < visibleTilesX; x++) {
    for (int y = -1; y < visibleTilesY; y++) {
      char tileID = GetTile(x, y);
      switch(tileID) {
      case '.':
        fill(0, 255, 255);
        rect(x*tileWidth, y*tileHeight, tileWidth, tileHeight);
        break;
      case '#':
        fill(255, 0, 0);
        rect(x*tileWidth, y*tileHeight, tileWidth, tileHeight);
        break;
      default:
        break;
      }
    }
  }
}

char GetTile(int x, int y) {
  if (x >= 0 && x < levelWidth && y >= 0 && y < levelHeight) {
    return level.charAt(y * levelWidth + x);
  } else {
    return ' ';
  }
}

void SetTile(int x, int y, char c) {
  String temp = "";
  if (x >= 0 && x < levelWidth && y >= 0 && y < levelHeight) {
    for (int i = 0; i<level.length(); i++) {
      if (i!=y*levelWidth+x) {
        temp+=level.charAt(y*levelWidth+x);
      } else {
        temp+=c;
      }
    }
    level = temp;
  }
}
