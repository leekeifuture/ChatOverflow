package com.company.controller;

import com.company.domain.Role;
import com.company.domain.User;
import com.company.repos.IUserRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {

    @Autowired
    private IUserRepo iUserRepo;

    @GetMapping("/registration")
    public String registration(Map<String, Object> model) {
        model.put("message", "");
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        User userFromDb = iUserRepo.findByUsername(user.getUsername());

        if (userFromDb != null) {
            model.put("message", "<span>User exists!</span>");
            return "registration";
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        iUserRepo.save(user);

        return "redirect:/login";
    }
}
