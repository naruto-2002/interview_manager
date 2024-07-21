package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Candidate;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CandidateRepository extends JpaRepository<Candidate, Long> {}
public interface JobRepository extends JpaRepository<Job, Long> {}
public interface OfferRepository extends JpaRepository<Offer, Long> {}
public interface RoleRepository extends JpaRepository<Role, Long> {}
public interface ScheduleRepository extends JpaRepository<Schedule, Long> {}
public interface UserRepository extends JpaRepository<User, Long> {}