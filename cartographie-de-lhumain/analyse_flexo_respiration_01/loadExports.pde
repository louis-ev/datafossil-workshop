String[] loadExports( String sousDossierExport) {

  java.io.File folder = new java.io.File(sketchPath( sousDossierExport ));
  String[] nomFichiersACharger = {""};

  // let's set a filter (which returns true if file's extension is .png)
  java.io.FilenameFilter txtFilter = new java.io.FilenameFilter() {
    public boolean accept(File dir, String name) {
      return name.toLowerCase().endsWith(".txt");
    }
  };


  // list the files in the data folder, passing the filter as parameter
  String[] filenames = folder.list(txtFilter);

  if ( filenames != null ) {
    // get and display the number of jpg files
    println(filenames.length + " txt files in " + sousDossierExport);

    nomFichiersACharger = new String[filenames.length];

    // display the filenames
    for (int i = 0; i < filenames.length; i++) {
      println( filenames[i] + " - " );
      nomFichiersACharger[i] = sousDossierExport + "/" + filenames[i];
    }

    return nomFichiersACharger;
  }  
  println( "le chargement de fichiers a échoué");
  exit();

  return nomFichiersACharger;
}

int[][][] getVarsFromFiles( String[] allFiles) {

  int[][][] filesVar;

  filesVar = new int[allFiles.length][][];

  for (int i = 0; i < allFiles.length; i++) {
    //print( "nom fichier : " + allFiles[i]);
    lines = loadStrings( allFiles[i]);

    println( "allfiles.length " + allFiles.length);

    if ( lines.length > 0) {
      filesVar[i] = new int[lines.length-1][];

      for ( int j=0; j<lines.length-1; j++) {

        String[] pieces = split(lines[frameCount], '\t');
        filesVar[i][j] = new int[pieces.length-1];

        println( "pieces.length " + pieces.length);

        if (pieces.length == 7) {
          for ( int k=0; k<pieces.length-1; k++) {              
            println( "i = " + i + " k = " + k ); 
            println( "pieces[k] " + int( pieces[k]));
            filesVar[0][0][0] = 0;
            filesVar[i][j][k] = int( pieces[k]);
          }
        }
      }
    }
  }  

  return filesVar;
}