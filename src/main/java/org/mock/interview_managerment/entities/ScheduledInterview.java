package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Set;

@Data
@Entity
@Table(name = "scheduled_interviews")
public class ScheduledInterview {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long scheduledInterviewId;

    @ManyToOne
    @JoinColumn(name = "interview_id")
    private Interview interview;


    @ManyToOne
    @JoinColumn(name = "interviewer_id")
    private User interviewer;

    private String note;

}
