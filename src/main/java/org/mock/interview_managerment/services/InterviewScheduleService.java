package org.mock.interview_managerment.services;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.InterviewSchedule;
import org.mock.interview_managerment.repository.InterviewScheduleRespository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InterviewScheduleService {
    private final InterviewScheduleRespository interviewScheduleRespository;

    public List<InterviewSchedule> getAllInterviewScheduleList() {
        return interviewScheduleRespository.findAll();
    }
}
