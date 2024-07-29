package org.mock.interview_managerment.services;

import org.mock.interview_managerment.dto.request.UserCreateDto;
import org.mock.interview_managerment.dto.response.UserDetailDto;
import org.mock.interview_managerment.dto.response.UserListDto;
import org.mock.interview_managerment.dto.response.UserUpdateDto;
import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.enums.StatusEnum;
import org.mock.interview_managerment.mapper.UserMapper;
import org.mock.interview_managerment.repository.RoleRepository;
import org.mock.interview_managerment.repository.UserRepository;
import org.mock.interview_managerment.util.UserNameValid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserService {

//    @Autowired
//    private UserRepository userRepository;
//
//    @Autowired
//    private PasswordService passwordService;
//
//    @Autowired
//    private RoleRepository roleRepository;
//
//    @Autowired
//    private SendEmailService sendEmailService;
//
//    @Autowired
//    private UserMapper userMapper;
//
//    public UserService(UserRepository userRepository,
//                       PasswordService passwordService,
//                       RoleRepository roleRepository,
//                       SendEmailService sendEmailService,
//                       UserMapper userMapper) {
//        this.userRepository = userRepository;
//        this.passwordService = passwordService;
//        this.roleRepository = roleRepository;
//        this.sendEmailService = sendEmailService;
//        this.userMapper = userMapper;
//    }
//
//    public User handleSaveUser(UserCreateDto request) {
//        // mapper entity
//        User user = userMapper.toUser(request);
//
//        //gen password
//        String password = passwordService.autoGeneratePassword();
//        String hashPasword = passwordService.encryptPassword(password);
//        user.setPassword(hashPasword);
//
//        user = userRepository.save(user);
//        user.setUsername(UserNameValid.genUserName(user.getFullName(), user.getUserId()));
//
//        // send password to email
////        sendEmailService.sendPasswordCreate(user.getEmail(), user.getUsername(), password);
//
//        return userRepository.save(user);
//    }
//
//    public Page<UserListDto> handleGetAllUsers(Pageable pageable) {
//        Page<User> userPage = userRepository.findAll(pageable);
//        List<UserListDto> userListDtos = userPage.getContent().stream()
//                .map(userMapper::toUserListDto)
//                .collect(Collectors.toList());
//
//        return new PageImpl<>(userListDtos, pageable, userPage.getTotalElements());
//    }
//
//    public UserDetailDto handleGetUserDetail(Long userId) {
//        return userMapper.toUserDetailDto(userRepository.findById(userId).get());
//    }
//
//    public void toggleStatus(Long userId) {
//        User user = userRepository.findById(userId).orElse(null);
//        if (user != null) {
//            user.setStatus(user.getStatus().name().equals("ACTIVE") ? StatusEnum.INACTIVE : StatusEnum.ACTIVE);
//            userRepository.save(user);
//        }
//    }
//
//    public UserUpdateDto handleGetUserById(Long userId) {
//        return userMapper.toUserUpdateDto(userRepository.findByUserId(userId));
//    }
//
//    public User handleUpdateUser(UserUpdateDto request) {
//        User user = userMapper.toUser(request);
//        user.setUsername(UserNameValid.genUserName(user.getFullName(), user.getUserId()));
//        return userRepository.save(user);
//    }
//
//    public User getUserByUsername(String username) {
//        return userRepository.findByUsername(username);
//    }
//
//    public List<UserListDto> search(String keyword) {
//        return userRepository.search(keyword).stream()
//                .map(userMapper::toUserListDto)
//                .collect(Collectors.toList());
//    }
//
//    public List<User> getManagers() {
//        return userRepository.findByRoleRoleName("MANAGER");
//    }
//
//    public List<User> getRecruiters() {
//        return userRepository.findByRoleRoleName("RECRUITER");
//    }


}
