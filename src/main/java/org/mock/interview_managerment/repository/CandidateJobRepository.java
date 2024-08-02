package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.CandidateJob;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CandidateJobRepository extends JpaRepository<CandidateJob, Long> {
    List<CandidateJob> findAll();
    @Query("SELECT c FROM CandidateJob c WHERE c.candidate.id = :id")
    List<CandidateJob> findByCandidateId(long id);
}
