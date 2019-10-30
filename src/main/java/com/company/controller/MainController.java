package com.company.controller;

import com.company.domain.Message;
import com.company.domain.User;
import com.company.repos.IMessageRepo;
import com.company.service.CommonService;
import com.company.service.MessageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

import javax.validation.Valid;

@Controller
public class MainController {

    @Autowired
    private IMessageRepo iMessageRepo;

    @Autowired
    private CommonService commonService;

    @Autowired
    private MessageService messageService;

    @GetMapping("/")
    public String greeting() {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(
            @RequestParam(required = false, defaultValue = "1") String page,
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model
    ) {
        return messageService.fillModel(page, filter, model);
    }

    @PostMapping("/main")
    public String add(
            @RequestParam(required = false, defaultValue = "1") String page,
            @RequestParam(required = false, defaultValue = "") String filter,
            @AuthenticationPrincipal User user,
            @Valid Message message,
            BindingResult bindingResult,
            @RequestParam("file") MultipartFile file,
            Model model
    ) throws IOException {
        message.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("message", message);
        } else {
            commonService.safeFile(message, file);

            model.addAttribute("message", null);

            iMessageRepo.save(message);
        }

        return messageService.fillModel(page, filter, model);
    }
}
