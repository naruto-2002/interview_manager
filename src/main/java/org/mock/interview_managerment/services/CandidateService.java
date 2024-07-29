package org.mock.interview_managerment.services;

import org.mock.interview_managerment.entities.Candidate;
import org.mock.interview_managerment.enums.StatusEnum;
import org.mock.interview_managerment.repository.CandidateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CandidateService {
    @Autowired
    private CandidateRepository candidateRepository;

    public List<Candidate> getAllActiveCandidates() {
        return candidateRepository.findAll().stream()
                .filter(candidate -> !candidate.getStatus().equals(StatusEnum.INACTIVE))
                .collect(Collectors.toList());
    }
}
