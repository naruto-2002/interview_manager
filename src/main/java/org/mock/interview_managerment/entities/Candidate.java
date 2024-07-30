package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.*;
import org.mock.interview_managerment.enums.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "candidates")
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Candidate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String email;
    private String phone;
    @Enumerated(EnumType.STRING)
    private StatusCandidateEnum status;
    @Enumerated(EnumType.STRING)
    private PositionEnum currentPosition;
    private String cvAttachmentLink;
    @ElementCollection
    private List<String> skills;

    private String recruiter;
    private int yearsExperience;
    @Enumerated(EnumType.STRING)
    private HighestLevelEnum highestLevel;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dob;
    private String note;
    private String address;

    @Enumerated(EnumType.STRING)
    private GenderEnum gender;

    @CreatedDate()
    @Column(nullable = false, updatable = false)
    private LocalDate createdAt;

    @LastModifiedDate
    @Column(nullable = false)
    private LocalDate updatedAt;


}
