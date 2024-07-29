package org.mock.interview_managerment.services;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.Interview;
import org.mock.interview_managerment.entities.ScheduledInterview;
import org.mock.interview_managerment.enums.ResultEnum;
import org.mock.interview_managerment.enums.StatusEnum;
import org.mock.interview_managerment.repository.*;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InterviewService {
    private final InterviewRepository interviewRepository;
    private final CandidateRepository candidateRepository;
    private final JobRepository jobRepository;
    private final UserRepository userRepository;
    private final ScheduledInterviewRepository scheduledInterviewRepository;


    public List<Interview> getAllInterviews() {
        return interviewRepository.findAll();
    }

    public Interview handleSaveInterview(Interview interview) {
        return interviewRepository.save(interview);
    }

    public Interview getByInterviewId(Long id) {
        return interviewRepository.findByInterviewId(id);
    }
}
