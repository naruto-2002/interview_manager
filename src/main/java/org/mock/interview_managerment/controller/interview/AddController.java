package org.mock.interview_managerment.controller.interview;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.*;
import org.mock.interview_managerment.entities.pk.ScheduledInterviewId;
import org.mock.interview_managerment.enums.ResultEnum;
import org.mock.interview_managerment.enums.StatusEnum;
import org.mock.interview_managerment.enums.StatusInterviewEnum;
import org.mock.interview_managerment.services.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class AddController {
    private final UserService userService;
    private final JobService jobService;
    private final CandidateService candidateService;
    private final InterviewService interviewService;
    private final ScheduledInterviewService scheduledInterviewService;

    @GetMapping("/interview/add")
    public String getNewInterviewPage(Model model) {
        List<Candidate> candidates = candidateService.getAllCandidates();
        List<Job> jobs = jobService.getJobsByStatusOpen();
        List<User> interviewers = userService.getUsersByRoleName("INTERVIEWER");
        List<User> recruiters = userService.getUsersByRoleName("RECRUITER");

        model.addAttribute("candidates", candidates);
        model.addAttribute("jobs", jobs);
        model.addAttribute("interviewers", interviewers);
        model.addAttribute("recruiters", recruiters);
        model.addAttribute("newInterview", new Interview());



        return "interview/add";
    }

    @PostMapping("/interview/add")
    public String addNewInterview(@ModelAttribute("newInterview") Interview newInterview) {
        newInterview.setResult(ResultEnum.NA);
        newInterview.setStatus(StatusInterviewEnum.NEW);
        Interview interview = interviewService.handleSaveInterview(newInterview);

        List<Long> selectedInterviewerIds = newInterview.getSelectedInterviewerIds();
        for(Long selectedInterviewerId : selectedInterviewerIds) {
            ScheduledInterviewId scheduledInterviewId = new ScheduledInterviewId();
            scheduledInterviewId.setInterviewId(interview.getInterviewId());
            scheduledInterviewId.setInterviewerId(selectedInterviewerId);

            ScheduledInterview scheduledInterview = new ScheduledInterview();
            scheduledInterview.setScheduledInterviewId(scheduledInterview.getScheduledInterviewId());
            scheduledInterview.setInterview(interview);
            scheduledInterview.setInterviewer(userService.getByUserId(selectedInterviewerId));

            scheduledInterviewService.handleSaveScheduledInterview(scheduledInterview);
        }

        return "redirect:/interview/list";
    }
}
