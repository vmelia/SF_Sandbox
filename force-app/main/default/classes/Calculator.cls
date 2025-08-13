public with sharing class Calculator {
    private FileManager fileManager;
    public Calculator(FileManager fileManager) {
        this.fileManager = fileManager;
    }

    public void copyNumbers(String inputPath, String outputPath){
        List<String> inputLines = fileManager.readFile(inputPath);
        List<String> outputLines = new List<String>();
        for(String line: inputLines){
            if (line.isNumeric()){
                outputLines.add(line);
            }
        }

        fileManager.writeFile(outputPath, outputLines);
    }
}