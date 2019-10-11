package com.company.controller;

import com.company.domain.Message;
import com.company.domain.User;
import com.company.repos.IMessageRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {

    @Autowired
    private IMessageRepo iMessageRepo;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model
    ) {
        Iterable<Message> messages = iMessageRepo.findAll();

        if (filter != null && !filter.isEmpty())
            messages = iMessageRepo.findByTag(filter);
        else
            messages = iMessageRepo.findAll();

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping("/main")
    public String add(
            @AuthenticationPrincipal User user,
            @RequestParam String text, String tag, Map<String, Object> model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        Message message = new Message(text, tag, user);

        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String uudiFile = UUID.randomUUID().toString();
            String resultFilename = uudiFile + "." + file.getOriginalFilename();

            file.transferTo(
                    new File(uploadPath + "/" + resultFilename));

            message.setFilename(resultFilename);
        }

        iMessageRepo.save(message);

        Iterable<Message> messages = iMessageRepo.findAll();

        model.put("messages", messages);
        model.put("filter", "");
        return "main";
    }
}
