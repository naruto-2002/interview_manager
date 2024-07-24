package org.mock.interview_managerment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InterviewScheduleDetailsController {
    @GetMapping("/interview_schedule/details")
    public String getInterviewScheduleDetailsPage(Model model) {
        return "interview_schedule/details";
    }
}
