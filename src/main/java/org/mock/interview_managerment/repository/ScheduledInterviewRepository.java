package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.ScheduledInterview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ScheduledInterviewRepository extends JpaRepository<ScheduledInterview, Long> {
}
