package org.mock.interview_managerment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InterviewScheduleListController {
    @GetMapping("/interview_schedule/list")
    public String getInterviewScheduleListPage(Model model) {
        return "interview_schedule/list";
    }
}