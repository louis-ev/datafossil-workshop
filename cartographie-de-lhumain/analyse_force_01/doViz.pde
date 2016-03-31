void doViz( int[][][] vars, int canvasWidth, int canvasHeight) {

  noFill();  


  for ( int i=0; i<vars.length; i++) {

    // retourne toutes les valeurs d'un champ d'un fichier en float de 0 à 1
    // régler le map dans la fonction mapValuesFromSensorsNumber tout en bas
    float[] flexValues = getAllValuesOfOneTypeForOneFile( vars, i, 1);    

    stroke( 0);
    strokeWeight( 1);


    beginShape();

    float prevYValue = 0;

    int prevPosX = 0;
    float prevPosY = canvasHeight;

    for ( int j= 0; j<flexValues.length; j++) {

      //if ( j == 0) {
      //  float posY = flexValues[j] * canvasHeight;
      //  prevPosY = posY;
      //  continue;
      //}

      if ( prevYValue == flexValues[j] && j > 1)
       continue;
      else 
       prevYValue = flexValues[j];

      int posX = int( map( j, 0, flexValues.length, 0, canvasWidth));
      float posY = height - flexValues[j] * canvasHeight;

      drawBezierVertexBetween( prevPosX, prevPosY, posX, posY);

      prevPosX = posX;
      prevPosY = posY;
    }


    //println( flexValues[i]);

    endShape();
  }
}

void drawBezierVertexBetween( int prevPosX, float prevPosY, int posX, float posY) {

  float ancre1X = lerp(prevPosX, posX, 0.7);
  float ancre1Y = lerp(prevPosY, posY, 0.0);
  float ancre2X = lerp(posX, prevPosX, 0.5);
  float ancre2Y = lerp(posY, prevPosY, 0.0);

  //  bezierVertex( ancre1X, ancre1Y, ancre2X, ancre2Y, posX, posY);  
  curveVertex( posX, posY);

  if ( keyPressed) {
    stroke( 255, 0, 0);
    strokeWeight(5);
    line( prevPosX, prevPosY, ancre1X, ancre1Y);
    line( ancre2X, ancre2Y, posX, posY);
  }
}


float[] getAllValuesOfOneTypeForOneFile( int[][][] vars, int fileNumber, int fieldNumber) {

  int getFileLength = vars[fileNumber].length;

  float[] allValues = new float[getFileLength];

  for ( int i=0; i<getFileLength; i++) {
    //println( " " + join( nf( vars[fileNumber][i], 0), " : ") );

    // mapper les valeurs en fonction du field sur 0 et 1
    float mappedValue = mapValuesFromSensorsNumber( vars[fileNumber][i][fieldNumber], fieldNumber);

    allValues[i] = mappedValue;
  }

  return allValues;
}


float mapValuesFromSensorsNumber( int originalValue, int fieldNumber) { 

  // mapper le capteur de pression
  if ( fieldNumber == 1)
    return map( originalValue, 0, 1050, 0, 1);
  // mapper le flexo sur le bon interval 
  if ( fieldNumber == 2)
    return map( originalValue, 252, 311, 0, 1);

  return originalValue;
}


PVector getExtremeValues( float[] vars) {

  PVector highestPoint = new PVector();

  // récupérer la valeur la plus élevée et son index
  highestPoint.x = 0;
  highestPoint.y = 0;

  for ( int i=0; i<vars.length; i++) {
    //println( "vars[" + i + "] = " + vars[i] );  
    if ( highestPoint.y < vars[i]) {
      highestPoint.x = i;
      highestPoint.y = vars[i];
    }
  }

  //println("highest Point x = " + highestPoint.x + " y = " + highestPoint.y);
  //println("—");

  return highestPoint;
}