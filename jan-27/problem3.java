import java.util.Scanner;
import java.util.logging.Logger;

class InvalidUsernameException extends Exception {
    public InvalidUsernameException(String message) {
        super(message);
    }
}

class InvalidAgeException extends Exception {
    public InvalidAgeException(String message) {
        super(message);
    }
}

class InvalidEmailException extends Exception {
    public InvalidEmailException(String message) {
        super(message);
    }
}

public class problem3 {

    private static final Logger logger = Logger.getLogger(problem3.class.getName());

    public static void validateUsername(String name) throws InvalidUsernameException {
        String usernameRegex = "^[A-Za-z0-9]{3,}$";
        if (name == null || !name.matches(usernameRegex)) {
            throw new InvalidUsernameException(
                "Username must contain only letters and numbers and be at least 3 characters long"
            );
        }
    }

    public static void validateAge(String ageStr) throws InvalidAgeException {
        String ageRegex = "^[0-9]{1,3}$";
        if (!ageStr.matches(ageRegex)) {
            throw new InvalidAgeException("Age must be a numeric value");
        }
        int age = Integer.parseInt(ageStr);
        if (age < 18) {
            throw new InvalidAgeException("Age must be at least 18 years");
        }
    }

    public static void validateEmail(String email) throws InvalidEmailException {
        String emailRegex =
                "^[a-zA-Z0-9._%+-]+@" +
                "[a-zA-Z0-9.-]+" +
                "\\.[a-zA-Z]{2,}$";
        if (email == null || !email.matches(emailRegex)) {
            throw new InvalidEmailException("Invalid email format");
        }
    }

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        boolean isValid = true;

        try {
            System.out.println("Enter username:");
            String name = sc.nextLine().trim();
            validateUsername(name);

            System.out.println("Enter age:");
            String ageInput = sc.nextLine().trim();
            validateAge(ageInput);

            System.out.println("Enter email:");
            String email = sc.nextLine().trim();
            validateEmail(email);

            logger.info("All validations passed successfully");

        } catch (InvalidUsernameException e) {
            logger.warning("Username Error: " + e.getMessage());
            isValid = false;

        } catch (InvalidAgeException e) {
            logger.warning("Age Error: " + e.getMessage());
            isValid = false;

        } catch (InvalidEmailException e) {
            logger.warning("Email Error: " + e.getMessage());
            isValid = false;

        } finally {
            if (isValid) {
                logger.info("Validation SUCCESS");
            } else {
                logger.info("Validation FAILED");
            }
            sc.close();
        }
    }
}
