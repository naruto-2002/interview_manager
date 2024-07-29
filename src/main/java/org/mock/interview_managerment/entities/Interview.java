package org.mock.interview_managerment.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;
import org.mock.interview_managerment.enums.ResultEnum;
import org.mock.interview_managerment.enums.StatusEnum;
import org.springframework.format.annotation.DateTimeFormat;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
    private StatusEnum status;

    @ManyToOne
    @JoinColumn(name = "recuriter_id")
    private User recruiter;

    @ManyToOne
    @JoinColumn(name = "job_id")
    private Job job;

    @ManyToOne
    @JoinColumn(name = "candidate_id")
    private Candidate candidate;

    @OneToMany(mappedBy = "interview", cascade = CascadeType.ALL)
    @EqualsAndHashCode.Exclude // không sử dụng trường này trong equals và hashcode
    @ToString.Exclude // Không sử dụng trong toString()
    private List<ScheduledInterview> scheduledInterviews;

    @Transient // Chú thích này để JPA không lưu trữ trường này vào cơ sở dữ liệu
    private List<Long> selectedInterviewerIds = new ArrayList<>();


}
