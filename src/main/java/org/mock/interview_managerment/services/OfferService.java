package org.mock.interview_managerment.services;

import org.mock.interview_managerment.entities.Offer;

import java.util.List;
import java.util.Optional;

public interface OfferService {
    List<Offer> getAllOffers();
    Optional<Offer> getOfferById(Long id);
    Offer saveOffer(Offer offer);
    void deleteOffer(Long id);
}
