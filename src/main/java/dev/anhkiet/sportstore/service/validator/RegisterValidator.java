package dev.anhkiet.sportstore.service.validator;

import org.springframework.stereotype.Service;

import dev.anhkiet.sportstore.domain.dto.RegisterDTO;
import dev.anhkiet.sportstore.service.UserService;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Service
public class RegisterValidator implements ConstraintValidator<Registerchecked, RegisterDTO> {
    private final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        // TODO Auto-generated method stub
        boolean valid = true;
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Password not match")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        if (userService.checkExistEmail(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email already exist")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        if (user.getFirstName().length() < 2) {
            context.buildConstraintViolationWithTemplate("At least 2 characters")
                    .addPropertyNode("firstName")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        if (user.getLastName().length() < 2) {
            context.buildConstraintViolationWithTemplate("At least 2 characters")
                    .addPropertyNode("lastName")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            valid = false;
        }
        return valid;
    }

}
