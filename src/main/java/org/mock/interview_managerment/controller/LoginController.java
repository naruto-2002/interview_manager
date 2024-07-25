package org.mock.interview_managerment.controller;

import org.mock.interview_managerment.entities.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {
    @GetMapping("/home")
    public String viewHomeUser(Model model) {
        // Lấy thông tin người dùng từ SecurityContextHolder
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Object principal = authentication.getPrincipal();

        if (principal instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) principal;
            model.addAttribute("username", userDetails.getUsername());
            String roleName = getRoleName(userDetails.getAuthorities().toString());
            model.addAttribute("roleName", roleName);
            // Bạn có thể thêm các thông tin khác của user nếu cần
        } else {
            model.addAttribute("username", principal.toString());
        }

        return "home"; // Điều hướng đến trang home
    }

    public String getRoleName(String authority) {
        switch(authority) {
            case "[ROLE_INTERVIEWER]":
                return "Interviewer";

            default:
                return "Unknown role";
        }
    }
}
