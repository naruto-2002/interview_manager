package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Candidate;
import org.mock.interview_managerment.entities.Job;
import org.mock.interview_managerment.enums.StatusEnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JobRepository extends JpaRepository<Job, Long> {
    //    code van
    List<Job> findAll();

    @Query("SELECT j FROM Job j WHERE j.jobId = :jobId")
    Job findByJobId(long jobId);

    @Query("SELECT j FROM Job j WHERE j.status = :status")
    List<Job> findAllByStatus(StatusEnum status);
}
