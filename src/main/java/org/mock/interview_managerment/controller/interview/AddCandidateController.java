package org.mock.interview_managerment.controller.interview;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.Candidate;
import org.mock.interview_managerment.entities.Interview;
import org.mock.interview_managerment.repository.CandidateRepository;
import org.mock.interview_managerment.services.CandidateJobService;
import org.mock.interview_managerment.services.InterviewService;
import org.mock.interview_managerment.services.ScheduledInterviewService;
import org.mock.interview_managerment.services.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class AddCandidateController {
    private final CandidateRepository candidateRepository;
    private final UserService userService;
    private final InterviewService interviewService;
    private final ScheduledInterviewService scheduledInterviewService;
    private final CandidateJobService candidateJobService;

    @GetMapping("/interview/add_candidate")
    public String getAddCandidatePage(Model model) {
        List<Candidate> candidates = candidateRepository.findAll();

        model.addAttribute("candidates", candidates);
        model.addAttribute("newInterview", new Interview());

        return "interview/add_candidate";
    }


    @PostMapping("/interview/add_candidate")
    public String getAddDetailsPage(@ModelAttribute("newInterview") Interview newInterview) {
        if (newInterview.getCandidate() == null || newInterview.getCandidate().getId() == null) {
            return "redirect:/interview/add_candidate";
        }

        long candidateId = newInterview.getCandidate().getId();
        return "redirect:/interview/add_details?candidateId=" + candidateId;
    }
}
