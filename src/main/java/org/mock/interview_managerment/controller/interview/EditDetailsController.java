package org.mock.interview_managerment.controller.interview;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.*;
import org.mock.interview_managerment.entities.pk.ScheduledInterviewId;
import org.mock.interview_managerment.enums.ResultInterviewEnum;
import org.mock.interview_managerment.enums.StatusInterviewEnum;
import org.mock.interview_managerment.services.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class EditDetailsController {

    private final UserService userService;
    private final CandidateService candidateService;
    private final InterviewService interviewService;
    private final ScheduledInterviewService scheduledInterviewService;
    private final CandidateJobService candidateJobService;

    @GetMapping("/interview/edit_details")
    public String getEditDetails(@RequestParam("interviewId") long interviewId, @RequestParam("candidateId") long candidateId, Model model) {
        List<User> interviewers = userService.getUsersByRoleName("INTERVIEWER");
        List<CandidateJob> candidateJobs = candidateJobService.getAllJobOpenByCandidateId(candidateId);
        Candidate candidate = candidateService.getCandidateById(candidateId);
        Interview interview = interviewService.getByInterviewId(interviewId);

        List<ScheduledInterview> scheduledInterviews = scheduledInterviewService.getScheduledInterviewByInterviewId(interviewId);
        List<Long> scheduledInterviewIds = new ArrayList<>();
        interview.setSelectedInterviewerIds(scheduledInterviewIds);
        for(ScheduledInterview s: scheduledInterviews) {
            interview.getSelectedInterviewerIds().add(s.getInterviewer().getUserId());
        }

        model.addAttribute("username", userService.getCurrentUsername());
        model.addAttribute("roleName", userService.getCurrentUserRole());
        model.addAttribute("interviewers", interviewers);
        model.addAttribute("candidateJobs", candidateJobs);
        model.addAttribute("candidate", candidate);
        model.addAttribute("results", ResultInterviewEnum.values());
        model.addAttribute("states", StatusInterviewEnum.values());
        model.addAttribute("interview", interview);
        model.addAttribute("newInterview", interview);



        return "interview/edit_details";
    }

    @PostMapping("/interview/edit_details")
    public String postEditDetails(@ModelAttribute("newInterview") @Valid Interview newInterview, BindingResult result) {
        if (result.hasErrors() || newInterview.getSelectedInterviewerIds().isEmpty()) {
            return "redirect:/interview/edit_details?interviewId=" + newInterview.getInterviewId() +"&candidateId=" + newInterview.getCandidate().getId();
        }
        String roleName = userService.getCurrentUserRole();

        if(roleName.equals("recruiter") || roleName.equals("admin") || roleName.equals("manager")) {
            scheduledInterviewService.deleteScheduledInterviewByInterviewId(newInterview.getInterviewId());
            interviewService.saveInterview(newInterview);
            if(newInterview.getResult() != ResultInterviewEnum.OPEN && newInterview.getResult() != ResultInterviewEnum.NA) {
                newInterview.setStatus(StatusInterviewEnum.INTERVIEWED);
            }
            interviewService.saveInterview(newInterview);
        }

        if(roleName.equals("interviewer")) {
            Interview interview = interviewService.getByInterviewId(newInterview.getInterviewId());
            interview.setNote(newInterview.getNote());
            interview.setResult(newInterview.getResult());
            if(newInterview.getResult() != ResultInterviewEnum.OPEN && newInterview.getResult() != ResultInterviewEnum.NA) {
                interview.setStatus(StatusInterviewEnum.INTERVIEWED);
            }
            interviewService.saveInterview(interview);
        }

        List<Long> selectedInterviewerIds = newInterview.getSelectedInterviewerIds();
        for(Long selectedInterviewerId : selectedInterviewerIds) {
            ScheduledInterviewId scheduledInterviewId = new ScheduledInterviewId();
            scheduledInterviewId.setInterviewId(newInterview.getInterviewId());
            scheduledInterviewId.setInterviewerId(selectedInterviewerId);

            ScheduledInterview scheduledInterview = new ScheduledInterview();
            scheduledInterview.setScheduledInterviewId(scheduledInterviewId);
            scheduledInterview.setInterview(newInterview);
            scheduledInterview.setInterviewer(userService.getByUserId(selectedInterviewerId));

            scheduledInterviewService.saveScheduledInterview(scheduledInterview);
        }

        return "redirect:/interview/list";
    }
}
