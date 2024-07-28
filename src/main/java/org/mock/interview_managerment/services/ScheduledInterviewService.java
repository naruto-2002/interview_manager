package org.mock.interview_managerment.services;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.ScheduledInterview;
import org.mock.interview_managerment.repository.ScheduledInterviewRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ScheduledInterviewService {
    private final ScheduledInterviewRepository scheduledInterviewRepository;

    public List<ScheduledInterview> getAllScheduledInterview() {
        return scheduledInterviewRepository.findAll();
    }
}
