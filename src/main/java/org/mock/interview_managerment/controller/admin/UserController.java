package org.mock.interview_managerment.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class UserController {



    @GetMapping("/user")
    public String getUserPage(Model model) {

        return "user_view/list-user";
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        return "hello";
    }
}
