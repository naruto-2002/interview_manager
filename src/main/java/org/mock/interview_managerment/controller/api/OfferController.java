package org.mock.interview_managerment.controller.api;

import org.mock.interview_managerment.DTO.request.OfferCreate;
import org.mock.interview_managerment.DTO.response.ApiResponse;
import org.mock.interview_managerment.DTO.response.PaginatedResponse;
import org.mock.interview_managerment.entities.Offer;
import org.mock.interview_managerment.services.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/offers")
public class OfferController {

    @Autowired
    private OfferService offerService;

    // Endpoint to get all offers with pagination
    @GetMapping("/paginated")
    public ApiResponse<PaginatedResponse<Offer>> getPaginatedOffers(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {

        Page<Offer> offerPage = offerService.getOffersPaginated(PageRequest.of(page, size));
        PaginatedResponse<Offer> response = PaginatedResponse.fromPage(offerPage);
        return new ApiResponse<>(true, response, "Fetched paginated offers successfully.");
    }

    // Endpoint to get offer by ID
    @GetMapping("/{id}")
    public ApiResponse<Optional<Offer>> getOfferById(@PathVariable Long id) {
        Optional<Offer> offer = offerService.getOfferById(id);
        return new ApiResponse<>(true, offer, "Fetched offer by ID successfully.");
    }

    // Endpoint to create a new offer
    @PostMapping
    public ApiResponse<Offer> createOffer(@RequestBody OfferCreate offerCreate) {
        Offer offer = offerService.createOffer(offerCreate);
        return new ApiResponse<>(true, offer, "Offer created successfully.");
    }

    // Endpoint to update an offer
    @PutMapping("/{id}")
    public ApiResponse<Offer> updateOffer(@PathVariable Long id, @RequestBody OfferCreate offerCreate) {
        Offer offer = offerService.updateOffer(id, offerCreate);
        return new ApiResponse<>(true, offer, "Offer updated successfully.");
    }

    // Endpoint to delete an offer by ID
    @DeleteMapping("/{id}")
    public ApiResponse<Void> deleteOffer(@PathVariable Long id) {
        offerService.deleteOffer(id);
        return new ApiResponse<>(true, null, "Offer deleted successfully.");
    }
}
