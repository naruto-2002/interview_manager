package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.mock.interview_managerment.entities.pk.*;

import java.util.Date;

@Data
@Entity
@Table(name = "offers")
public class Offer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long offerId;

    private Double basicSalary;
    private Date dueDate;
    private Date endContract;
    private Date startContract;
    private String note;

    @Enumerated(EnumType.STRING)
    private ContractTypeEnum contractType;

    @Enumerated(EnumType.STRING)
    private DepartmentEnum department;

    @Enumerated(EnumType.STRING)
    private LevelEnum level;

    @Enumerated(EnumType.STRING)
    private PositionEnum position;

    @Enumerated(EnumType.STRING)
    private StatusEnum status;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User approver;

    @ManyToOne
    @JoinColumn(name = "interview_schedule_id")
    private InterviewSchedule interviewSchedule;

    @ManyToOne
    @JoinColumn(name = "candidate_id")
    private Candidate candidate;

}
