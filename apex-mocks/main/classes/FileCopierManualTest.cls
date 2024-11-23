@isTest
private class FileCopierManualTest {
    @isTest
    static void someNumbers() {
        MockFileManager fileManager = new MockFileManager();
        fileManager.linesToRead = new List<String>{'a', '1', 'b', '2', 'c', '3'};
        FileCopier fileCopier = new FileCopier(fileManager);

        Boolean result = fileCopier.copyNumbers('inputPath.txt', 'outputPath.txt');

        Assert.isTrue(result, 'Expected result to be true.');
        Assert.areEqual(new List<String>{'1', '2', '3'}, fileManager.linesWritten, 'Expected {1, 2, 3}');
    }

    class MockFileManager extends FileManager{
        public List<String> linesToRead;    // Set this to set the result of a readFile() call.
        public List<String> linesWritten;   // this captures what hase been passed to writeFile().

        public override List<String> readFile(String path){
            return linesToRead;
        }
     
        public override void writeFile(String path, List<String> lines){
            linesWritten = lines;
        }
    }
}