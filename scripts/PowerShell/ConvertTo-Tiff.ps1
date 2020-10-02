# ConvertTo-Tiff - Converts image files to the lossless Tiff format
# modification of https://github.com/DavidAnson/ConvertTo-Heic


<#
Converting Files
Passing parameters:

PS C:\T> .\ConvertTo-Heic.ps1 C:\T\Pictures\IMG_1234.BMP C:\T\Pictures\IMG_5678.CR2
C:\T\Pictures\IMG_1234.BMP -> IMG_1234.BMP.heic
C:\T\Pictures\IMG_5678.CR2 -> IMG_5678.CR2.heic
Pipeline via dir:

PS C:\T> dir C:\T\Pictures | .\ConvertTo-Heic.ps1
C:\T\Pictures\IMG_1234.BMP -> IMG_1234.BMP.heic
C:\T\Pictures\IMG_5678.CR2 -> IMG_5678.CR2.heic
C:\T\Pictures\Kitten.heic [Already HEIC]
C:\T\Pictures\Notes.txt [Unsupported]
Pipeline via Get-ChildItem:

PS C:\T> Get-ChildItem C:\T\Pictures -Filter *.BMP | .\ConvertTo-Heic.ps1
C:\T\Pictures\IMG_1234.BMP -> IMG_1234.BMP.heic
#>

Param (
    [Parameter(
        Mandatory = $true,
        Position = 1,
        ValueFromPipeline = $true,
        ValueFromPipelineByPropertyName = $true,
        ValueFromRemainingArguments = $true,
        HelpMessage = "Array of image file names to convert to Tiff")]
    [Alias("FullName")]
    [String[]]
    $Files
)

Begin
{
    # Technique for await-ing WinRT APIs: https://fleexlab.blogspot.com/2018/02/using-winrts-iasyncoperation-in.html
    Add-Type -AssemblyName System.Runtime.WindowsRuntime
    $runtimeMethods = [System.WindowsRuntimeSystemExtensions].GetMethods()
    $asTaskGeneric = ($runtimeMethods | ? { $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1' })[0]
    Function AwaitOperation ($WinRtTask, $ResultType)
    {
        $asTaskSpecific = $asTaskGeneric.MakeGenericMethod($ResultType)
        $netTask = $asTaskSpecific.Invoke($null, @($WinRtTask))
        $netTask.Wait() | Out-Null
        $netTask.Result
    }
    $asTask = ($runtimeMethods | ? { $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and $_.GetParameters()[0].ParameterType.Name -eq 'IAsyncAction' })[0]
    Function AwaitAction ($WinRtTask)
    {
        $netTask = $asTask.Invoke($null, @($WinRtTask))
        $netTask.Wait() | Out-Null
    }

    # Reference WinRT assemblies
    [Windows.Storage.StorageFile, Windows.Storage, ContentType=WindowsRuntime] | Out-Null
    [Windows.Graphics.Imaging.BitmapDecoder, Windows.Graphics, ContentType=WindowsRuntime] | Out-Null
}

Process
{
    # Check dependencies
	<#
    if (([Windows.Graphics.Imaging.BitmapEncoder]::TiffEncoderId -eq $null) -or ([Windows.Graphics.Imaging.BitmapDecoder]::TiffEncoderId -eq $null))
    {
        Write-Error "Tiff encoder/decoder not present. Please see README.md for more information."
        Exit
    }
#>
    # Summary of imaging APIs: https://docs.microsoft.com/en-us/windows/uwp/audio-video-camera/imaging
    foreach ($file in $Files)
    {
        Write-Host $file -NoNewline
        try
        {
            try
            {
                # Get SoftwareBitmap from input file
                $file = Resolve-Path -LiteralPath $file
                $inputFile = AwaitOperation ([Windows.Storage.StorageFile]::GetFileFromPathAsync($file)) ([Windows.Storage.StorageFile])
                $inputFolder = AwaitOperation ($inputFile.GetParentAsync()) ([Windows.Storage.StorageFolder])
                $inputStream = AwaitOperation ($inputFile.OpenReadAsync()) ([Windows.Storage.Streams.IRandomAccessStreamWithContentType])
                $decoder = AwaitOperation ([Windows.Graphics.Imaging.BitmapDecoder]::CreateAsync($inputStream)) ([Windows.Graphics.Imaging.BitmapDecoder])
            }
            catch
            {
                # Ignore non-image files
                Write-Host " [Unsupported]"
                continue
            }
            if ($decoder.DecoderInformation.CodecId -eq [Windows.Graphics.Imaging.BitmapDecoder]::TiffEncoderId)
            {
                # Skip Tiff-encoded files
                Write-Host " [Already Tiff]"
                continue
            }
            $bitmap = AwaitOperation ($decoder.GetSoftwareBitmapAsync()) ([Windows.Graphics.Imaging.SoftwareBitmap])

            # Write SoftwareBitmap to output file
            $outputFileName = $inputFile.Name + ".tiff";
            $outputFile = AwaitOperation ($inputFolder.CreateFileAsync($outputFileName, [Windows.Storage.CreationCollisionOption]::ReplaceExisting)) ([Windows.Storage.StorageFile])
            $outputStream = AwaitOperation ($outputFile.OpenAsync([Windows.Storage.FileAccessMode]::ReadWrite)) ([Windows.Storage.Streams.IRandomAccessStream])
            $encoder = AwaitOperation ([Windows.Graphics.Imaging.BitmapEncoder]::CreateAsync([Windows.Graphics.Imaging.BitmapEncoder]::TiffEncoderId, $outputStream)) ([Windows.Graphics.Imaging.BitmapEncoder])
            $encoder.SetSoftwareBitmap($bitmap)
            $encoder.IsThumbnailGenerated = $true

            # Do it
            AwaitAction ($encoder.FlushAsync())
            Write-Host " -> $outputFileName"
        }
        catch
        {
            # Report full details
            throw $_.Exception.ToString()
        }
        finally
        {
            # Clean-up
            if ($inputStream -ne $null) { [System.IDisposable]$inputStream.Dispose() }
            if ($outputStream -ne $null) { [System.IDisposable]$outputStream.Dispose() }
        }
    }
}
