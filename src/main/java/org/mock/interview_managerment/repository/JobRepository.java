package org.mock.interview_managerment.repository;

import java.util.List;
import java.util.Optional;

import org.mock.interview_managerment.entities.Job;
import org.mock.interview_managerment.enums.StatusEnum;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface JobRepository extends JpaRepository<Job, Long> {
    List<Job> findAll();

    @Query("SELECT j FROM Job j WHERE "
            + "(j.title LIKE %:keyword% OR j.description LIKE %:keyword% OR "
            + "j.requiredSkills LIKE %:keyword% OR j.level LIKE %:keyword% OR "
            + "j.location LIKE %:keyword% OR j.benefits LIKE %:keyword% OR "
            + "j.salaryFrom LIKE %:keyword% OR j.salaryTo LIKE %:keyword%) "
            + "AND j.status = :status")
    Page<Job> findByKeywordAndStatus(@Param("keyword") String keyword,
                                     @Param("status") String status,
                                     Pageable pageable);

    @Query("SELECT j FROM Job j WHERE j.jobId = :jobId")
    Job findByJobId(long jobId);

    @Query("SELECT j FROM Job j WHERE j.status = :status")
    List<Job> findAllByStatus(StatusEnum status);
}
