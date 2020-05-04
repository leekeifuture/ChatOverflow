/*******************************************************************************
 * Created by Vladislav Brezovsky at 2020
 * Contacts: https://t.me/vb_contacts
 ******************************************************************************/

package com.company.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;

@Component
public class CustomizationBean
        implements WebServerFactoryCustomizer<ConfigurableServletWebServerFactory> {

    @Override
    public void customize(ConfigurableServletWebServerFactory container) {
        container.addErrorPages(new ErrorPage(HttpStatus.FORBIDDEN, "/e403"));
        container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/e404"));
    }
}
