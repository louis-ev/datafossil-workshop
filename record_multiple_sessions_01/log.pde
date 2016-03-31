void createSessionFolder( String exportFolder) {
  // The data path of the folder to look in (write your own)
  java.io.File folder = new java.io.File(sketchPath( exportFolder ));

  // if the directory does not exist, create it
  if (!folder.exists()) {
    //System.out.println("creating directory: " + directoryName);
    boolean result = false;

    try {
      folder.mkdir();
      result = true;
    } 
    catch(SecurityException se) {
      //handle it
    }        
    if (result) {    
      System.out.println("DIR created");
      return;
    }
  }
  return;
  
}