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
      filesVar[i] = new int[lines.length][];

      for ( int j=0; j<lines.length; j++) {

        String[] pieces = split(lines[j], '\t');
        filesVar[i][j] = new int[pieces.length];

        println( "pieces.length " + pieces.length);

        if (pieces.length == 7) {
          for ( int k=0; k<pieces.length; k++) {              
            //println( "i = " + i + " k = " + k ); 
            filesVar[i][j][k] = int( pieces[k]);
            if( k == 2)
              println( "pieces[k] " + int( pieces[k]));
          }
        }
      }
    }
  }  

  return filesVar;
}