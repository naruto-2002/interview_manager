package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Offer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OfferRepository extends JpaRepository<Offer, Long> {
}