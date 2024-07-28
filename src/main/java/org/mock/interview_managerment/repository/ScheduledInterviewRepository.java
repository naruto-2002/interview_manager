package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Interview;
import org.mock.interview_managerment.entities.ScheduledInterview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface ScheduledInterviewRepository extends JpaRepository<ScheduledInterview, Long> {

    List<ScheduledInterview> findAll();

    @Query("SELECT s FROM ScheduledInterview s WHERE s.interview.interviewId = :interviewId")
    List<ScheduledInterview> findByInterviewId(long interviewId);
}
