package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;
import org.mock.interview_managerment.enums.StatusJobEnum;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.ZoneId;

@Data
@Entity
@Table(name = "jobs")
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long jobId;

    private String title;
    private String description;
    private String requiredSkills;
    private String level;
    private Timestamp startDate;
    private Timestamp endDate;
    private String location;
    private String benefits;
    private StatusJobEnum status;
    private String salaryFrom;
    private String salaryTo;

    public LocalDate getStartDateAsLocalDate() {
        return startDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    public LocalDate getEndDateAsLocalDate() {
        return endDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }
}
