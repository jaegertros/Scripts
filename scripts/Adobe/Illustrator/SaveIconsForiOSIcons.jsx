var destFolder = null;
destFolder = Folder.selectDialog( 'Select the folder where you want to save the exported files.', app.activeDocument.path );

var baseDestName = app.activeDocument.name;

if (baseDestName.indexOf('.') < 0) 
{
    //nothing
} else {
    var dot = baseDestName.lastIndexOf('.');
    baseDestName = baseDestName.substring(0, dot);
}

var activeArtboard = app.activeDocument.artboards[app.activeDocument.artboards.getActiveArtboardIndex()];

if (destFolder != null)
{
    	// iOS 7
	exportFileToPNG24(256,"icon-256"); // iPhone App Icon Non-Retina
	exportFileToPNG24(128,"icon-128"); // iPhone  App Icon
	exportFileToPNG24(64,"icon-64");  // iPad App Icon Non-Retina
	exportFileToPNG24(32,"icon-32"); // iPad App Icon
	exportFileToPNG24(20,"icon-20");  // Spotlight Non-Retina
	exportFileToPNG24(16,"icon-16"); // Settings Non-Retina
}

function exportFileToPNG24(iconSize, name) 
{ 
	var scale = iconSize / activeArtboard.artboardRect[2] * 100;
	
	if ( app.documents.length > 0 ) 
	{
		var exportOptions = new ExportOptionsPNG24();
		var type = ExportType.PNG24;
		var fileSpec = new File ("" + destFolder + "/" + name );
		exportOptions.verticalScale = scale;
		exportOptions.horizontalScale = scale;
		exportOptions.antiAliasing = true;
		exportOptions.transparency = true;
		exportOptions.artBoardClipping = true;
		app.activeDocument.exportFile (fileSpec, type, exportOptions);
	}
}