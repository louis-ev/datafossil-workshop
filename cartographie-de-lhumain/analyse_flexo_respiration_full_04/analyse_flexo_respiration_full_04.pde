import processing.pdf.*;

String[] lines;
int index = 0;
int x=0 ;

int[][][] allVars; 

void setup() {

  background(255);

  size( 900, 600);

  // reading rythm
  frameRate(60);

  String[] listeFichiers;
  listeFichiers = loadExports( "data_logs/emilie_flexo");

  allVars = getVarsFromFiles( listeFichiers);

  smooth();
}

void draw() {

  background( 255);

  beginRecord(PDF, "plancheVis.pdf" );

  // afficher tous les points
  doViz( allVars, width, height); 


  endRecord();
  exit();
}