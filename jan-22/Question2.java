import java.util.Scanner;

class Question2{
    public static void main(String[] args) {
        
        try(Scanner sc = new Scanner(System.in);) {
        while (true) {
            System.out.println("Enter a Number: ");
            int n = sc.nextInt();

            if (n > 0) {

                System.out.println("\nNumbers from 1 to " + n + " are:");
                for (int i = 1; i <= n; i++) {
                    System.out.print(" " + i);
                }

                System.out.println("\nEven Numbers from 1 to " + n + " are:");
                int i = 2;
                while (i <= n) {
                    if ((i & 1) == 0) {
                        System.out.print(" " + i);
                    }
                    i += 2;
                }

                int sum = (n * (n + 1)) / 2;
                System.out.println("\nSum of first " + n + " natural numbers is: " + sum);
            } else {
                System.out.println("\n Enter Positive Number");
            }
        }
        } catch (Exception e) {
            System.out.println("The Error is:"+e.getClass());
        }
    }
}