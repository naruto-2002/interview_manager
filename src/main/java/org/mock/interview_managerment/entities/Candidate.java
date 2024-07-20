package org.mock.interview_managerment.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "candidates")
@Data
public class Candidate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String phone;
    private String status;
    private String currentPosition;
    private String cvAttachmentLink;
    private String skills;
    private String recruiter;
    private int yearsExperience;
    private String highestLevel;
    private Date dob;
    private String address;
    private String gender;

    @OneToMany(mappedBy = "candidate")
    private List<Application> applications;

    @OneToMany(mappedBy = "candidate")
    private List<Schedule> schedules;

    @OneToMany(mappedBy = "candidate")
    private List<Offer> offers;
}
