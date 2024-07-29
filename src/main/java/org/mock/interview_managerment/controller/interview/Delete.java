package org.mock.interview_managerment.controller.interview;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.services.InterviewService;
import org.mock.interview_managerment.services.ScheduledInterviewService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class Delete {
    private final ScheduledInterviewService scheduledInterviewService;
    private final InterviewService interviewService;

    @GetMapping("/interview/delete")
    public String deleteInterview(@RequestParam("interviewId") long interviewId, Model model) {
        System.out.println(interviewId);
        scheduledInterviewService.deleteScheduledInterviewByInterviewId(interviewId);
        interviewService.deleteInterviewById(interviewId);
        return "redirect:/interview/list";  // Redirect to avoid form resubmission issues
    }
}
