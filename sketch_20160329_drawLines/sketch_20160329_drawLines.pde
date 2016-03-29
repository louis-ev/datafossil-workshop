import processing.pdf.*;

String[] lines;
int index = 0;
int x=0 ;

void setup() {
  background(255);
  lines = loadStrings("sensor_value.txt");

  size(1440, 450);
  
  // reading rythm
  frameRate(60);
  noSmooth();
  
  strokeCap(SQUARE);
  
  beginRecord(PDF, "plancheVis.pdf" );
  
  
  
}

void draw() {
  
  if( frameCount == lines.length-1) {
    endRecord();
    exit();
  }

  String[] pieces = split(lines[frameCount], '\t');
  if (pieces.length == 7) {
    doViz( int( pieces[0]), int( pieces[1]), int( pieces[2]), int( pieces[3]), int( pieces[4]), int( pieces[5]), int( pieces[6]) );
  }
  
  
}