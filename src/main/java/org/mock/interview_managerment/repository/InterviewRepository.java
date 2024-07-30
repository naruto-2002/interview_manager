package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.*;
import org.mock.interview_managerment.enums.ResultEnum;
import org.mock.interview_managerment.enums.StatusEnum;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface InterviewRepository extends JpaRepository<Interview, Long> {

    List<Interview> findAll();

    @Query("SELECT i FROM Interview i WHERE i.interviewId = :interviewId")
    Interview findByInterviewId(long interviewId);
}
