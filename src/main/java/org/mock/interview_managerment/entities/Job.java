package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "jobs")
@Data
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;
    private String requiredSkills;
    private String level;
    private Date startDate;
    private Date endDate;
    private String location;
    private String benefits;

    @OneToMany(mappedBy = "job")
    private List<Application> applications;

}
