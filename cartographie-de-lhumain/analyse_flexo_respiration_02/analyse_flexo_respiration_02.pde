import processing.pdf.*;

String[] lines;
int index = 0;
int x=0 ;

int[][][] allVars; 

void setup() {

  background(255);
  lines = loadStrings("export_data/.txt");

  size( 900, 900);
  
  // reading rythm
  frameRate(60);
  
  String[] listeFichiers;
  listeFichiers = loadExports( "data_logs/flexo_louis-2");
  
  allVars = getVarsFromFiles( listeFichiers);
      
}

void draw() {

  // afficher tous les points
  doViz( allVars); 
  
}