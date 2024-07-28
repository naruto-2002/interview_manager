package org.mock.interview_managerment.enums;

public enum ResultEnum {
    PASSED("PASSED"),
    FAILED("FAILED"),
    PENDING("PENDING"),
    NA("N/A"); // Thêm giá trị NA với hiển thị N/A

    private final String displayName;

    ResultEnum(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }

    public static ResultEnum fromDisplayName(String displayName) {
        for (ResultEnum result : values()) {
            if (result.getDisplayName().equals(displayName)) {
                return result;
            }
        }
        throw new IllegalArgumentException("No enum constant with display name " + displayName);
    }
}