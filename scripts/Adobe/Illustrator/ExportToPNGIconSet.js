// Exports current document to dest as a PNG24 file with specified options,
// dest contains the full path including the file name,
// saveAsHTML option creates an HTML version with the PNG file in an images folder

function exportFileToPNG24(dest) {
  if (app.documents.length > 0) {
    var exportOptions = new ExportOptionsPNG24();
    exportOptions.antiAliasing = true;
	exportOptionsPNG24.horizontalScale = 256.0;
	exportOptions.saveAsHTML = false;
    exportOptions.transparency = true;    
	exportOptionsPNG24.verticalScale = 256.0;

    var type = ExportType.PNG24;
    var fileSpec = new File(dest);

    app.activeDocument.exportFile(fileSpec, type, exportOptions);
  }
}

function exportFileToPNG24(dest) {
  if (app.documents.length > 0) {
    var exportOptions = new ExportOptionsPNG24();
    exportOptions.antiAliasing = true;
	exportOptionsPNG24.horizontalScale = 128.0;
	exportOptions.saveAsHTML = false;
    exportOptions.transparency = true;    
	exportOptionsPNG24.verticalScale = 128.0;

    var type = ExportType.PNG24;
    var fileSpec = new File(dest);

    app.activeDocument.exportFile(fileSpec, type, exportOptions);
  }
}

function exportFileToPNG24(dest) {
  if (app.documents.length > 0) {
    var exportOptions = new ExportOptionsPNG24();
    exportOptions.antiAliasing = true;
	exportOptionsPNG24.horizontalScale = 64.0;
	exportOptions.saveAsHTML = false;
    exportOptions.transparency = true;    
	exportOptionsPNG24.verticalScale = 64.0;

    var type = ExportType.PNG24;
    var fileSpec = new File(dest);

    app.activeDocument.exportFile(fileSpec, type, exportOptions);
  }
}

function exportFileToPNG24(dest) {
  if (app.documents.length > 0) {
    var exportOptions = new ExportOptionsPNG24();
    exportOptions.antiAliasing = true;
	exportOptionsPNG24.horizontalScale = 32.0;
	exportOptions.saveAsHTML = false;
    exportOptions.transparency = true;    
	exportOptionsPNG24.verticalScale = 32.0;

    var type = ExportType.PNG24;
    var fileSpec = new File(dest);

    app.activeDocument.exportFile(fileSpec, type, exportOptions);
  }
}

function exportFileToPNG24(dest) {
  if (app.documents.length > 0) {
    var exportOptions = new ExportOptionsPNG24();
    exportOptions.antiAliasing = true;
	exportOptionsPNG24.horizontalScale = 20.0;
	exportOptions.saveAsHTML = false;
    exportOptions.transparency = true;    
	exportOptionsPNG24.verticalScale = 20.0;

    var type = ExportType.PNG24;
    var fileSpec = new File(dest);

    app.activeDocument.exportFile(fileSpec, type, exportOptions);
  }
}

function exportFileToPNG24(dest) {
  if (app.documents.length > 0) {
    var exportOptions = new ExportOptionsPNG24();
    exportOptions.antiAliasing = true;
	exportOptionsPNG24.horizontalScale = 16.0;
	exportOptions.saveAsHTML = false;
    exportOptions.transparency = true;    
	exportOptionsPNG24.verticalScale = 16.0;

    var type = ExportType.PNG24;
    var fileSpec = new File(dest);

    app.activeDocument.exportFile(fileSpec, type, exportOptions);
  }
}