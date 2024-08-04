package dev.anhkiet.sportstore.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dev.anhkiet.sportstore.domain.Role;
import dev.anhkiet.sportstore.domain.User;
import dev.anhkiet.sportstore.domain.dto.RegisterDTO;
import dev.anhkiet.sportstore.repository.RoleRepository;
import dev.anhkiet.sportstore.repository.UserRepository;
import jakarta.servlet.ServletContext;

@Service
public class UserService {
    private UserRepository userRepository;
    private RoleRepository roleRepository;
    private ServletContext servletContext;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, ServletContext servletContext) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.servletContext = servletContext;
    }

    public User HandleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    public boolean checkExistEmail(String email) {
        User user = this.userRepository.findByEmail(email);
        if (user == null) {
            return false;
        } else
            return true;
    }

    public User getUserRegister(RegisterDTO userDTO) {
        User user = new User();
        user.setFullName(userDTO.getFirstName() + " " + userDTO.getLastName());
        user.setEmail(userDTO.getEmail());
        return user;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public Optional<User> getUserByID(long id) {
        return this.userRepository.findById(id);
    }

    public void DeleteUserByID(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    public String handleSaveFileUploading(MultipartFile file, String targetFolder) {
        // relative path: absolute path
        if (file.isEmpty()) {
            return "";
        }
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalName = "";
        try {
            byte[] bytes = file.getBytes();
            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            // uuid

            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return finalName;
    }

}
