import java.io.*;
import java.util.*;
import java.util.logging.Logger;

class InvalidAgeException extends Exception {
    public InvalidAgeException(String msg) {
        super(msg);
    }
} 
public class problem5 {

    private static final Logger logger =
            Logger.getLogger(problem5.class.getName());

    public void validateage(int age) throws InvalidAgeException {
        if (age < 18 || age > 60) {
            throw new InvalidAgeException("Age must be between 18 and 60");
        }
    }

    public String removemultiplespaces(String s) {
        return s.replaceAll("\\s+", " ").trim();
    }

    public static void main(String[] args) {

        problem5 obj = new problem5();

        Set<String> seen = new HashSet<>();
        List<String> Valid = new ArrayList<>();
        List<String> Invalid = new ArrayList<>();

        String inputFile ="problem5.txt";

        try (BufferedReader br = new BufferedReader(new FileReader(inputFile))) {
            String record;
            while ((record = br.readLine()) != null) {
                try { 
                    record = obj.removemultiplespaces(record);
                    String[] fields = record.split(","); 
                    if (fields.length != 3) { 
                        throw new IllegalArgumentException("Invalid record format");
                    }
                    String idStr = fields[0].trim(); 
                    String name = fields[1].trim();
                    String ageStr = fields[2].trim();
                    Integer id = Integer.valueOf(idStr);
                    Integer age = Integer.valueOf(ageStr);
                    obj.validateage(age); 
                    if (!seen.add(idStr)) {
                        throw new IllegalArgumentException("Duplicate ID");
                    }
                    Valid.add(id + "," + name + "," + age);
                } catch (NumberFormatException e) { 
                    Invalid.add(record + " --> Invalid numeric value");
                    logger.warning("Invalid number in record: " + record);
                } catch (InvalidAgeException | IllegalArgumentException e) {
                    Invalid.add(record + " --> " + e.getMessage());
                    logger.warning(e.getMessage() + " in record: " + record);
                }
            }
        } catch (IOException e) {
            logger.severe("Error reading input file: " + e.getMessage());
        } 
        String validFile =
                "rproblem5.txt";
        String invalidFile =
                "problem5.txt";

        writeToFile(validFile, Valid);
        writeToFile(invalidFile, Invalid);
        logger.info("File processing completed successfully");
    }
    private static void writeToFile(String path, List<String> records) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(path))) {
            for (String r : records) {
                bw.write(r); 
                bw.newLine();
            }
        } catch (IOException e) {
            Logger.getLogger(problem5.class.getName())
                  .severe("Error writing file: " + e.getMessage());
        }
    }
}