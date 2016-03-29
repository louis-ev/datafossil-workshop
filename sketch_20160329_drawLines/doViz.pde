void doViz( int lightValue, int forceValue, int flexValue,  int pulse, int distance, int humidity, int temperature) {
    
  drawLine( lightValue);
  drawLine( forceValue);
  drawLine( flexValue);
  drawLine( pulse);
  drawLine( distance);
  drawLine( humidity);
  drawLine( temperature);

  drawPoint( lightValue);
  drawPoint( forceValue);
  drawPoint( flexValue);
  drawPoint( pulse);
  drawPoint( distance);
  drawPoint( humidity);
  drawPoint( temperature);
  
}

void drawLine( int value) {
  
  stroke( 150,180);
  strokeWeight(1);
  noFill();  
  rect( frameCount, value, frameCount + 1, 0);
  
}

void drawPoint( int value) {
  
  stroke( 0);
  rect( frameCount, value, 1, 1);
  
}