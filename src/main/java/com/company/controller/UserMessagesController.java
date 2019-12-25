package com.company.controller;

import com.company.domain.Message;
import com.company.domain.User;
import com.company.repo.IMessageRepo;
import com.company.service.FileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Set;

@Controller
public class UserMessagesController {

    @Autowired
    private IMessageRepo iMessageRepo;

    @Autowired
    private FileService fileService;

    @GetMapping("/user-messages/{user}")
    public String userMessages(
            @AuthenticationPrincipal User currentUser,
            @PathVariable User user,
            @RequestParam(required = false) Message message,
            Model model
    ) {
        Set<Message> messages = user.getMessages();

        model.addAttribute("userChannel", user);
        model.addAttribute("messages", messages);
        model.addAttribute("message", message);
        model.addAttribute("isCurrentUser", currentUser.equals(user));
        model.addAttribute("isSubscriber",
                user.getSubscribers().contains(currentUser));
        model.addAttribute("subscriptionsCount",
                user.getSubscriptions().size());
        model.addAttribute("subscribersCount",
                user.getSubscribers().size());

        return "userMessages";
    }

    @PostMapping("/user-messages/{user}")
    public String updateMessage(
            @AuthenticationPrincipal User currentUser,
            @PathVariable Long user,
            @RequestParam("id") Message message,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (message.getAuthor().equals(currentUser)) {
            if (!StringUtils.isEmpty(text))
                message.setText(text);

            if (!StringUtils.isEmpty(tag))
                message.setTag(tag);

            fileService.safeFile(message, file);

            iMessageRepo.save(message);
        }

        return "redirect:/user-messages/" + user;
    }
}
