package com.example.springDay3;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


@Component
public class DisplayMsg {
    @Value("${Message}")
    String val;

    @PostConstruct
    public void  printMs(){
        System.out.println(val);
    }
}
