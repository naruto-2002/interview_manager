package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "scheduled_interviews")
public class ScheduledInterview {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long interviewId;

    @ManyToOne
    @JoinColumn(name = "interviewer_id")
    private User interviewer;
}
