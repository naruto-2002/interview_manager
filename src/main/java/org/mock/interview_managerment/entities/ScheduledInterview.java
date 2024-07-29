package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.io.Serializable;
import java.util.Set;
import org.mock.interview_managerment.entities.pk.ScheduledInterviewId;

@Data
@Entity
@Table(name = "scheduled_interviews")
public class ScheduledInterview implements Serializable {

    @EmbeddedId
    private ScheduledInterviewId id;

    @ManyToOne
    @MapsId("interviewId")
    @JoinColumn(name = "interview_id")
    private Interview interview;

    @ManyToOne
    @MapsId("interviewerId")
    @JoinColumn(name = "interviewer_id")
    private User interviewer;
}
