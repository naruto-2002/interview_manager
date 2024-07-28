package org.mock.interview_managerment.controller;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.Interview;
import org.mock.interview_managerment.services.InterviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class InterviewDetailsController {
    private final InterviewService interviewService;

//    @GetMapping("/interview/details")
//    public String getInterviewDetailsPage(@RequestParam("interview_id") long interviewId, Model model) {
//
//        Interview interview = interviewService.getByInterviewId(interviewId);
//        System.out.println(interview);
//
//        model.addAttribute("interview", interview);
//
//        return "interview/details";
//    }

    @GetMapping("/interview/details")
    public String getInterviewDetailsPage(Model model) {

        return "interview/details";
    }

}
