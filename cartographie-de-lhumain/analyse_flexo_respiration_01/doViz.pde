void doViz( int lightValue, int forceValue, int flexValue,  int pulse, int distance, int humidity, int temperature) {
    
  drawLine( lightValue);
  drawLine( forceValue);
  drawLine( flexValue);
  drawLine( pulse);
  drawLine( distance);
  drawLine( humidity);
  drawLine( temperature);

  index += 4;
}

void drawLine( int value) {
  
  stroke( 50);
  strokeWeight(1);
  noFill();  
  line( index, height, index, height-value);

  index++;
}

void drawPoint( int value) {
  
  stroke( 0);
  rect( index, height-value, .5, .5);
  
}