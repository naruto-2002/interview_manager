package org.mock.interview_managerment.controller.interview;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.Interview;
import org.mock.interview_managerment.services.InterviewService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ListController {
    private final InterviewService interviewService;

    @GetMapping("/interview/list")
    public String getInterviewListPage(Model model) {
//        getUserInfor(model);

        List<Interview> interviews = interviewService.getAllInterviews();

        System.out.println(interviews);

        model.addAttribute("interviews", interviews);

        return "interview/list";
    }

    public void getUserInfor(Model model) {
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