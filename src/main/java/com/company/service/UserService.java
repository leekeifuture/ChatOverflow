package com.company.service;

import com.company.domain.Role;
import com.company.domain.User;
import com.company.repo.IUserRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private IUserRepo iUserRepo;

    @Autowired
    private MailSender mailSender;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Value("${hostname}")
    private String hostname;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        User user = iUserRepo.findByUsername(username);

        if (user == null)
            throw new UsernameNotFoundException("User not found");

        return user;
    }

    public boolean addUser(User user) {
        User userFromDb = iUserRepo.findByUsername(user.getUsername());

        final boolean addUserResult;

        if (userFromDb != null)
            addUserResult = false;
        else {
            user.setActive(true);
            user.setRoles(Collections.singleton(Role.USER));
            user.setActivationCode(UUID.randomUUID().toString());
            user.setPassword(passwordEncoder.encode(user.getPassword()));

            iUserRepo.save(user);

            sendMessage(user);

            addUserResult = true;
        }

        return addUserResult;
    }

    private void sendMessage(User user) {
        if (!StringUtils.isEmpty(user.getEmail())) {
            String message = String.format("Hello, %s!\n" +
                            "Welcome to ChatOverflow. " +
                            "Please, visit next link for activate account:\n" +
                            "http://%s/activate/%s",
                    user.getUsername(), hostname, user.getActivationCode());

            mailSender.send(user.getEmail(), "Activation code", message);
        }
    }

    public boolean activateUser(String code) {
        User user = iUserRepo.findByActivationCode(code);

        final boolean activateUserResult;

        if (user == null)
            activateUserResult = false;
        else {
            user.setActivationCode(null);

            iUserRepo.save(user);

            activateUserResult = true;
        }

        return activateUserResult;
    }

    public List<User> findAll() {
        return iUserRepo.findAll();
    }

    public void saveUser(User user, String username, Map<String, String> form) {
        user.setUsername(username);

        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();

        for (String key : form.keySet()) {
            if (roles.contains(key))
                user.getRoles().add(Role.valueOf(key));
        }

        iUserRepo.save(user);
    }

    public void updateProfile(User user, String email, String password) {
        String userEmail = user.getEmail();

        boolean isEmailChanged = (email != null && !email.equals(userEmail)) ||
                (userEmail != null && !userEmail.equals(email));

        if (isEmailChanged) {
            user.setEmail(email);

            if (!StringUtils.isEmpty(email))
                user.setActivationCode(UUID.randomUUID().toString());
        }

        if (!StringUtils.isEmpty(password))
            user.setPassword(password);

        iUserRepo.save(user);

        if (isEmailChanged)
            sendMessage(user);
    }

    public void subscribe(User currentUser, User user) {
        user.getSubscribers().add(currentUser);

        iUserRepo.save(user);
    }

    public void unsubscribe(User currentUser, User user) {
        user.getSubscribers().remove(currentUser);

        iUserRepo.save(user);
    }
}
