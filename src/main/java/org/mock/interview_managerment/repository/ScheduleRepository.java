package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Role;
import org.mock.interview_managerment.entities.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ScheduleRepository extends JpaRepository<Schedule, Long> {}