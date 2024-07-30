package org.mock.interview_managerment.controller;


import jakarta.validation.Valid;

import org.mock.interview_managerment.DTO.request.CandidateCreateDto;
import org.mock.interview_managerment.entities.Candidate;
import org.mock.interview_managerment.enums.GenderEnum;
import org.mock.interview_managerment.enums.HighestLevelEnum;
import org.mock.interview_managerment.enums.PositionEnum;
import org.mock.interview_managerment.enums.StatusCandidateEnum;
import org.mock.interview_managerment.repository.CandidateRepository;
import org.mock.interview_managerment.services.CandidateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller()
public class CandidateController {

    @Autowired
    private CandidateRepository candidateRepository;

    @Autowired
    private CandidateService candidateService;


    @GetMapping("/candidate")
    public String getAllCandidate(Model model, @RequestParam(value = "page", defaultValue = "0") int page,RedirectAttributes redirectAttributes) {
        Page<Candidate> candidates = null;

        candidates = candidateService.getAll(page).getBody();
        List<Candidate> candidates1 = candidates.getContent();

        List<Candidate> l = new ArrayList<>(candidates1);
        l = sort(l);
        model.addAttribute("p", candidates);
        model.addAttribute("gender", GenderEnum.values());
        model.addAttribute("position", PositionEnum.values());
        model.addAttribute("highlevel", HighestLevelEnum.values());

        model.addAttribute("candidates", l);
        return "/Candidate_view/list-candidate";
    }

    @GetMapping("/candidate/searchCandidate")
    public String search(@RequestParam(value = "search", defaultValue = "") String search, @RequestParam(value = "status", defaultValue = "") String status, Model model, @RequestParam(value = "page", defaultValue = "0") int page) {
        Page<Candidate> candidates = null;
        if (!status.equals("") && !search.equals("")) {
            StatusCandidateEnum status2 = StatusCandidateEnum.valueOf(status);
            candidates = candidateService.search(search, status2, page).getBody();

        }
        if (!status.equals("") && search.equals("")) {
            StatusCandidateEnum status2 = StatusCandidateEnum.valueOf(status);
            candidates = candidateService.findByStatus(status2, page).getBody();
        }
        if (status.equals("") && !search.equals("")) {
            candidates = candidateService.findBykey(search, page).getBody();
        }
        if (status.equals("") && search.equals("")) {
            candidates = candidateService.getAll(page).getBody();
        }
        if (candidates == null) {
            candidates = new PageImpl<>(new ArrayList<>(), PageRequest.of(page, 10), 0);
        }
        List<Candidate> candidates1 = candidates.getContent();
        List<Candidate> l = new ArrayList<>(candidates1);
        l = sort(l);
        model.addAttribute("p", candidates);
        model.addAttribute("candidates", l);
        if (candidates.isEmpty()) {
            model.addAttribute("message", "No item matches with your search data. Please try again");
        }
        String requestParams = "status=" + status + "&search=" + search;
        model.addAttribute("requestParams", requestParams);
        return "/Candidate_view/list-candidate";
    }

    @GetMapping("/candidate/addCandidateForward")
    public String fowardAddCandidate(Model model) {

        Candidate candidate = new Candidate();
        model.addAttribute("status", StatusCandidateEnum.values());
        model.addAttribute("candidate", candidate);
        return "/Candidate_view/add-candidate";
    }

    @PostMapping("/candidate/addCandidate")
    public String createCandidate(@Valid @ModelAttribute("candidate") CandidateCreateDto candidateCreateDto, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult.getAllErrors());
            model.addAttribute("bindingResult", bindingResult);
            model.addAttribute("message", "Failed to created candidate");
            return "/Candidate_view/add-candidate";
        }
        try {
            candidateService.create(candidateCreateDto);
        }catch (Exception e){
            redirectAttributes.addAttribute("message", "Failed to created candidate");
            return "/Candidate_view/add-candidate";
        }
        redirectAttributes.addFlashAttribute("message2", "Successfully created candidate");
        return "redirect:/candidate";
    }

    @GetMapping("/candidate/candidateDetail")

    public String viewDetail(@RequestParam("id") Long id, Model model) {
        Candidate candidate = candidateService.getById(id).getBody();
        model.addAttribute("candidate", candidate);
        return "/Candidate_view/candidate-details";
    }

    @GetMapping("/candidate/updateForward")
    public String updateForward(@RequestParam("id") Long id, Model model) {
        Candidate candidate = candidateService.getById(id).getBody();
        model.addAttribute("candidate", candidate);
        return "/Candidate_view/update-candidate";
    }

    @PostMapping("/candidate/updateCandidate")
    public String updateCandidate(@RequestParam("id") Long id, @ModelAttribute("candidate") Candidate candidate) {
        candidateService.updateCandidate(id, candidate);
        return "redirect:/candidate";
    }

    public List<Candidate> sort(List<Candidate> candidates) {
        Comparator<Candidate> custom = (c1, c2) -> {
            int c1Status = getStatusIndex(c1.getStatus().toString());
            int c2Status = getStatusIndex(c2.getStatus().toString());
            return Integer.compare(c1Status, c2Status);
        };
        Collections.sort(candidates, new Comparator<Candidate>() {
            @Override
            public int compare(Candidate c1, Candidate c2) {
                int c1Status = getStatusIndex(c1.getStatus().toString());
                int c2Status = getStatusIndex(c2.getStatus().toString());
                return Integer.compare(c1Status, c2Status);
            }


        });
        return candidates;
    }
    @GetMapping("/candidate/delete")
    public String deleteCandidate(@RequestParam("id") Long id,RedirectAttributes redirectAttributes) {
        candidateService.deleteCandidate(id);
        redirectAttributes.addFlashAttribute("message2", "Successfully delete candidate");

        return "redirect:/candidate";
    }
    @GetMapping("candidate/ban")
    public String banCandidate(@RequestParam("id") Long id,RedirectAttributes redirectAttributes) {
        candidateService.banCandidate(id);
        return "redirect:/candidate/candidateDetail?id="+id;
    }

    private int getStatusIndex(String status) {
        switch (status) {
            case "Waiting_for_interview":
                return 0;
            case "Waiting_for_approval":
                return 1;
            case "Waiting_for_response":
                return 2;
            case "OPEN":
                return 3;
            case "Passed_Interview":
                return 4;
            case "Approved_Offer":
                return 5;
            case "Rejected_Offer":
                return 6;
            case "Accepted_offer":
                return 7;
            case "Declined_offer":
                return 8;
            case "Cancelled_offer":
                return 9;
            case "Failed_interview":
                return 10;
            case "Cancelled_interview":
                return 11;
            case "BANNED":
                return 12;
            default:
                return -1;
        }
    }

}
