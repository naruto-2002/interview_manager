package org.mock.interview_managerment.services;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.Candidate;
import org.mock.interview_managerment.repository.CandidateRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CandidateService {
    private final CandidateRepository candidateRepository;

    public List<Candidate> getAllCandidates() {
        return candidateRepository.findAll();
    }




}
