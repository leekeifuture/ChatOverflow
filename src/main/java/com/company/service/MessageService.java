package com.company.service;

import com.company.domain.User;
import com.company.domain.dto.MessageDto;
import com.company.repo.IMessageRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class MessageService {

    @Autowired
    private IMessageRepo iMessageRepo;

    public Page<MessageDto> getMessageList(Pageable pageable,
                                           String filter,
                                           User user) {
        if (filter != null && !filter.isEmpty()) {
            return iMessageRepo.findByTag(filter, pageable, user);
        }
        return iMessageRepo.findAll(pageable, user);
    }

    public Page<MessageDto> getMessageListForUser(Pageable pageable,
                                                  User currentUser,
                                                  User author) {
        return iMessageRepo.findByUser(pageable, author, currentUser);
    }
}
