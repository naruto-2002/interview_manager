package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Interview;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InterviewRepository extends JpaRepository<Interview, Long> {

    List<Interview> findAll();

    @Query("SELECT i FROM Interview i WHERE i.interviewId = :interviewId")
    Interview findByInterviewId(long interviewId);

//    @Query("UPDATE Interview i SET i.title = :title, i.candidate = :candidate, i.date = :date, i.startTime = :startTime, i.endTime = :endTime, i.note = :note, i.job = :job, i.scheduledInterviews = :scheduledinterviews, i.location = :location, i.recruiter = :recruiter, i.meetingId = :meetingId, i.result = :result, i.status = :status WHERE i.interviewId = :interviewId")
//    void updateInterviewerById(@Param("id") Long id, @Param("fullName") String fullName, @Param("email") String email);

}
