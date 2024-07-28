package org.mock.interview_managerment.entities.pk;
import jakarta.persistence.Embeddable;
import lombok.Data;

import java.io.Serializable;
import java.util.Objects;

@Data
@Embeddable
public class ScheduledInterviewId implements Serializable {

    private Long interviewId;
    private Long interviewerId;
}
