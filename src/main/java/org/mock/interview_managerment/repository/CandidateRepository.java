package org.mock.interview_managerment.repository;



import org.mock.interview_managerment.entities.Candidate;
import org.mock.interview_managerment.enums.StatusCandidateEnum;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CandidateRepository extends JpaRepository<Candidate,Long> {
    public Page<Candidate> findAll(Pageable pageable);
    public Candidate save(Candidate candidate);
    public Page<Candidate> findByStatusAndNameContainingOrEmailContainingOrPhoneContainingOrUserContaining(StatusCandidateEnum status, String name, String email, String phone, String recruiter, Pageable pageable);
    public Page<Candidate> findByNameContainingOrEmailContainingOrPhoneContaining(String name, String email, String phone, Pageable pageable);;
    public Candidate getById(Long id);
    public Page<Candidate> findByStatus(StatusCandidateEnum status, Pageable pageable);

    List<Candidate> findAll();
    @Query("SELECT c FROM Candidate c WHERE c.id = :id")
    Candidate findByCandidateId(long id);

}
