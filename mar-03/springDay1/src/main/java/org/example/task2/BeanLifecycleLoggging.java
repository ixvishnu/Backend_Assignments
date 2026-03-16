package org.example.task2;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import org.springframework.stereotype.Component;

    @Component
    public class BeanLifecycleLoggging {

        @PostConstruct
        public void Initialize() {
            System.out.println("Bean is created");
        }

        static{
            System.out.println("Bean processing and being in use");
        }

        @PreDestroy
        public void Destroy() {
            System.out.println("Bean is destroyed");
        }
    }

