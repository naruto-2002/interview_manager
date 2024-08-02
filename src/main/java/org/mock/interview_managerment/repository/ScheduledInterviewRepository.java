package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.ScheduledInterview;
import org.mock.interview_managerment.entities.pk.ScheduledInterviewId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface ScheduledInterviewRepository extends JpaRepository<ScheduledInterview, Long> {
    List<ScheduledInterview> findAll();
    @Query("SELECT s FROM ScheduledInterview s WHERE s.interview.interviewId = :interviewId")
    List<ScheduledInterview> findByInterviewId(long interviewId);
    @Modifying
    @Transactional
    @Query("DELETE FROM ScheduledInterview s WHERE s.interview.interviewId = :interviewId")
    void deleteByInterviewId(Long interviewId);

}
