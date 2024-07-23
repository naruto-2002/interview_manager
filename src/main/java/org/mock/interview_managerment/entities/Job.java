package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.mock.interview_managerment.entities.pk.StatusEnum;

import java.util.Date;

@Data
@Entity
@Table(name = "jobs")
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long jobId;

    private Date endDate;
    private Double salaryFrom;
    private Date startDate;
    private Double salaryTo;
    private String benefits;
    private String description;
    private String levels;
    private String location;
    private String title;
    private String workingAddress;

    @Enumerated(EnumType.STRING)
    private StatusEnum status;
}
