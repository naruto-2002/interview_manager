package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.mock.interview_managerment.enums.GenderEnum;
import org.mock.interview_managerment.enums.LevelEnum;
import org.mock.interview_managerment.enums.PositionEnum;
import org.mock.interview_managerment.enums.StatusEnum;

import java.util.Date;

@Data
@Entity
@Table(name = "candidates")
public class Candidate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long candidateId;

    private Date dob;
    private Integer yearOfExp;
    private String address;
    private String cv;
    private String email;
    private String fullName;
    private String note;
    private String phoneNumber;
    private String skills;

    @Enumerated(EnumType.STRING)
    private GenderEnum gender;

    @Enumerated(EnumType.STRING)
    private LevelEnum highestLevel;

    @Enumerated(EnumType.STRING)
    private PositionEnum position;

    @Enumerated(EnumType.STRING)
    private StatusEnum status;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
}
