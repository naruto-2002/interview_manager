package org.mock.interview_managerment.controller;

import org.mock.interview_managerment.entities.Offer;
import org.mock.interview_managerment.services.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/offers")
public class OfferController {

    @Autowired
    private OfferService offerService;

    @GetMapping
    public String getAllOffers(Model model) {
        List<Offer> offers = offerService.getAllOffers();
        model.addAttribute("offers", offers);
        return "offers/list";
    }

    @GetMapping("/{id}")
    public String getOfferById(@PathVariable Long id, Model model) {
        Optional<Offer> offer = offerService.getOfferById(id);
        if (offer.isPresent()) {
            model.addAttribute("offer", offer.get());
            return "offers/view";
        } else {
            return "redirect:/offers";
        }
    }

    @GetMapping("/new")
    public String createOfferForm(Model model) {
        model.addAttribute("offer", new Offer());
        return "offers/form";
    }

    @PostMapping
    public String saveOffer(@ModelAttribute Offer offer) {
        offerService.saveOffer(offer);
        return "redirect:/offers";
    }

    @GetMapping("/delete/{id}")
    public String deleteOffer(@PathVariable Long id) {
        offerService.deleteOffer(id);
        return "redirect:/offers";
    }
}
