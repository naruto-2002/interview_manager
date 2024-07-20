package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "offers")
@Data
public class Offer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "candidate_id")
    private Candidate candidate;

    @ManyToOne
    @JoinColumn(name = "schedule_id")
    private Schedule schedule;

    private String status;
    private String contractPeriod;
    private String contractType;
    private String level;
    private String department;

    @ManyToOne
    @JoinColumn(name = "recruiter_owner_id")
    private User recruiterOwner;

    private Date dueDate;
    private double basicSalary;
    private String note;
}
