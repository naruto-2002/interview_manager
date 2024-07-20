package org.mock.interview_managerment.services;

import lombok.Data;
import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
@Data
public class UserService {

    private final UserRepository userRepository;


    public User hanldeSaveUser(User user) {
        return userRepository.save(user);
    }
}
