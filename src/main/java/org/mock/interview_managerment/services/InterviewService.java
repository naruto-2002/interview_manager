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
        List<Interview> interviews = interviewRepository.findAll();

        for(Interview interview : interviews) {
            interview.setScheduledInterviews(scheduledInterviewRepository.findByInterviewId(interview.getInterviewId()));
        }

        return interviews;
    }

    public void handleSaveInterview(Interview interview) {

        interview.setCandidate(candidateRepository.findByCandidateId(interview.getCandidate().getCandidateId()));
        interview.setJob(jobRepository.findByJobId(interview.getJob().getJobId()));
        interview.setScheduledInterviews(scheduledInterviewRepository.findAll());
        interview.setRecruiter(userRepository.findByUserId(interview.getRecruiter().getUserId()));
        interview.setResult(ResultEnum.NA);
        interview.setStatus(StatusEnum.NEW);

        interviewRepository.save(interview);
    }

    public Interview getByInterviewId(Long id) {
        return interviewRepository.findByInterviewId(id);
    }
}
