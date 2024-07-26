package org.mock.interview_managerment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewInterviewScheduleController {
    @GetMapping("/interview_schedule/add_new")
    public String getNewInterviewSchedulePage(Model model) {
        return "interview_schedule/add_new";
    }
}
