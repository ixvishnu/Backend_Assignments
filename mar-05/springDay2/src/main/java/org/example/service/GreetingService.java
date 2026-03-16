package org.example.service;

import org.springframework.stereotype.Service;

@Service
public class GreetingService {

    public void greet(){
        System.out.println("Good Morning");
    }
}
