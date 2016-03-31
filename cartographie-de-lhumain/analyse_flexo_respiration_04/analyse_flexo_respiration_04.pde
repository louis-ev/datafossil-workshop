import processing.pdf.*;

String[] lines;
int index = 0;
int x=0 ;

int[][][] allVars; 

void setup() {

  background(255);
  lines = loadStrings("export_data/.txt");

  size( 900, 600);

  // reading rythm
  frameRate(60);

  String[] listeFichiers;
  listeFichiers = loadExports( "data_logs/flexo_louis-2");

  allVars = getVarsFromFiles( listeFichiers);
  
  smooth();

}

void draw() {
  
  background( 255);

  beginRecord(PDF, "plancheVis.pdf" );

  // afficher tous les points
  doViz( allVars, width, height/2); 

  translate( 0, height);
  scale( 1, -1);

  doViz( allVars, width, height/2); 

  endRecord();
  
  exit();

}