package org.mock.interview_managerment.services;

import lombok.RequiredArgsConstructor;
import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.repository.RoleRepository;
import org.mock.interview_managerment.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordService passwordService;
    private final RoleRepository roleRepository;

    public User handleSaveUser(User user) {
        //gen password
        String password = passwordService.autoGeneratePassword();
        password = "van123";
        String hashPasword = passwordService.encryptPassword(password);
        user.setPassword(hashPasword);

        // set role
        user.setRole(roleRepository.findByRoleName(user.getRole().getRoleName()));
        return userRepository.save(user);
    }

    public List<User> getUsersByRoleName(String roleName) {
        return userRepository.findByRoleName(roleName);
    }

    public User getByUserId(long userId) {
        return userRepository.findByUserId(userId);
    }

}
