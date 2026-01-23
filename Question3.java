import java.util.Scanner;

public class Question3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int a = sc.nextInt();
        int b = sc.nextInt();
        int n = sc.nextInt();
        int num = sc.nextInt();
        int sum = add(a, b);
        boolean even = isEven(n);
        int factorial = findFactorial(num);

        System.out.println("Sum: " + sum);
        System.out.println("Is Even: " + even);
        System.out.println("Factorial: " + factorial);

        sc.close();
    }
    public static int add(int a, int b){
        return a+b;
    }
    public static boolean isEven(int n){
        boolean flag = false;
        if(n % 2 != 0){
            flag = true; 
        }
        return flag;
    }
    public static int findFactorial(int num){
        int ans = 1;
        if(num == 0){
            return ans;
        }
        for(int i=1; i<= num; i++){
            ans *= i;
        }
        return ans;
    }
}

