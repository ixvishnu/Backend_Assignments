public class Employee {

    int id;
    String name;
    double monthlySalary;
    static String companyName = "Innovatechs";

    Employee(int id, String name, double monthlySalary) {
        this.id = id;
        this.name = name;
        this.monthlySalary = monthlySalary;
    }

    double calculateAnnualSalary(y) {
        return monthlySalary * 12;
    }

    void displayEmployeeDetails() {
        System.out.println("ID: " + id);
        System.out.println("Name: " + name);
        System.out.println("Company: " + companyName);
        System.out.println("Monthly Salary: " + monthlySalary);
        System.out.println("Annual Salary: " + calculateAnnualSalary());
        System.out.println("-------------------------");
    }

    public static void main(String[] args) {

        Employee emp1 = new Employee(101, "Ramesh", 25000);
        Employee emp2 = new Employee(102, "Suresh", 32000);

        emp1.displayEmployeeDetails();
        emp2.displayEmployeeDetails();
    }
}
