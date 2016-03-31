void doViz( int[][][] vars) {
 
  noFill();  
  stroke( 0);
  strokeWeight( 5);
  
    background( 255);

  for( int i=0; i<vars.length; i++) {
    
    // retourne toutes les valeurs d'un champ d'un fichier en float de 0 à 1
    // régler le map dans la fonction mapValuesFromSensorsNumber tout en bas
    float[] flexValues = getAllValuesOfOneTypeForOneFile( vars, i, 2);    

    fill( 80, 82);

    beginShape();
    vertex( 0, height);
    
    float prevYValue = 0;
    
    int prevPosX = 0;
    float prevPosY = 0;
    
    for( int j= 1; j<flexValues.length; j++) {
      
      if( prevYValue == flexValues[j])
        continue;
      else 
        prevYValue = flexValues[j];
      
      int posX = int( map( j, 0, flexValues.length, 0, width));
      float posY = flexValues[j] * height;
      
      drawBezierVertexBetween( prevPosX, prevPosY, posX, posY);
      
      prevPosX = posX;
      prevPosY = posY;
      
      
    }
    
    vertex( width, height);
    endShape( CLOSE);
    //println( flexValues[i]);
    
  }
    
}

void drawBezierVertexBetween( int prevPosX, float prevPosY, int posX, float posY) {
  
  float ancre1X = lerp(prevPosX, posX, .4);
  float ancre1Y = lerp(prevPosY, posY, .4);
  float ancre2X = lerp(posX, prevPosX, .4);
  float ancre2Y = lerp(posY, prevPosY, .4);
  
  bezierVertex( ancre1X, ancre1Y, ancre2X, ancre2Y, posX, posY);  
}

// les beziers ne marchent pas
// faire la symétrie



float[] getAllValuesOfOneTypeForOneFile( int[][][] vars, int fileNumber, int fieldNumber) {
  
  int getFileLength = vars[fileNumber].length;
  
  float[] allValues = new float[getFileLength];
  
  for( int i=0; i<getFileLength; i++) {
    //println( " " + join( nf( vars[fileNumber][i], 0), " : ") );
    
    // mapper les valeurs en fonction du field sur 0 et 1
    float mappedValue = mapValuesFromSensorsNumber( vars[fileNumber][i][fieldNumber], fieldNumber);
    
    allValues[i] = mappedValue;
  }
  
  return allValues;
}

float mapValuesFromSensorsNumber( int originalValue, int fieldNumber) { 
  
  // mapper le flexo sur le bon interval 
  if( fieldNumber == 2)
    return map( originalValue, 254, 310, 0, 1);
  
  return originalValue;
}