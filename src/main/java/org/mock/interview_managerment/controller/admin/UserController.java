package org.mock.interview_managerment.controller.admin;

import jakarta.validation.Valid;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.mock.interview_managerment.dto.request.UserCreateDto;
import org.mock.interview_managerment.dto.response.UserDetailDto;
import org.mock.interview_managerment.dto.response.UserListDto;
import org.mock.interview_managerment.dto.response.UserUpdateDto;
import org.mock.interview_managerment.entities.User;
import org.mock.interview_managerment.enums.*;
import org.mock.interview_managerment.repository.UserRepository;
import org.mock.interview_managerment.services.RoleService;
import org.mock.interview_managerment.services.UserService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Optional;

@Controller
public class UserController {

//    private final UserService userService;
//    private final RoleService roleService;
//
//    public UserController(UserService userService, RoleService roleService) {
//        this.userService = userService;
//        this.roleService = roleService;
//    }
//
//    @GetMapping("/user")
//    public String getListUsersPage(@RequestParam(name = "page", defaultValue = "0") Integer page, Model model) {
//        Pageable pageable = PageRequest.of(page, 5);
//        Page<UserListDto> userPage = userService.handleGetAllUsers(pageable);
//
//        populateModelAttributes(model);
//        model.addAttribute("listRole", roleService.handleGetAllRole());
//        model.addAttribute("userPage", userPage);
//        model.addAttribute("page", userPage.getNumber() + 1);
//        model.addAttribute("pageSize", userPage.getTotalPages());
//
//        return "user/list";
//    }
//
//    @GetMapping("/user/create")
//    public String getCreateUserPage(Model model) {
//        model.addAttribute("newUser", new UserCreateDto());
//        populateModelAttributes(model);
//        return "user/create";
//    }
//
//    @PostMapping("/user/create")
//    public String createUser(@Valid @ModelAttribute("newUser") UserCreateDto request,
//                             BindingResult bindingResult, Model model) {
//        if (bindingResult.hasErrors()) {
//            return "user/create";
//        }
//
//        userService.handleSaveUser(request);
//        return "redirect:/user";
//    }
//
//    @GetMapping("/user/detail/{userId}")
//    public String getUserDetailPage(@PathVariable("userId") Long userId, Model model) {
//
//        populateModelAttributes(model);
//        UserDetailDto userDetail = userService.handleGetUserDetail(userId);
//        System.out.println(userDetail);
//        model.addAttribute("userDetail", userDetail);
//        return "user/detail";
//    }
//
//    @PostMapping("/update-status")
//    public ResponseEntity<Void> updateStatus(@RequestBody Map<String, String> requestBody) {
//        Long userId = Long.valueOf(requestBody.get("userId"));
//
//        // Cập nhật trạng thái của người dùng
//        userService.toggleStatus(userId);
//
//        return ResponseEntity.ok().build();
//    }
//
//    @GetMapping("/user/update/{userId}")
//    public String getUserUpdatePage(@PathVariable("userId") Long userId, Model model) {
//
//        UserUpdateDto userUpdateDto = userService.handleGetUserById(userId);
//        System.out.println(userUpdateDto);
//        populateModelAttributes(model);
//        model.addAttribute("user", userUpdateDto);
//        return "user/update";
//    }
//
//    @PostMapping("/user/update")
//    public String updateUser(@Valid @ModelAttribute("user") UserUpdateDto request,
//                             BindingResult bindingResult, Model model) {
//        if (bindingResult.hasErrors()) {
//            return "user/update";
//        }
//
//        userService.handleUpdateUser(request);
//        return "redirect:/user";
//    }
//
//    @GetMapping("/user/search")
//    public String searchByKeyword(@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword, Model model) {
//        model.addAttribute("userPage", userService.search(keyword));
//        populateModelAttributes(model);
//        return "user/list";
//    }
//
//    @GetMapping("/login")
//    public String getPageLogin() {
//        return "auth/login";
//    }
//
//    @GetMapping("/forgot-password")
//    public String getPageForgotPassword() {
//
//        return "auth/forgot-password";
//    }
//
//    @GetMapping("/reset-password")
//    public String resetPassword(@RequestParam(name = "email") String email) {
//        System.out.println(email);
//        return "auth/forgot-password";
//    }
//    private void populateModelAttributes(Model model) {
//        model.addAttribute("benefits", BenefitEnum.values());
//        model.addAttribute("contractTypes", ContractTypeEnum.values());
//        model.addAttribute("departments", DepartmentEnum.values());
//        model.addAttribute("genders", GenderEnum.values());
//        model.addAttribute("highestLevels", HighestLevelEnum.values());
//        model.addAttribute("levels", LevelEnum.values());
//        model.addAttribute("offerStatuses", OfferStatusEnum.values());
//        model.addAttribute("positions", PositionEnum.values());
//        model.addAttribute("results", ResultEnum.values());
//        model.addAttribute("roles", RoleEnum.values());
//        model.addAttribute("skills", SkillEnum.values());
//        model.addAttribute("statuses", StatusEnum.values());
//    }

}
