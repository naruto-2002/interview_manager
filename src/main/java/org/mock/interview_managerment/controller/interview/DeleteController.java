package org.mock.interview_managerment.controller.interview;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.services.InterviewService;
import org.mock.interview_managerment.services.ScheduledInterviewService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class DeleteController {
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
