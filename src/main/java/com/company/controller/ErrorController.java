/*******************************************************************************
 * Created by Vladislav Brezovsky at 2020
 * Contacts: https://t.me/vb_contacts
 ******************************************************************************/

package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ErrorController {

    @GetMapping("/e{number:\\d+}")
    public String errorsController(
            @PathVariable("number") String errorCode,
            Model model
    ) {
        model.addAttribute("errorCode", errorCode);
        return "error/error";
    }
}
