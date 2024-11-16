public with sharing class FileCopier {
    private FileManager fileManager;
    public FileCopier(FileManager fileManager) {
        this.fileManager = fileManager;
    }

    public Boolean copyNumbers(String inputPath, String outputPath){
        List<String> inputLines = fileManager.readFile(inputPath);
        
        List<String> outputLines = new List<String>();
        for(String line: inputLines){
            if (line.isNumeric()){
                outputLines.add(line);
            }
        }

        if (!outputLines.isEmpty()){
            fileManager.writeFile(outputPath, outputLines);
            return true;
        }

        return false;
    }
}