import java.util.Scanner;

class Question2{
    public static void main(String args[]){
    Scanner sc = new Scanner(System.in);
    int n = sc.nextInt();

    printEven(n);

    int ans = Q2(n);
    System.out.println(ans);

    sc.close();
    }
    public static void printEven(int n){
        for(int i=0; i<=n; i++){
            if(i % 2 == 0){
                System.out.print(i+" ");
            }
            System.out.println();
        }
    }

    public static int Q2(int n){
       int sum = 0;
        for(int i=0; i<=n; i++){
            if(i % 2 == 0){
                sum += i;
            }
        }
        return sum;
    }

}