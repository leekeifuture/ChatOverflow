package com.company.util;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RedirectInterceptor extends HandlerInterceptorAdapter {

    @Override
    public void postHandle(
            HttpServletRequest request,
            HttpServletResponse response,
            Object handler,
            ModelAndView modelAndView
    ) {
        if (modelAndView != null) {
            String args = request.getQueryString() != null ?
                    request.getQueryString() : "";

            String divider = "?";
            if (args.equals("")) {
                divider = "";
            }
            String url = request.getRequestURI() + divider + args;
            response.setHeader("Turbolinks-Location", url);
        }
    }
}
