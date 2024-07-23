package org.mock.interview_managerment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InterViewScheduleController {
    @GetMapping("/interview_schedule")
    public String getInterViewSchedulePage(Model model) {

        return "interview_schedule/index";
    }
}
