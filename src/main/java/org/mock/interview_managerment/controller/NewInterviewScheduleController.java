package org.mock.interview_managerment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewInterviewScheduleController {
    @GetMapping("/new_interview_schedule")
    public String getNewInterviewSchedulePage(Model model) {

        return "new_interview_schedule/index";
    }
}
