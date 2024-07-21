package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Job;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JobRepository extends JpaRepository<Job, Long> {}