package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Interview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InterviewRepository extends JpaRepository<Interview, Long> {
    List<Interview> findAll();
    @Query("SELECT i FROM Interview i WHERE i.interviewId = :interviewId")
    Interview findByInterviewId(long interviewId);
}
