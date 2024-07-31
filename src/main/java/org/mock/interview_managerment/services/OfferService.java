package org.mock.interview_managerment.services;

import org.mock.interview_managerment.entities.Offer;
import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.enums.OfferStatusEnum;
import org.mock.interview_managerment.repository.OfferRepository;
import org.mock.interview_managerment.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class OfferService {

    @Autowired
    private OfferRepository offerRepository;
    @Autowired
    private UserRepository userRepository;

    public Page<Offer> getOffers(int page, int size) {
        return offerRepository.findAll(PageRequest.of(page, size));
    }

    public Page<Offer> searchOffers(String keyword, String department, String status, Pageable pageable) {
        if (keyword == null && department == null && status == null) {
            return offerRepository.findAll(pageable);
        }
        return offerRepository.findByKeywordAndDepartmentAndStatus(keyword, department, status, pageable);
    }

    public Page<Offer> getAllOffers(Pageable pageable) {
        return offerRepository.findAllActiveOffers(pageable);
    }


    public Offer saveOffer(Offer offer) {
        return offerRepository.save(offer);
    }

    public Offer getOfferById(Long id) {
        return offerRepository.findById(id).orElse(null);
    }

    public void deleteOffer(Long id) {
        Offer offer = getOfferById(id);
        if (offer != null) {
            offer.setDeleted(true);
            offerRepository.save(offer);
        }
    }

    public Offer findById(Long id) {
        return offerRepository.findById(id).orElseThrow(() -> new RuntimeException("Offer not found"));
    }

    public void cancelOffer(Long id) {
        Offer offer = findById(id);
        offer.setStatus(OfferStatusEnum.CANCELLED);
        offerRepository.save(offer);
    }

    public void approveOffer(Long id) {
        Offer offer = findById(id);
        offer.setStatus(OfferStatusEnum.APPROVED);
        offerRepository.save(offer);
    }

    public void rejectOffer(Long id) {
        Offer offer = findById(id);
        offer.setStatus(OfferStatusEnum.REJECTED);
        offerRepository.save(offer);
    }

    public void markAsSent(Long id) {
        Offer offer = findById(id);
        // Implement the logic for marking as sent to candidate
        offer.setStatus(OfferStatusEnum.ACCEPTED);
        offerRepository.save(offer);
    }

    public void declineOffer(Long id) {
        Offer offer = findById(id);
        offer.setStatus(OfferStatusEnum.DECLINED);
        offerRepository.save(offer);
    }

    public void deleteOfferByInterviewId(Long interviewId) {
        offerRepository.deleteByInterviewId(interviewId);
    }
}
