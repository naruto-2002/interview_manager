package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.mock.interview_managerment.enums.ResultEnum;
import org.mock.interview_managerment.enums.StatusEnum;
import org.mock.interview_managerment.enums.StatusInterviewEnum;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "interviews")
public class Interview {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long interviewId;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;
    private String startTime;
    private String endTime;
    private String location;
    private String meetingId;
    private String note;
    private String title;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private ResultEnum result;

    @Enumerated(EnumType.STRING)
    @Column(length = 20)
    private StatusInterviewEnum status;

    @ManyToOne
    @JoinColumn(name = "recruiter_id") // Đảm bảo tên cột đúng trong bảng cơ sở dữ liệu
    private User recruiter;

    @ManyToOne
    @JoinColumn(name = "job_id")
    private Job job;

    @ManyToOne
    @JoinColumn(name = "candidate_id")
    private Candidate candidate;

    @OneToMany(mappedBy = "interview", cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private List<ScheduledInterview> scheduledInterviews = new ArrayList<>();

    @Transient
    private List<Long> selectedInterviewerIds = new ArrayList<>();

}
