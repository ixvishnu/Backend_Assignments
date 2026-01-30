import java.util.*;
import java.util.logging.Logger;
public class problem4 {
    private static final Logger logger = Logger.getLogger(problem4.class.getName());
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        ArrayList<Integer> nums1=new ArrayList<>();
        ArrayList<Double> nums2=new ArrayList<>();
        System.out.println("Enter numbers:(enter ok to exit)");
        while(true){
            String s=sc.nextLine();
            if(s.equalsIgnoreCase("ok")){
                break;
            }
            try{
                if(s.contains(".")){
                    Double d=Double.valueOf(s);
                    nums2.add(d);
                }
                else{
                    Integer i=Integer.valueOf(s);
                    nums1.add(i);
                }
            }
            catch(NumberFormatException e){
                logger.warning("Invalid input"+s);
            }
        }
        int sum=0;
        double dsum=0;
        for(int i1:nums1){
            sum+=i1;
        }
        for(double j:nums2){
            dsum+=j;
        }
        System.out.println("Sum of all Integers:"+sum);
        if(nums2.size()==0){
            System.out.println("Average of Floating point numbers is :NaN");
        }
        else{
            System.out.println("Average of Floating point numbers is:"+(dsum/nums2.size()));
        }
        sc.close();
    }
}