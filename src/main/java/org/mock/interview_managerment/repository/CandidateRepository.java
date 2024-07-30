package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Candidate;
import org.mock.interview_managerment.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CandidateRepository extends JpaRepository<Candidate, Long> {
    List<Candidate> findAll();

    @Query("SELECT c FROM Candidate c WHERE c.candidateId = :candidateId")
    Candidate findByCandidateId(long candidateId);

}
