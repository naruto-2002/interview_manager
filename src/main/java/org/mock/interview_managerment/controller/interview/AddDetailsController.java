package org.mock.interview_managerment.controller.interview;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.*;
import org.mock.interview_managerment.entities.pk.ScheduledInterviewId;
import org.mock.interview_managerment.enums.ResultInterviewEnum;
import org.mock.interview_managerment.enums.StatusCandidateEnum;
import org.mock.interview_managerment.enums.StatusInterviewEnum;
import org.mock.interview_managerment.services.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class AddDetailsController {
    private final UserService userService;
    private final CandidateService candidateService;
    private final InterviewService interviewService;
    private final ScheduledInterviewService scheduledInterviewService;
    private final CandidateJobService candidateJobService;

    @GetMapping("/interview/add_details")
    public String getAddDetailsPage(@RequestParam("candidateId") long candidateId, Model model) {
        List<User> interviewers = userService.getUsersByRoleName("INTERVIEWER");
        List<CandidateJob> candidateJobs = candidateJobService.getAllJobOpenByCandidateId(candidateId);
        Candidate candidate = candidateService.getCandidateById(candidateId);


        model.addAttribute("interviewers", interviewers);
        model.addAttribute("candidateJobs", candidateJobs);
        model.addAttribute("candidate", candidate);
        model.addAttribute("newInterview", new Interview());

        return "interview/add_details";
    }

    @PostMapping("/interview/add_details")
    public String addNewInterview(@ModelAttribute("newInterview") @Valid Interview newInterview, BindingResult result) {
        if (result.hasErrors() || newInterview.getSelectedInterviewerIds().isEmpty()) {
            return "redirect:/interview/add_details?candidateId=" + newInterview.getCandidate().getId();
        }
        newInterview.setResult(ResultInterviewEnum.OPEN);
        newInterview.setStatus(StatusInterviewEnum.NEW);
        newInterview.getCandidate().setStatus(StatusCandidateEnum.Waiting_for_interview);
        Interview interview = interviewService.saveInterview(newInterview);

        List<Long> selectedInterviewerIds = newInterview.getSelectedInterviewerIds();
        for(Long selectedInterviewerId : selectedInterviewerIds) {
            ScheduledInterviewId scheduledInterviewId = new ScheduledInterviewId();
            scheduledInterviewId.setInterviewId(interview.getInterviewId());
            scheduledInterviewId.setInterviewerId(selectedInterviewerId);

            ScheduledInterview scheduledInterview = new ScheduledInterview();
            scheduledInterview.setScheduledInterviewId(scheduledInterviewId);
            scheduledInterview.setInterview(interview);
            scheduledInterview.setInterviewer(userService.getByUserId(selectedInterviewerId));

            scheduledInterviewService.saveScheduledInterview(scheduledInterview);
        }

        return "redirect:/interview/list";
    }

}
