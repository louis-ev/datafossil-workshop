
////// DRAW USING VALUES FROM SERVER //////

void dataVis() {

  background(255);

  // textes
  fill(0);
  text("LUMIÈRE", 125, 200); 
  text("PRESSION", 275, 200);
  text("FLEXION", 425, 200);
  text("POULS", 575, 200);
  text("DISTANCE", 125, 500); 
  text("HUMIDITÉ", 270, 500);
  text("TEMPÉRATURE", 410, 500);



  noFill();
  stroke(0);

  // values from the server  

  ////// LIGHT //////
  float mapLightValue =  map(lightValue, 140, 420, 0, 100);
  ellipse(150, 100, mapLightValue, mapLightValue);

  ////// FORCE //////
  float mapForceValue =  map(forceValue, 20, 940, 0, 100);
  ellipse(300, 100, mapForceValue, mapForceValue);

  ////// FLEX ////// 
  float mapFlexValue =  map(flexValue, 330, 200, 0, 100);
  ellipse(450, 100, mapFlexValue, mapFlexValue);

  ////// POULS //////  
  // constrain pulseValue to not exceed a maximum and a minimum value 
  float constPulseValue = constrain(pulseValue, 470, 600); 
  float mapPulseValue =  map(constPulseValue, 470, 600, 20, 100);
  ellipse(600, 100, mapPulseValue, mapPulseValue);

  ////// DISTANCE //////  
  float mapDistanceValue =  map(distanceValue, 14, 160, 100, 10);
  ellipse(150, 400, mapDistanceValue, mapDistanceValue);

  ////// HUMIDITY + TEMPERATURE //////
  float mapHumidityValue =  map(humidityValue, 30, 100, 0, 100);
  ellipse(300, 400, mapHumidityValue, mapHumidityValue);

  float mapTemperatureValue =  map(temperatureValue, 16, 30, 10, 100);
  ellipse(450, 400, mapTemperatureValue, mapTemperatureValue);
}