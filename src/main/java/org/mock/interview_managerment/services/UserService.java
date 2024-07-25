package org.mock.interview_managerment.services;

import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.repository.RoleRepository;
import org.mock.interview_managerment.repository.UserRepository;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final PasswordService passwordService;
    private final RoleRepository roleRepository;
    private final SendEmailService sendEmailService;

    public UserService(UserRepository userRepository,
                       PasswordService passwordService,
                       RoleRepository roleRepository,
                       SendEmailService sendEmailService) {
        this.userRepository = userRepository;
        this.passwordService = passwordService;
        this.roleRepository = roleRepository;
        this.sendEmailService = sendEmailService;
    }

    public User handleSaveUser(User user) {
        //gen password
        String password = passwordService.autoGeneratePassword();
        // send password to email
        sendEmailService.sendPasswordCreate(user.getEmail(), password);
        String hashPasword = passwordService.encryptPassword(password);
        user.setPassword(hashPasword);
        // set role
        user.setRole(roleRepository.findByRoleName(user.getRole().getRoleName()));
        return userRepository.save(user);
    }
}
