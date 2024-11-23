@isTest
private class FileCopierTest {
    static fflib_ApexMocks apexMocks;
    static FileManager fileManager;
    static FileCopier fileCopier;

    static void initialize(List<string> inputLines) {
        apexMocks = new fflib_ApexMocks();
        fileManager = (FileManager)apexMocks.mock(FileManager.class);
        fileCopier = new FileCopier(fileManager);

        apexMocks.startStubbing();
		apexMocks.when(fileManager.readFile('inputPath.txt')).thenReturn(inputLines);
		apexMocks.stopStubbing();
    }
  
    @isTest
    static void emptyList() {
        initialize(new List<String>());

        Boolean result = fileCopier.copyNumbers('inputPath.txt', 'outputPath.txt');

        Assert.isFalse(result, 'Expected result to be false.');  
        ((FileManager)apexMocks.verify(fileManager, fflib_ApexMocks.NEVER)).writeFile('outputPath.txt', new List<String>());
    }

    @isTest
    static void noNumbers() {
        initialize(new List<String>{'a', 'b', 'c'});

        Boolean result = fileCopier.copyNumbers('inputPath.txt', 'outputPath.txt');

        Assert.isFalse(result, 'Expected result to be false.');  
        ((FileManager)apexMocks.verify(fileManager, fflib_ApexMocks.NEVER)).writeFile('outputPath.txt', new List<String>());
    }

    @isTest
    static void allNumbers() {
        initialize(new List<String>{'1', '2', '3'});

        Boolean result = fileCopier.copyNumbers('inputPath.txt', 'outputPath.txt');
        
        Assert.isTrue(result, 'Expected result to be true.');  
        ((FileManager)apexMocks.verify(fileManager, 1)).writeFile('outputPath.txt', new List<String>{'1', '2', '3'});
    }

    @isTest
    static void someNumbers() {
        initialize(new List<String>{'a', '1', 'b', '2', 'c', '3'});

        Boolean result = fileCopier.copyNumbers('inputPath.txt', 'outputPath.txt');

        Assert.isTrue(result, 'Expected result to be true.');  
        ((FileManager)apexMocks.verify(fileManager, 1)).writeFile('outputPath.txt', new List<String>{'1', '2', '3'});
    }
}