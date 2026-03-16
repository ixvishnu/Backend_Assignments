package org.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class DisplayService {

    @Autowired
    public GreetingService greetingService;

    public void display(){
        greetingService.greet();
    }

}
