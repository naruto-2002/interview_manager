package org.mock.interview_managerment;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

public class test {
    public static void main(String[] args) {
        PasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPassword = encoder.encode("1");
        System.out.println(encodedPassword);
    }
}
