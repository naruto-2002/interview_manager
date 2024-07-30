package org.mock.interview_managerment.mapper;


import org.mock.interview_managerment.DTO.request.CandidateCreateDto;
import org.mock.interview_managerment.entities.Candidate;

public class CandidateMapper {
    public static Candidate toCandidate(CandidateCreateDto candidateCreateDto){
        Candidate candidate = new Candidate();
        candidate.setAddress(candidateCreateDto.getAddress());
        candidate.setEmail(candidateCreateDto.getEmail());
        candidate.setName(candidateCreateDto.getName());
        candidate.setPhone(candidateCreateDto.getPhone());
        candidate.setDob(candidateCreateDto.getDob());
        candidate.setGender(candidateCreateDto.getGender());
        candidate.setStatus(candidateCreateDto.getStatus());
        candidate.setCurrentPosition(candidateCreateDto.getCurrentPosition());
        candidate.setCvAttachmentLink(candidateCreateDto.getCvAttachmentLink());
        candidate.setHighestLevel(candidateCreateDto.getHighestLevel());
        candidate.setCvAttachmentLink(candidateCreateDto.getCvAttachmentLink());
        candidate.setSkills(candidateCreateDto.getSkills());
        candidate.setYearsExperience(candidateCreateDto.getYearsExperience());
        return candidate;
    }
}
