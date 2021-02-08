import com.hamoid.*;

PGraphics pg;
PFont viga;

VideoExport videoExport;
boolean recording = false;

String texte = "FIER·E·X·S";

int t;

void setup(){
  size(1080, 1080);
  
  pg = createGraphics(d*16,d*16);
  viga = createFont("Viga-Regular.ttf",1000);
  
  frameRate(25);
  println("Press R to toggle recording");
  
  videoExport = new VideoExport(this, "05-cadreInclusif_1080x1080.mp4");
  videoExport.setFrameRate(25);  
  videoExport.startMovie();
}


void draw(){
  
  if (millis() - t >= 1000){
      drawPattern();
      t = millis();
  }

  if(recording) {
    videoExport.saveFrame();
    saveFrame("data/tiff/frame-#####.tiff");
    saveFrame("data/png/frame-#####.png");
  }
}
