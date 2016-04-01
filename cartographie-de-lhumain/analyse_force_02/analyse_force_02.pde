import processing.pdf.*;

String[] lines;
int index = 0;
int x=0 ;

int[][][] allVars; 

import peasy.*;

PeasyCam cam;

void setup() {

  background(255);

  size( 900, 600);

  // reading rythm
  frameRate(60);

  String[] listeFichiers;
  listeFichiers = loadExports( "data_logs/louis_force");

  allVars = getVarsFromFiles( listeFichiers);

  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);

}

void draw() {

  background( 255);

  beginRecord(PDF, "plancheVis.pdf" );

  // afficher tous les points
  doViz( allVars, width, height - 100); 


  //endRecord();
  //exit();
}