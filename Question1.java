import java.util.Scanner;
class Question1{
    public static void main(String args[]){
    Scanner sc = new Scanner(System.in);
    int n = sc.nextInt();

    Q1(n);

    sc.close();
    }
    public static void Q1(int n){
        if(n == 0){
            System.out.println("Zero");
        }
            if(n % 2 == 0){
                System.out.println("Even");
            }
            else{
                 System.out.println("odd");
            }
    }
}

