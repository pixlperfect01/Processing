class Goomba {
  float x, y;
  boolean dir, foot = true, alive = true;
  Goomba(float x_, float y_, boolean dir_) {
    x = x_;
    y = y_;
    dir = dir_;
  }
  void move() {
    y+=.2;
    if (dir) {
      if (GetTile(x+1, y)!='.') {
        dir=!dir;
      } else {
        x+=.05;
      }
    } else {
      if (GetTile(x-.01, y)!='.') {
        dir=!dir;
      } else {
        x-=.05;
      }
    }
    if (GetTile(x, y+1)!='.'||GetTile(x+.85, y+1)!='.') {
      y = int(y);
    }
  }
  void show() {
    if (frameCount%15==1)
      foot=!foot;
    if (foot) {
      image(Goomba1, (x - offsetX)*tileWidth, (y - offsetY)*tileHeight, tileWidth, tileHeight);
    } else {
      image(Goomba2, (x - offsetX)*tileWidth, (y - offsetY)*tileHeight, tileWidth, tileHeight);
    }
  }
}
