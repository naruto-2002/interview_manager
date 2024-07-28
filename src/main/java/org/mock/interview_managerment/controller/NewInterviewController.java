package org.mock.interview_managerment.controller;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.*;
import org.mock.interview_managerment.services.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class NewInterviewController {
    private final UserService userService;
    private final JobService jobService;
    private final CandidateService candidateService;
    private final InterviewService interviewService;
    private final ScheduledInterviewService scheduledInterviewService;

    @GetMapping("/interview/add_new")
    public String getNewInterviewPage(Model model) {

        model.addAttribute("newInterview", new Interview());

        List<Candidate> candidates = candidateService.getAllCandidates();
        List<Job> jobs = jobService.getJobs();
        List<User> interviewers = userService.getUsersByRoleName("INTERVIEWER");
        List<ScheduledInterview> scheduledInterviews;

        System.out.println(interviewers);
        List<User> recruiters = userService.getUsersByRoleName("RECRUITER");

        model.addAttribute("candidates", candidates);
        model.addAttribute("jobs", jobs);
        model.addAttribute("interviewers", interviewers);
        model.addAttribute("recruiters", recruiters);


        return "interview/add_new";
    }

    @PostMapping("/interview/add_new")
    public String addNewInterview(@ModelAttribute("newInterview") Interview interview) {

        interviewService.handleSaveInterview(interview);
        System.out.println(interview);

        return "redirect:/interview/list";
    }
}
