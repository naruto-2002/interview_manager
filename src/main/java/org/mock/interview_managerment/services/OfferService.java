package org.mock.interview_managerment.services;

import org.mock.interview_managerment.DTO.request.OfferCreate;
import org.mock.interview_managerment.entities.Candidate;
import org.mock.interview_managerment.entities.Offer;
import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.mapper.OfferMapper;
import org.mock.interview_managerment.repository.CandidateRepository;
import org.mock.interview_managerment.repository.OfferRepository;
import org.mock.interview_managerment.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class OfferService {

    @Autowired
    private OfferRepository offerRepository;

    @Autowired
    private CandidateRepository candidateRepository;


    @Autowired
    private UserRepository userRepository;


    public Page<Offer> getOffersPaginated(Pageable pageable) {
        return offerRepository.findAll(pageable);
    }

    public Optional<Offer> getOfferById(Long id) {
        return offerRepository.findById(id);
    }

    @Transactional
    public void deleteOffer(Long id) {
        if (!offerRepository.existsById(id)) {
            throw new IllegalArgumentException("Offer with ID " + id + " does not exist.");
        }
        offerRepository.deleteById(id);
    }
}
