package org.mock.interview_managerment.dto.request;

import jakarta.persistence.ElementCollection;
import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;
import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.enums.GenderEnum;
import org.mock.interview_managerment.enums.HighestLevelEnum;
import org.mock.interview_managerment.enums.PositionEnum;
import org.mock.interview_managerment.enums.StatusCandidateEnum;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Getter
@Setter
public class CandidateCreateDto {

    @NotBlank(message = "Name cannot be null")
    private String name;

    @NotBlank(message = "Email cannot be blank")
    @Email(message = "Email must be valid")
    private String email;


    private String phone;

    @NotNull(message = "Status cannot be null")
    private StatusCandidateEnum status;

    @NotNull(message = "Current position cannot be null")
    private PositionEnum currentPosition;

    private String cvAttachmentLink;

    @Size(min = 1, message = "At least one skill is required")
    @ElementCollection
    private List<@NotNull(message = "Skill cannot be blank") String> skills;


    @Positive(message = "Years of experience must be positive")
    private int yearsExperience;

    @NotNull(message = "Highest level cannot be null")
    private HighestLevelEnum highestLevel;

    @NotNull(message = "Date of birth cannot be null")
    @PastOrPresent(message = "Date of Birth must be in the past")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date dob;

    private String note;

    @NotBlank(message = "Address cannot be blank")
    private String address;

    @NotNull(message = "Gender cannot be null")
    private GenderEnum gender;

    private User user;
}
