package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.mock.interview_managerment.entities.pk.ResultEnum;
import org.mock.interview_managerment.entities.pk.StatusEnum;

import java.util.Date;

@Data
@Entity
@Table(name = "interviews")
public class Interview {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long interviewId;

    @ManyToOne
    @JoinColumn(name = "candidate_id")
    private Candidate candidate;

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
}
