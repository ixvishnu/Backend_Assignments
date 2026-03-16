package org.example.task1;

import org.springframework.stereotype.Component;

@Component
public class UserRepository {
    private UserService userService;

    public UserRepository(UserService userService) {
        this.userService = userService;
    }
    public void output(){
        userService.greet();
    }
}
