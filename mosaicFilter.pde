/*------------------------------------
|    Mosaic Filter                    |
|        Coded by: Erik Dillaman      |
 ------------------------------------*/
 
PImage img, mini;
int w, h;
int scl = 8;

void setup()
{
  pixelDensity(2);
  stroke(0);
  size(10, 10);
  img = loadImage("image.jpg");
  surface.setSize(img.width, img.height);

  w = img.width/scl;
  h = img.height/scl;

  mini = createImage(w, h, RGB);
  mini.copy(img, 0, 0, width, height, 0, 0, w, h);
}

void draw()
{
  background(0);
  mini.loadPixels();
  for (int y = 0; y < h; y++) {
    for (int x = 0; x < w; x++) {
      int index = y*w+x;
      int r = int(red(mini.pixels[index]));
      int g = int(green(mini.pixels[index]));
      int b = int(blue(mini.pixels[index]));
      fill(r, g, b);
      if (g>200){
        rect(scl*x, scl*y, scl, scl);
      } else if (g>150){
        rect(scl*x+2, scl*y+2, scl, scl);
      } else if (g>100){
        rect(scl*x+4, scl*y+4, scl, scl);
      } else {
        rect(scl*x+6, scl*y+6, scl, scl);
      }
    }
  }
}

void mouseClicked()
{
  saveFrame("screenshot.png");  
}
