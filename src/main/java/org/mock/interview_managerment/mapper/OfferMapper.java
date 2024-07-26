package org.mock.interview_managerment.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mock.interview_managerment.DTO.request.OfferCreate;
import org.mock.interview_managerment.entities.Candidate;
import org.mock.interview_managerment.entities.Offer;
import org.mock.interview_managerment.entities.Schedule;
import org.mock.interview_managerment.entities.User;

@Mapper(componentModel = "spring")
public interface OfferMapper {

    @Mapping(target = "id", ignore = true)  // ID is auto-generated
    @Mapping(target = "candidate", source = "candidate")
    @Mapping(target = "schedule", source = "schedule")
    @Mapping(target = "recruiterOwner", source = "recruiterOwner")
    @Mapping(target = "status", source = "dto.status")
    @Mapping(target = "contractPeriod", source = "dto.contractPeriod")
    @Mapping(target = "contractType", source = "dto.contractType")
    @Mapping(target = "level", source = "dto.level")
    @Mapping(target = "department", source = "dto.department")
    @Mapping(target = "dueDate", source = "dto.dueDate")
    @Mapping(target = "basicSalary", source = "dto.basicSalary")
    @Mapping(target = "note", source = "dto.note")
    Offer toOffer(OfferCreate dto, Candidate candidate, Schedule schedule, User recruiterOwner);
}
