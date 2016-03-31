import processing.pdf.*;

String[] lines;
int index = 0;
int x=0 ;

int[][][] flexoVar; 

void setup() {

  background(255);
  lines = loadStrings("export_data/.txt");

  size(1600, 600);
  
  // reading rythm
  frameRate(60);
  noSmooth();
  
  String[] listeFichiers;
  listeFichiers = loadExports( "data_logs/flexo_louis");
  
  flexoVar = getVarsFromFiles( listeFichiers);
      
}

void draw() {

  
}