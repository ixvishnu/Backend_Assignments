class Student {

    private int id;
    private String name;
    private int marks;

    public Student(int id, String name, int marks) {
        this.id = id;
        this.name = name;
        this.marks = marks;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMarks() {
        return marks;
    }

    public void setMarks(int marks) {
        this.marks = marks;
    }

    public boolean isPassed() {
        return marks >= 40;
    }

    public static void main(String[] args) {

        Student s1 = new Student(1, "alice", 78);
        Student s2 = new Student(2, "bob", 35);

        System.out.println(s1.getName() + " Passed: " + s1.isPassed());
        System.out.println(s2.getName() + " Passed: " + s2.isPassed());
    }
}
