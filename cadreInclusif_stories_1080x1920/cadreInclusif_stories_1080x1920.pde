import com.hamoid.*;

PGraphics pg;
PFont viga;

VideoExport videoExport;
boolean recording = false;


//click to make a pattern
color noir = #000000;
color blanc = #ffffff;
color marron = #663300;
color orange = #ff9933;
color vert = #009933;
color rose = #ff99cc;
color jaune = #ffff33; 
color violet = #732886; 
color azure = #66ccff; 
color rouge = #e61f27; 
color bleu = #3c61ab; 

color [] colors = {noir, blanc, marron, orange, vert, rose, jaune, violet, azure, rouge, bleu};

//String texte = "FIEREX·E·S";


int x = 0;
int y = 0;
int d = 120;
int d2 = d / 2;
int d3 = d * 2;
int w = 1080;
int h = 1920;


void setup(){
  size(1080, 1920);
  //colorMode(HSB,100);
  
  pg = createGraphics(d*7,d*10);
  viga = createFont("Viga-Regular.ttf",1000);
  
  frameRate(0.8);
  println("Press R to toggle recording");

  
  videoExport = new VideoExport(this, "04-cadreInclusif_stories_1080x1920.mp4");
  videoExport.setFrameRate(0.8);  
  videoExport.startMovie();
  

}





void draw(){

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
  
  pg.beginDraw();
  //pg.textFont(viga);
  //pg.textAlign(CENTER, CENTER);
  //pg.textSize(48);
  //pg.textLeading(56);  // Set leading to 10
  //pg.text(lines, 10, 25);
  pg.fill(0);
  //pg.background(255);
  
  pg.push();
  pg.translate(pg.width/2,pg.height/2);
  //pg.text(texte,0,0);
  
  pg.pop();
  
  pg.endDraw();
  
  imageMode(CENTER);
  image(pg, w/2, h/2);
  


  if(recording) {
    videoExport.saveFrame();
  }

  saveFrame("png_sansFond/frame-#####.png");
}

void keyPressed() {
  if(key == 'r' || key == 'R') {
    recording = !recording;
    println("Recording is " + (recording ? "ON" : "OFF"));
  }
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
