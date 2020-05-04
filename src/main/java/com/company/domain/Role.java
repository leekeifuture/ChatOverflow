/*******************************************************************************
 * Created by Vladislav Brezovsky at 2020
 * Contacts: https://t.me/vb_contacts
 ******************************************************************************/

package com.company.domain;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER, ADMIN;

    @Override
    public String getAuthority() {
        return name();
    }
}
