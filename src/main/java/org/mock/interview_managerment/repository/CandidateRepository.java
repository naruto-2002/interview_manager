package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Candidate;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CandidateRepository extends JpaRepository<Candidate, Long> {
}
