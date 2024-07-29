package org.mock.interview_managerment.services;

import org.mock.interview_managerment.entities.ScheduledInterview;
import org.mock.interview_managerment.repository.ScheduledInterviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduledInterviewService {

    @Autowired
    private ScheduledInterviewRepository scheduledInterviewRepository;

    public List<ScheduledInterview> getAllScheduledInterviews() {
        return scheduledInterviewRepository.findAll();
    }
}
