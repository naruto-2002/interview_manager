package org.mock.interview_managerment.controller.admin;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.repository.UserRepository;
import org.mock.interview_managerment.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequiredArgsConstructor

public class UserController {
    private final UserService userService;

    @GetMapping("/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "user/create";
    }

    @PostMapping("/user/create")
    public String createUser(@ModelAttribute("newUser") User user) {
        System.out.println(user);
        userService.handleSaveUser(user);
        return "home";
    }
}