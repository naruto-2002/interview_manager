package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "schedules")
@Data
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "candidate_id")
    private Candidate candidate;

    @OneToMany(mappedBy = "schedules")
    private List<User> interviewer;

    @OneToOne
    @JoinColumn(name = "job_id")
    private Job job;

    private Date scheduleTime;
    private String status;
    private String title;
    private String location;
    private String meetingId;
}
