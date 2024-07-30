package org.mock.interview_managerment.services;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.Job;
import org.mock.interview_managerment.enums.StatusEnum;
import org.mock.interview_managerment.repository.JobRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class JobService {
    // code van
    private final JobRepository jobRepository;

    public List<Job> getJobs() {
        return jobRepository.findAll();
    }
    public List<Job> getJobsByStatusOpen() {
        return jobRepository.findAllByStatus(StatusEnum.OPEN);
    }
}
