package org.mock.interview_managerment.controller;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.Candidate;
import org.mock.interview_managerment.entities.InterviewSchedule;
import org.mock.interview_managerment.entities.Job;
import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.services.CandidateService;
import org.mock.interview_managerment.services.InterviewScheduleService;
import org.mock.interview_managerment.services.JobService;
import org.mock.interview_managerment.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class NewInterviewScheduleController {
    private final UserService userService;
    private final JobService jobService;
    private final CandidateService candidateService;
    private final InterviewScheduleService interviewScheduleService;

    @GetMapping("/interview_schedule/add_new")
    public String getNewInterviewSchedulePage(Model model) {

        model.addAttribute("newInterviewSchedule", new InterviewSchedule());

        List<Candidate> candidates = candidateService.getAllCandidates();
        List<Job> jobs = jobService.getJobs();
        List<User> interviewers = userService.getUsersByRoleName("INTERVIEWER");
        List<User> recruiters = userService.getUsersByRoleName("RECRUITER");

        model.addAttribute("candidates", candidates);
        model.addAttribute("jobs", jobs);
        model.addAttribute("interviewers", interviewers);
        model.addAttribute("recruiters", recruiters);


        return "interview_schedule/add_new";
    }

    @PostMapping("/interview_schedule/add_new")
    public String addNewInterviewSchedule(@ModelAttribute("newInterviewSchedule") InterviewSchedule interviewSchedule) {

        interviewScheduleService.handleSaveInterviewSchedule(interviewSchedule);

        return "/interview_schedule/list";
    }
}
