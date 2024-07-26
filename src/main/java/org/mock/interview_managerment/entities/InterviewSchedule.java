package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.mock.interview_managerment.entities.pk.ResultEnum;
import org.mock.interview_managerment.entities.pk.StatusEnum;

import java.util.Date;
import java.util.Set;

@Data
@Entity
@Table(name = "interview_schedules")
public class InterviewSchedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long interview_schedule_id;

    private Date endTime;
    private Date startTime;
    private String location;
    private String meetingId;
    private String note;
    private String title;

    @Enumerated(EnumType.STRING)
    private ResultEnum result;

    @Enumerated(EnumType.STRING)
    private StatusEnum status;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User interviewer;

    @ManyToOne
    @JoinColumn(name = "job_id")
    private Job job;

    @ManyToOne
    @JoinColumn(name = "candidate_id")
    private Candidate candidate;

}
