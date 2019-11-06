package com.company.controller;

import com.company.domain.Message;
import com.company.domain.User;
import com.company.repos.IMessageRepo;
import com.company.service.CommonService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
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

    @GetMapping("/")
    public String greeting() {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(
            @RequestParam(required = false, defaultValue = "") String filter,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC)
                    Pageable pageable,
            Model model
    ) {
        Page<Message> page;

        if (filter != null && !filter.isEmpty())
            page = iMessageRepo.findByTag(filter, pageable);
        else
            page = iMessageRepo.findAll(pageable);

        model.addAttribute("page", page);
        model.addAttribute("url", "/main");
        model.addAttribute("filter", filter);

        return "main";
    }

    @PostMapping("/main")
    public String add(
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

        Iterable<Message> messages = iMessageRepo.findAll();

        model.addAttribute("messages", messages);

        return "main";
    }
}
