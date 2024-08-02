package org.mock.interview_managerment.controller;

import org.mock.interview_managerment.entities.Offer;
import org.mock.interview_managerment.enums.*;
import org.mock.interview_managerment.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
//import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/offers")
public class OfferController {

    @Autowired
    private OfferService offerService;
    @Autowired
    private CandidateService candidateService;
    @Autowired
    private UserService userService;
    @Autowired
    private InterviewService interviewService;

    @GetMapping
    @PreAuthorize("hasRole('MANAGER')")
    public String listOffers(Model model,
                             @RequestParam(defaultValue = "0") int page,
                             @RequestParam(defaultValue = "10") int size,
                             @RequestParam(required = false) String keyword,
                             @RequestParam(required = false) String department,
                             @RequestParam(required = false) String status) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Offer> offerPage;

        if ((keyword != null && !keyword.trim().isEmpty()) ||
                (department != null && !department.isEmpty()) ||
                (status != null && !status.isEmpty())) {
            offerPage = offerService.searchOffers(keyword, department, status, pageable);
            model.addAttribute("keyword", keyword);
            model.addAttribute("department", department);
            model.addAttribute("status", status);
        } else {
            offerPage = offerService.getAllOffers(pageable);
        }

        // Handle the case where no valid offers are found
        if (offerPage.isEmpty()) {
            model.addAttribute("offerPage", Page.empty());
        } else {
            model.addAttribute("offerPage", offerPage);
        }

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", offerPage.getTotalPages());
        model.addAttribute("departments", DepartmentEnum.values());
        model.addAttribute("statuses", OfferStatusEnum.values());
        return "offers/index";
    }

    @GetMapping("/delete/{id}")
    public String deleteOffer(@PathVariable Long id) {
        offerService.deleteOffer(id);
        return "redirect:/offers";
    }

    @GetMapping("/cancel/{id}")
    public String cancelOffer(@PathVariable Long id) {
        offerService.cancelOffer(id);
        return "redirect:/offers"; // redirect to offer list
    }

    @GetMapping("/approve/{id}")
    public String approveOffer(@PathVariable Long id) {
        offerService.approveOffer(id);
        return "redirect:/offers"; // redirect to offer list
    }

    @GetMapping("/reject/{id}")
    public String rejectOffer(@PathVariable Long id) {
        offerService.rejectOffer(id);
        return "redirect:/offers"; // redirect to offer list
    }

    @GetMapping("/send/{id}")
    public String markAsSent(@PathVariable Long id) {
        offerService.markAsSent(id);
        return "redirect:/offers"; // redirect to offer list
    }

    @GetMapping("/decline/{id}")
    public String declineOffer(@PathVariable Long id) {
        offerService.declineOffer(id);
        return "redirect:/offers"; // redirect to offer list
    }

    @GetMapping("/accept/{id}")
    public String acceptOffer(@PathVariable Long id) {
        offerService.acceptOffer(id);
        return "redirect:/offers"; // redirect to offer list
    }


    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new org.springframework.beans.propertyeditors.CustomDateEditor(dateFormat, true));
    }

    @GetMapping("/new")
    public String createOfferForm(Model model) {
        model.addAttribute("offer", new Offer());
        populateModelAttributes(model);
        return "offers/create_offer";
    }

    @PostMapping
    public String saveOffer(@ModelAttribute("offer") Offer offer, BindingResult result, Model model) {
        if (result.hasErrors()) {
            populateModelAttributes(model);
            return "offers/create_offer";
        }
        // Kiểm tra logic: startContract trước endContract
        if (offer.getStartContract().after(offer.getEndContract())) {
            result.rejectValue("startContract", "error.offer", "Start date must be before end date.");
            populateModelAttributes(model);
            return "offers/create_offer";
        }

        // Kiểm tra logic: dueDate trong tương lai
        if (offer.getDueDate().before(new Date())) {
            result.rejectValue("dueDate", "error.offer", "Due date must be in the future.");
            populateModelAttributes(model);
            return "offers/create_offer";
        }
        offer.setStatus(OfferStatusEnum.WAITING_FOR_APPROVAL);
        offerService.saveOffer(offer);
        return "redirect:/offers";
    }

    @GetMapping("/edit/{id}")
    public String editOfferForm(@PathVariable Long id, Model model) {
        Offer offer = offerService.getOfferById(id);
        if (offer != null) {
            model.addAttribute("offer", offer);
            populateModelAttributes(model);
            return "offers/edit_offer";
        }

        return "redirect:/offers";
    }

    @PostMapping("/{id}")
    public String updateOffer(@PathVariable Long id, @ModelAttribute("offer") Offer offer, BindingResult result, Model model) {
        if (result.hasErrors()) {
            offer.setOfferId(id);
            populateModelAttributes(model);
            return "offers/edit_offer";
        }

        // Kiểm tra logic: startContract trước endContract
        if (offer.getStartContract().after(offer.getEndContract())) {
            result.rejectValue("startContract", "error.offer", "Start date must be before end date.");
            populateModelAttributes(model);
            return "offers/create_offer";
        }

        // Kiểm tra logic: dueDate trong tương lai
        if (offer.getDueDate().before(new Date())) {
            result.rejectValue("dueDate", "error.offer", "Due date must be in the future.");
            populateModelAttributes(model);
            return "offers/create_offer";
        }
        offer.setOfferId(id);
        offerService.saveOffer(offer);
        return "redirect:/offers";
    }

    @GetMapping("/detail/{id}")
    public String viewOfferDetail(@PathVariable Long id, Model model, @AuthenticationPrincipal UserDetails userDetails) {
        Offer offer = offerService.getOfferById(id);
        model.addAttribute("user", userDetails.getClass());
        if (offer != null) {
            model.addAttribute("offer", offer);

            // Định dạng ngày
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-YYYY");
            String startDate = dateFormat.format(offer.getStartContract());
            String endDate = dateFormat.format(offer.getEndContract());
            String dueDate = dateFormat.format(offer.getDueDate());

            model.addAttribute("startDate", startDate);
            model.addAttribute("endDate", endDate);
            model.addAttribute("dueDate", endDate);
            return "offers/detail_offer";
        }
        return "redirect:/offers";
    }

    private void populateModelAttributes(Model model) {
        model.addAttribute("contractTypes", ContractTypeEnum.values());
        model.addAttribute("departments", DepartmentEnum.values());
        model.addAttribute("levels", LevelEnum.values());
        model.addAttribute("positions", PositionEnum.values());
        model.addAttribute("statuses", OfferStatusEnum.values());
        model.addAttribute("candidates", candidateService.getCandidatesWithPassedInterview());
        model.addAttribute("interviews", interviewService.getAllInterviews());
        model.addAttribute("managers", userService.getManagers());
        model.addAttribute("recruiters", userService.getRecruiters());
    }
}
