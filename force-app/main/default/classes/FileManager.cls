public with sharing virtual class FileManager {
    public virtual List<String> readFile(String path){
        // Code not required for this demo.
        return new List<String>();
    }

    public virtual void writeFile(String path, List<String> lines){
        // Code not required for this demo.
        String x = path; // This is to suppress warnings.
    }
}