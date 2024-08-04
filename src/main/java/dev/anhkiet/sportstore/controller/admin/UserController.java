package dev.anhkiet.sportstore.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import dev.anhkiet.sportstore.domain.User;
import dev.anhkiet.sportstore.service.UserService;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
    private UserService userService;
    private PasswordEncoder passwordEncoder;

    public UserController(UserService userService, PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashBoardPage() {
        return "admin/dashboard/show";
    }

    @GetMapping("/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/user/{ID}")
    public String getUserDetailPage(Model model, @PathVariable long ID) {
        Optional<User> user = this.userService.getUserByID(ID);
        if (user.isPresent()) {
            User realUser = user.get();
            model.addAttribute("User", realUser);
        }
        return "admin/user/detail";
    }

    @GetMapping("/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @PostMapping(value = "/admin/user/create")
    public String CreateUserPage(
            @ModelAttribute("newUser") @Valid User newUser, BindingResult bindingResult,
            @RequestParam("anhkietfile") MultipartFile file) {
        if (bindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String Avatar = this.userService.handleSaveFileUploading(file, "avatar");
        newUser.setRole(this.userService.getRoleByName(newUser.getRole().getName()));
        newUser.setPassWord(passwordEncoder.encode(newUser.getPassWord()));
        newUser.setAvatar(Avatar);
        User user = this.userService.HandleSaveUser(newUser);
        return "redirect:/user";
    }

    @GetMapping("/user/update/{ID}")
    public String getUserUpdatePage(Model model, @PathVariable long ID) {
        Optional<User> user = this.userService.getUserByID(ID);
        if (user.isPresent()) {
            User realUser = user.get();
            model.addAttribute("updatedUser", realUser);
        }
        return "admin/user/update";
    }

    @PostMapping(value = "/admin/user/update")
    public String postMethodName(@ModelAttribute("updatedUser") User updatedUser) {
        Optional<User> optionalUser = this.userService.getUserByID(updatedUser.getId());
        if (optionalUser.isPresent()) {
            User realUser = optionalUser.get();
            realUser.setAddress(updatedUser.getAddress());
            realUser.setFullName(updatedUser.getFullName());
            realUser.setPhoneNumber(updatedUser.getPhoneNumber());
            this.userService.HandleSaveUser(realUser);
        }
        return "redirect:/user";
    }

    @GetMapping("/user/delete/{ID}")
    public String getUserDeletePage(Model model, @PathVariable long ID) {
        model.addAttribute("id", ID);
        model.addAttribute("user", new User());
        return "admin/user/delete";
    }

    @PostMapping(value = "/admin/user/delete")
    public String postDeleteUser(@ModelAttribute("user") User user) {
        this.userService.DeleteUserByID(user.getId());
        return "redirect:/user";
    }

}
