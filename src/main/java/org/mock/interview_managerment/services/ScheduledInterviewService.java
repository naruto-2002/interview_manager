package org.mock.interview_managerment.services;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.ScheduledInterview;
import org.mock.interview_managerment.entities.pk.ScheduledInterviewId;
import org.mock.interview_managerment.repository.ScheduledInterviewRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ScheduledInterviewService {
    // code van
    private final ScheduledInterviewRepository scheduledInterviewRepository;
    private final InterviewService interviewService;
    private final UserService userService;

    public List<ScheduledInterview> getAllScheduledInterview() {
        return scheduledInterviewRepository.findAll();
    }

    public ScheduledInterview handleSaveScheduledInterview(ScheduledInterview scheduledInterview) {
        return scheduledInterviewRepository.save(scheduledInterview);
    }

    public void deleteScheduledInterviewByInterviewId(long interviewId) {
        scheduledInterviewRepository.deleteByInterviewId(interviewId);
    }
}
