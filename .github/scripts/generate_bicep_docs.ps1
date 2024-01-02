# Script to generate README.md files for each main Bicep template using PSDocs

# Get all main.bicep files in the bicep/** directory and its subdirectories
$mainBicepFiles = Get-ChildItem -Path "bicep/**" -Filter "main.bicep" -Recurse

foreach ($mainBicepFile in $mainBicepFiles) {
  # Get the directory that the main.bicep file is in
  $directory = Split-Path -Path $mainBicepFile.FullName

  # Compile the main.bicep file into a main.json file
  $templateFile = "$directory/main.json"
  & bicep build $mainBicepFile.FullName --outfile $templateFile

  # Generate a README.md file
  Invoke-PSDocument -Module PSDocs.Azure -OutputPath $directory -InputObject $templateFile -InstanceName "README" -Culture "en-US"

  # Delete the main.json file
  Remove-Item $templateFile
}
