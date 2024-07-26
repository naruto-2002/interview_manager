package org.mock.interview_managerment.services;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.InterviewSchedule;
import org.mock.interview_managerment.repository.CandidateRepository;
import org.mock.interview_managerment.repository.InterviewScheduleRepository;
import org.mock.interview_managerment.repository.JobRepository;
import org.mock.interview_managerment.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InterviewScheduleService {
    private final InterviewScheduleRepository interviewScheduleRepository;
    private final CandidateRepository candidateRepository;
    private final JobRepository jobRepository;
    private final UserRepository userRepository;


    public List<InterviewSchedule> getAllInterviewScheduleList() {
        return interviewScheduleRepository.findAll();
    }

    public void handleSaveInterviewSchedule(InterviewSchedule interviewSchedule) {
        interviewScheduleRepository.save(interviewSchedule);
    }
}
