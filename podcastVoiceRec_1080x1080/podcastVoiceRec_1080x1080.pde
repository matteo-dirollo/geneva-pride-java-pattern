import com.hamoid.*;
import ddf.minim.*;

PGraphics pg;
PFont viga;

VideoExport videoExport;
boolean recording = false;

String texte = "FIER·E·X·S";

int t;

Minim minim;
AudioInput in;

void setup()
{
  size(540, 540);
  frameRate(25);
  
  pg = createGraphics(d*16,d*16);
  viga = createFont("Viga-Regular.ttf",1000);
  
  minim = new Minim(this);
  
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  
  videoExport = new VideoExport(this, "05-cadreInclusif_1080x1080.mp4");
  videoExport.setFrameRate(25);  
  videoExport.startMovie();

}

void draw()
{
  background(255);
    
  if (millis() - t >=  2000){
   
   strokeWeight(2);
   stroke(colors2[int(random(0,10))]);
   t = millis();
    } 
  
  
  // draw the waveforms so we can see what we are monitoring
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    //line( i, 250 + in.left.get(i)*80, i+1, 250 + in.left.get(i+1)*80 );
    line( i, 250 + in.right.get(i)*300, i+1, 250 + in.right.get(i+1)*300 );
  }
  
 
  println(millis()+" | "+t);
  
    if(recording) {
    videoExport.saveFrame();
    //saveFrame("tiff/frame-#####.tiff");
    //saveFrame("png/frame-#####.png");
  }

}
