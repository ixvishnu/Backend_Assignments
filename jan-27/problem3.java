import java.util.*;
import java.util.logging.Logger;

class InvalidUsernameException extends Exception{
    public InvalidUsernameException(String name){
        super(name);
    }
}

class InvalidAgeException extends Exception{
    public InvalidAgeException(String age){
        super(age);
    }
}

class InvalidEmailException extends Exception{
    public InvalidEmailException(String mail){
        super(mail);
    }
}

public class problem3 {

      
    public static void ValidateUsername(String name) throws InvalidUsernameException{
        if(name.length()<3){
            throw new InvalidUsernameException("Name must be greater than 3 char");
            }
        }

    public static void ValidateAge(int age) throws InvalidAgeException{
        if(age<18){
            throw new InvalidAgeException("Age must be greater than 18 years");
        }
    }

    public static void ValidateEmail(String email) throws InvalidEmailException{
        String emailRegex = 
         "^[a-zA-Z0-9.%+-]+@"+
         "[a-zA-Z0-9.-]+"+
         "\\.[a-zA-Z]{2,}$";
         if(!email.matches(emailRegex)){
            throw new InvalidEmailException("Invalid email");
         }
    }

    public static final Logger logger = Logger.getLogger(problem3.class.getName());
    public static void main(String[] args) {
      Scanner sc = new Scanner(System.in);
      boolean isValid = true;
      try{
        System.out.println("Enter name");
        String name = sc.nextLine();
        problem3.ValidateUsername(name);
        System.out.println("Enter age");
        int age = sc.nextInt();
        problem3.ValidateAge(age);
        sc.nextLine();
        System.out.println("Enter mail");
        String mail = sc.nextLine();
        problem3.ValidateEmail(mail);
        logger.info("All validation passed");
      }
      catch(InvalidAgeException e){
        logger.warning("Age error:"+e.getMessage());
        isValid=false;
      }
      catch(InvalidUsernameException e){
        logger.warning("Name exception:"+e.getMessage());
        isValid=false;
      }
      catch(InvalidEmailException e){
        logger.warning("Email exception:"+e.getMessage());
        isValid=false;
      }
      finally{
        if(isValid==true){
            logger.info("Validation success");
        }
        else{
            logger.info("validation failed");
        }
      }
      sc.close();
    }
}