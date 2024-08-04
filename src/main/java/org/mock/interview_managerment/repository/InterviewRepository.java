package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Interview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InterviewRepository extends JpaRepository<Interview, Long> {
    @Override
    @Query("SELECT i FROM Interview i WHERE i.deleted = false")
    List<Interview> findAll();

    @Query("SELECT i FROM Interview i WHERE i.interviewId = :interviewId AND i.deleted = false")
    Interview findByInterviewId(long interviewId);




}
