package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.mock.interview_managerment.entities.pk.ResultEnum;
import org.mock.interview_managerment.entities.pk.StatusEnum;
import org.springframework.format.annotation.DateTimeFormat;


import java.time.LocalDate;

@Data
@Entity
@Table(name = "interview_schedules")
public class InterviewSchedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long interview_schedule_id;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;
    private String startTime;
    private String endTime;
    private String location;
    private String meetingId;
    private String note;
    private String title;

    @Enumerated(EnumType.STRING)
    private ResultEnum result;

    @Enumerated(EnumType.STRING)
    private StatusEnum status;

    @ManyToOne
    @JoinColumn(name = "interviewer_id")
    private User interviewer;

    @ManyToOne
    @JoinColumn(name = "recuriter_id")
    private User recruiter;

    @ManyToOne
    @JoinColumn(name = "job_id")
    private Job job;

    @ManyToOne
    @JoinColumn(name = "candidate_id")
    private Candidate candidate;

}
