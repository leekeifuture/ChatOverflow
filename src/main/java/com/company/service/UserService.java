package com.company.service;

import com.company.domain.Role;
import com.company.domain.User;
import com.company.repos.IUserRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Collections;
import java.util.UUID;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private IUserRepo iUserRepo;

    @Autowired
    private MailSender mailSender;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return iUserRepo.findByUsername(username);
    }

    public boolean addUser(User user) {
        User userFromDb = iUserRepo.findByUsername(user.getUsername());

        if (userFromDb != null)
            return false;

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        user.setActivationCode(UUID.randomUUID().toString());

        iUserRepo.save(user);

        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format("Hello, %s!\n" +
                            "Welcome to ChatOverflow. Please, visit next link for activate account: http://localhost:8080/activate/%s",
                    user.getUsername(),
                    user.getActivationCode());
        }

        return true;
    }

    public boolean activateUser(String code) {
        User user = iUserRepo.findByActivationCode(code);

        if (user == null) {
            return false;
        }

        user.setActivationCode(null);

        iUserRepo.save(user);

        return false;
    }
}
