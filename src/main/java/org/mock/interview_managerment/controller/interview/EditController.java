package org.mock.interview_managerment.controller.interview;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.*;
import org.mock.interview_managerment.entities.pk.ScheduledInterviewId;
import org.mock.interview_managerment.enums.ResultEnum;
import org.mock.interview_managerment.enums.StatusEnum;
import org.mock.interview_managerment.repository.InterviewRepository;
import org.mock.interview_managerment.services.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class EditController {
    private final UserService userService;
    private final JobService jobService;
    private final CandidateService candidateService;
    private final InterviewService interviewService;
    private final ScheduledInterviewService scheduledInterviewService;
    @GetMapping("/interview/edit")
    public String getEditInterviewPage(@RequestParam("interview_id") long interviewId, Model model) {
        List<Candidate> candidates = candidateService.getAllCandidates();
        List<Job> jobs = jobService.getJobs();
        List<User> interviewers = userService.getUsersByRoleName("INTERVIEWER");
        List<User> recruiters = userService.getUsersByRoleName("RECRUITER");
        Interview interview = interviewService.getByInterviewId(interviewId);

        List<ScheduledInterview> scheduledInterviews = scheduledInterviewService.getAllScheduledInterview();
        for(ScheduledInterview s: scheduledInterviews) {
            interview.getSelectedInterviewerIds().add(s.getInterviewer().getUserId());
        }

        model.addAttribute("candidates", candidates);
        model.addAttribute("jobs", jobs);
        model.addAttribute("interviewers", interviewers);
        model.addAttribute("recruiters", recruiters);
        model.addAttribute("interview", interview);
        model.addAttribute("results", ResultEnum.values());
        model.addAttribute("states", StatusEnum.values());

        model.addAttribute("newInterview", interview);

        return "interview/edit";
    }

    @PostMapping("/interview/edit")
    public String editInterview(@ModelAttribute("newInterview") Interview newInterview) {
        scheduledInterviewService.deleteScheduledInterviewByInterviewId(newInterview.getInterviewId());
        interviewService.updateInterview(newInterview);

        List<Long> selectedInterviewerIds = newInterview.getSelectedInterviewerIds();
        for(Long selectedInterviewerId : selectedInterviewerIds) {
            ScheduledInterviewId scheduledInterviewId = new ScheduledInterviewId();
            scheduledInterviewId.setInterviewId(newInterview.getInterviewId());
            scheduledInterviewId.setInterviewerId(selectedInterviewerId);

            ScheduledInterview scheduledInterview = new ScheduledInterview();
            scheduledInterview.setId(scheduledInterviewId);
            scheduledInterview.setInterview(newInterview);
            scheduledInterview.setInterviewer(userService.getByUserId(selectedInterviewerId));

            scheduledInterviewService.handleSaveScheduledInterview(scheduledInterview);
        }

        return "redirect:/interview/list";
    }
}


