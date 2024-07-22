package org.mock.interview_managerment.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class UserController {



    @GetMapping("/admin/user")
    public String getUserPage(Model model) {

        return "list-user.jsp";
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        return "hello";
    }
}
