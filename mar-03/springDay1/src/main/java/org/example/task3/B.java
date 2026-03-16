package org.example.task3;

public class B {
    private A a;
    public B() {
        System.out.println("B Constructor");
    }
    public void setA(A a){
        this.a=a;
        System.out.println("A injected into B");
    }
}
