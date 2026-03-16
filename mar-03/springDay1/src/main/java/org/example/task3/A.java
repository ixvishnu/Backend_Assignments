package org.example.task3;

public class A {
    private B b;
    public A() {
        System.out.println("A Constructor");
    }
    public void setB(B b) {
        this.b = b;
        System.out.println("B injected into A");
    }
}
