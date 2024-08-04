package org.mock.interview_managerment.controller;

import io.micrometer.common.util.StringUtils;
import org.mock.interview_managerment.entities.Candidate;
import org.mock.interview_managerment.entities.Interview;
import org.mock.interview_managerment.entities.Offer;
import org.mock.interview_managerment.enums.*;
import org.mock.interview_managerment.services.*;
import org.mock.interview_managerment.util.OfferSpecification;
import org.mock.interview_managerment.util.OfferUtils;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
                             @RequestParam(required = false) DepartmentEnum department,
                             @RequestParam(required = false) OfferStatusEnum status) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Offer> offerPage;

        if (StringUtils.isNotBlank(keyword) || department != null || status != null) {
            offerPage = offerService.findOffersByDepartmentAndStatusAndSearchKey(department, status, keyword, pageable);
            model.addAttribute("keyword", keyword);
            model.addAttribute("department", department);
            model.addAttribute("status", status);
        } else {
            offerPage = offerService.getAllOffers(pageable);
        }

        model.addAttribute("offerPage", offerPage);
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
    public String cancelOffer(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        Offer offer = offerService.findById(id);
        if (offer != null) { // Check if the offer is found
            // Approve the offer
            offerService.cancelOffer(id);

            // Update the candidate's status
            Candidate candidate = offer.getCandidate();
            candidate.setStatus(StatusCandidateEnum.Cancelled_offer);
            candidateService.updateCandidatenew(candidate.getId(), candidate);

            Interview interview = offer.getInterview();
            interview.setStatus(StatusInterviewEnum.CANCELLED);
            interviewService.updateInterview(interview);

            redirectAttributes.addFlashAttribute("message", "Offer approved successfully.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Offer not found.");
        }
        return "redirect:/offers"; // redirect to offer list
    }

    @GetMapping("/approve/{id}")
    public String approveOffer(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        Offer offer = offerService.findById(id);
        if (offer != null) { // Check if the offer is found
            // Approve the offer
            offerService.approveOffer(id);

            // Update the candidate's status
            Candidate candidate = offer.getCandidate();
            candidate.setStatus(StatusCandidateEnum.Approved_offer);
            candidateService.updateCandidatenew(candidate.getId(), candidate);

            redirectAttributes.addFlashAttribute("message", "Offer approved successfully.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Offer not found.");
        }
        return "redirect:/offers"; // redirect to offer list
    }


    @GetMapping("/reject/{id}")
    public String rejectOffer(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        Offer offer = offerService.findById(id);
        if (offer != null) { // Check if the offer is found
            // Approve the offer
            offerService.rejectOffer(id);

            // Update the candidate's status
            Candidate candidate = offer.getCandidate();
            candidate.setStatus(StatusCandidateEnum.Rejected_offer);
            candidateService.updateCandidatenew(candidate.getId(), candidate);

            redirectAttributes.addFlashAttribute("message", "Offer approved successfully.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Offer not found.");
        }
        return "redirect:/offers"; // redirect to offer list
    }

    @GetMapping("/send/{id}")
    public String markAsSent(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        Offer offer = offerService.findById(id);
        if (offer != null) { // Check if the offer is found
            // Approve the offer
            offerService.markAsSent(id);

            // Update the candidate's status
            Candidate candidate = offer.getCandidate();
            candidate.setStatus(StatusCandidateEnum.Waiting_for_response);
            candidateService.updateCandidatenew(candidate.getId(), candidate);

            redirectAttributes.addFlashAttribute("message", "Offer approved successfully.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Offer not found.");
        }
        return "redirect:/offers"; // redirect to offer list
    }

    @GetMapping("/decline/{id}")
    public String declineOffer(@PathVariable Long id, RedirectAttributes redirectAttributes) {

        Offer offer = offerService.findById(id);
        if (offer != null) { // Check if the offer is found
            // Approve the offer
            offerService.declineOffer(id);

            // Update the candidate's status
            Candidate candidate = offer.getCandidate();
            candidate.setStatus(StatusCandidateEnum.Declined_offer);
            candidateService.updateCandidatenew(candidate.getId(), candidate);

            redirectAttributes.addFlashAttribute("message", "Offer approved successfully.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Offer not found.");
        }
        return "redirect:/offers"; // redirect to offer list
    }

    @GetMapping("/accept/{id}")
    public String acceptOffer(@PathVariable Long id, RedirectAttributes redirectAttributes) {


        Offer offer = offerService.findById(id);
        if (offer != null) { // Check if the offer is found
            // Approve the offer
            offerService.acceptOffer(id);

            // Update the candidate's status
            Candidate candidate = offer.getCandidate();
            candidate.setStatus(StatusCandidateEnum.Accepted_offer);
            candidateService.updateCandidatenew(candidate.getId(), candidate);

            redirectAttributes.addFlashAttribute("message", "Offer approved successfully.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Offer not found.");
        }
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
        offer.setStatus(OfferStatusEnum.WAITING_FOR_APPROVAL);
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

        Candidate candidate = candidateService.getById(offer.getOfferId()).getBody();
        candidate.setStatus(StatusCandidateEnum.Waiting_for_approval);
        candidateService.updateCandidatenew(candidate.getId(), candidate);
        offerService.saveOffer(offer);
        return "redirect:/offers";
    }

    @GetMapping("/edit/{id}")
    public String editOfferForm(@PathVariable Long id, Model model) {
        String redirect = OfferUtils.checkOfferStatus(id, offerService);
        if (redirect != null) {
            return redirect;
        }

        Offer offer = offerService.getOfferById(id);

        if (offer == null) {
            return "redirect:/offers";
        }

        if (offer.getStatus() == OfferStatusEnum.APPROVED) {
            return "redirect:/offers/detail/" + id;
        }

        model.addAttribute("offer", offer);
        populateModelAttributes(model);
        return "offers/edit_offer";
    }


    @PostMapping("/{id}")
    public String updateOffer(@PathVariable Long id, @ModelAttribute("offer") Offer offer, BindingResult result, Model model) {
        String redirect = OfferUtils.checkOfferStatus(id, offerService);
        if (redirect != null) {
            return redirect;
        }
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
        offerService.updateOffer(offer);
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

    @GetMapping("/export")
    public String filterOffers(Model model, @RequestParam(required = false) Date start, @RequestParam(required = false) Date end) {
        if(start != null && end != null) {
            List<Offer> filteredOffers = offerService.getOffersByDateRange(start, end);
            model.addAttribute("offers", filteredOffers);
        }


        // Add the start and end dates back to the model to repopulate the form fields
        model.addAttribute("start", start);
        model.addAttribute("end", end);

        // Load necessary data for dropdowns and other form elements if required
        populateModelAttributes(model);
        return "offers/export-offer";
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
