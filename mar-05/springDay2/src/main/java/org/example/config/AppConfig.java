package org.example.config;

import org.example.service.DisplayService;
import org.example.service.GreetingService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

    @Bean
    public DisplayService displayService(){
        return new DisplayService();
    }

    @Bean
    public GreetingService greetingService(){
        return new GreetingService();
    }

}

