package org.mock.interview_managerment.controller.admin;

import org.mock.interview_managerment.entities.Role;
import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.repository.RoleRepository;
import org.mock.interview_managerment.services.PasswordService;
import org.mock.interview_managerment.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "user/create";
    }

    @PostMapping("/user/create")
    public String createUser(@ModelAttribute("newUser") User user) {
        System.out.println(user);
        userService.handleSaveUser(user);
        return "hello";
    }
}
