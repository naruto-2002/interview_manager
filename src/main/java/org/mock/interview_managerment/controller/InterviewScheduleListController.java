package org.mock.interview_managerment.controller;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.InterviewSchedule;
import org.mock.interview_managerment.services.InterviewScheduleService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class InterviewScheduleListController {
    private final InterviewScheduleService interviewScheduleService;

    @GetMapping("/interview_schedule/list")
    public String getInterviewScheduleListPage(Model model) {
//        getUserInfor(model);

        List<InterviewSchedule> interviewScheduleList = interviewScheduleService.getAllInterviewScheduleList();
        model.addAttribute("interviewScheduleList", interviewScheduleList);

        return "interview_schedule/list";
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