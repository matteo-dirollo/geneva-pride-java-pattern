// VARIABLES
int x = 0;
int y = 0;
int d = 120;
int d2 = d / 2;
int d3 = d * 2;
int w = 1080;
int h = 1080;


void drawPattern() {
  
  background(255);
  noStroke();
  
  for( int x = 0; x < width; x += d) {
    for (int y = 0; y < height; y+= d) {
      
      
      fill(colors[int(random(0,11))]);
      
      float num = random(0,100);
      
      //sometimes, let's draw a circle
      //we can use the divisible by modulo %
      if (int(num) % 7 == 0) {
        triangle(x, y, x+d, y, x, y + d);
      } 
      else if (int(num) % 12 == 0){
        ellipse(x+d2, y+d2, d,d);
      }
       else if (int(num) % 8 == 0){
        triangle(x+d, y+d, x+d, y, x, y+d);
      }
        else if (int(num) % 6 == 0){
        triangle(x, y, x+d, y+d, x, y+d);
      }
        else if (int(num) % 5 == 0){
        triangle(x, y, x+d, y, x+d, y+d);
      }
      else {
        rect(x, y, d,d);
      }
    }
  }

}
