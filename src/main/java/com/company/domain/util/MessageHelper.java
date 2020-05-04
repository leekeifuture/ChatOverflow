/*******************************************************************************
 * Created by Vladislav Brezovsky at 2020
 * Contacts: https://t.me/vb_contacts
 ******************************************************************************/

package com.company.domain.util;

import com.company.domain.User;

public abstract class MessageHelper {

    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "<none>";
    }
}
