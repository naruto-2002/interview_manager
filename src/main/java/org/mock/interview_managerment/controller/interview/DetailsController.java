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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class DetailsController {
    private final InterviewService interviewService;

    @GetMapping("/interview/details")
    public String getInterviewDetailsPage(@RequestParam("interview_id") long interviewId, Model model) {
        getUserInfor(model);

        Interview interview = interviewService.getByInterviewId(interviewId);
        System.out.println(interview);

        model.addAttribute("interview", interview);

        return "interview/details";
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
        } else {
            model.addAttribute("username", principal.toString());
        }
    }

    //"ADMIN", "RECRUITER", "INTERVIEWER", "MANAGER"
    public String getRoleName(String authority) {
        switch(authority) {
            case "[ROLE_INTERVIEWER]":
                return "interviewer";
            case "[ROLE_ADMIN]":
                return "admin";
            case "[ROLE_RECRUITER]":
                return "recruiter";
            case "[ROLE_MANAGER]":
                return "manager";

            default:
                return "Unknown role";
        }
    }

}


