package org.example;

import org.example.config.AppConfig;
import org.example.service.DisplayService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class App
{
    public static void main( String[] args )
    {
        ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        DisplayService service = context.getBean(DisplayService.class);
        service.display();
    }
}
