import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;
import java.util.List;

public class problem1 {
    public static void main(String[] args) {

        StringBuilder content = new StringBuilder();

        try {
            BufferedReader br = new BufferedReader(new FileReader("data.txt"));
            String line;

            while ((line = br.readLine()) != null) {
                content.append(line).append(" ");
            }
            br.close();

        } catch (IOException e) {
            System.out.println("File error");
            return;
        }

        String text = content.toString().trim();
        text = text.replaceAll("\\s+", " ");   

        int charCount = text.replace(" ", "").length();

        String[] words = text.split(" ");
        int wordCount = words.length;

        String[] sentences = text.split("[.!?]");
        int sentenceCount = sentences.length;

        Map<String, Integer> freqMap = new HashMap<>();

        for (String word : words) {
            word = word.toLowerCase();
            freqMap.put(word, freqMap.getOrDefault(word, 0) + 1);
        }

        List<Map.Entry<String, Integer>> list = new ArrayList<>(freqMap.entrySet());
        list.sort((a, b) -> b.getValue() - a.getValue());

        System.out.println("\nReversed Sentences:");
        for (String s : sentences) {
            StringBuilder sb = new StringBuilder(s.trim());
            System.out.println(sb.reverse());
        }

        String a = new String("Java");
        String b = new String("Java");

        System.out.println("\nString Comparison:");
        System.out.println("Using == : " + (a == b));
        System.out.println("Using equals() : " + a.equals(b));

        System.out.println("\nResults:");
        System.out.println("Total Characters (excluding spaces): " + charCount);
        System.out.println("Total Words: " + wordCount);
        System.out.println("Total Sentences: " + sentenceCount);

        System.out.println("\nTop 5 Frequent Words:");
        for (int i = 0; i < Math.min(5, list.size()); i++) {
            System.out.println(list.get(i).getKey() + " : " + list.get(i).getValue());
        }
    }
}