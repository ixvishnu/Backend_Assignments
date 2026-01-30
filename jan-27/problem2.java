import java.util.*;
public class problem2 {
    public static void main(String[] args) {
        String[] names = {"vishnu","sairaj","sandy","vishnu"};

        ArrayList<String> al_names = new ArrayList<>();
        for(String i:names){    
            al_names.add(i);
        }
        System.out.println("Arraylist: ");
        System.out.println(al_names);

        HashSet<String> hs_names = new HashSet<>();
        for(String i : names){
            hs_names.add(i);
        }
        System.out.println("Hashset:");
        System.out.println(hs_names);

        HashMap <String, Integer> hm_names = new HashMap<>();
        for(String i : names){
            if(hm_names.containsKey(i)){
                hm_names.put(i,hm_names.get(i)+1);
            }
            else{
                hm_names.put(i, 1);
            }
        }
        System.out.println("Hashmap:");
        System.out.println(hm_names);


        System.out.println("Hashmap using foreach:");
        hm_names.forEach((k,v) -> System.out.println(k+ " - " +v));

        System.out.println("HashMap using keyset:");
        for(String key : hm_names.keySet()){
            System.out.println(key + " - " +hm_names.get(key));
        }

        System.out.println("Hashmap using entryset:");
        for(Map.Entry<String,Integer> entry : hm_names.entrySet()){
            System.out.println(entry.getKey() + " - " + entry.getValue());
        }

        System.out.println("Arraylist using foreach:");
        for(String s : al_names){
            System.out.println(s);
        }

        System.out.println("Hashset using iterator:");
        Iterator<String> it = hs_names.iterator();
        while (it.hasNext()) {
            System.out.println(it.next());
        }
    }
}
