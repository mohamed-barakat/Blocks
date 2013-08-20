##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "AutoDoc" );

PrintTo( "VERSION", PackageInfo( "Blocks" )[1].Version );

 bib := ParseBibFiles( "doc/Blocks.bib" );
 WriteBibXMLextFile( "doc/BlocksBib.xml", bib );

AutoDoc( "Blocks",
	rec( scaffold := false,
	     autodoc := true,
             gapdoc := true ) );


