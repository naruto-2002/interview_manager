package org.mock.interview_managerment.repository;

import org.mock.interview_managerment.entities.Job;
import org.mock.interview_managerment.entities.Offer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OfferRepository extends JpaRepository<Offer, Long> {
    Page<Offer> findAll(Pageable pageable);

    @Query("SELECT o FROM Offer o WHERE o.deleted = false")
    Page<Offer> findAllActiveOffers(Pageable pageable);

    @Query("SELECT o FROM Offer o WHERE " +
            "LOWER(o.candidate.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.candidate.email) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.contractType) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.department) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.level) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.position) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.status) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    Page<Offer> findByKeyword(String keyword, Pageable pageable);

    @Query("SELECT o FROM Offer o WHERE " +
            "(LOWER(o.candidate.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.candidate.email) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.contractType) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.department) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.level) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.position) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(o.status) LIKE LOWER(CONCAT('%', :keyword, '%'))) AND " +
            "(:department IS NULL OR o.department = :department) AND " +
            "(:status IS NULL OR o.status = :status)")
    Page<Offer> findByKeywordAndDepartmentAndStatus(String keyword, String department, String status, Pageable pageable);


}
