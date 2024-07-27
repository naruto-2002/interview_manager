package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.mock.interview_managerment.enums.ResultEnum;
import org.mock.interview_managerment.enums.StatusEnum;
import org.springframework.format.annotation.DateTimeFormat;


import java.time.LocalDate;
import java.util.Set;

@Data
@Entity
@Table(name = "interviews")
public class Interview {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long interviewId;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;
    private String startTime;
    private String endTime;
    private String location;
    private String meetingId;
    private String note;
    private String title;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private ResultEnum result;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private StatusEnum status;

    @ManyToOne
    @JoinColumn(name = "recuriter_id")
    private User recruiter;

    @ManyToOne
    @JoinColumn(name = "job_id")
    private Job job;

    @ManyToOne
    @JoinColumn(name = "candidate_id")
    private Candidate candidate;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "interview")
    private Set<ScheduledInterview> scheduleInterviews;

}
