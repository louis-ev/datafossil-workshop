/* CLIENT
 * oscP5multicast by andreas schlegel
 * example shows how to send osc via a multicast socket.
 * what is a multicast? http://en.wikipedia.org/wiki/Multicast
 * ip multicast ranges and uses:
 * 224.0.0.0 - 224.0.0.255 Reserved for special well-known multicast addresses.
 * 224.0.1.0 - 238.255.255.255 Globally-scoped (Internet-wide) multicast addresses.
 * 239.0.0.0 - 239.255.255.255 Administratively-scoped (local) multicast addresses.
 * oscP5 website at http://www.sojamo.de/oscP5
 */


import java.text.SimpleDateFormat;
import java.util.Date;

boolean recordNewFile;

////// MULTICAST - OSC //////

import oscP5.*;
import netP5.*;
OscP5 oscP5;


//////////  VALUES FROM SERVER  //////////   

float lightValue; // LDR light
float forceValue; // FSR force
float flexValue; // FLEX
float pulseValue; // pouls
float distanceValue; // DISTANCE sonar sensor
float humidityValue; // humidity
float temperatureValue; // temp

PrintWriter output;

void setup() {
  size(750, 600);
  noSmooth();
  
  createSessionFolder( "data_logs/");

  oscP5 = new OscP5(this, "239.0.0.1", 7777);  
    
}


void draw() {

  if ( recordNewFile) {
    output.println( lightValue + "\t" + forceValue + "\t" + flexValue + "\t" + pulseValue + "\t" + distanceValue + "\t" + humidityValue + "\t" + temperatureValue);
  }

  // draw with values from sensorShield
  dataVis();

}


void createNewLogFile() {
  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd@HH_mm_ss");
  Date d = new Date();
  String fileName = formatter.format(d);
  
  output = createWriter("data_logs/" + fileName + ".txt");
  
  recordNewFile = true;
  
}

void saveAndCloseLogFile() {
  recordNewFile = false;
  
  output.flush(); // Write the remaining data
  output.close(); // Finish the file
}

void keyPressed() {
  println("pressed");
  createNewLogFile();
}
void keyReleased() {
  println("released");
  saveAndCloseLogFile(); 
}