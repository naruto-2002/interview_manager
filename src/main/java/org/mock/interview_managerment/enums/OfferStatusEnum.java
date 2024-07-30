package org.mock.interview_managerment.enums;

public enum OfferStatusEnum {
    WAITING_FOR_APPROVAL("Waiting for Approval"),
    APPROVED("Approved"),
    REJECTED("Rejected"),
    ACCEPTED("Accepted Offer"),
    DECLINED("Declined Offer"),
    CANCELLED("Cancelled");


    private String value;

    private OfferStatusEnum(String value) {
        this.value = value;
    }

}
