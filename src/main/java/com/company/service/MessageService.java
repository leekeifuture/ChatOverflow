package com.company.service;

import com.company.domain.Message;
import com.company.repos.IMessageRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Service
public class MessageService {

    @Autowired
    private IMessageRepo iMessageRepo;

    /**
     * Add currentPage, messages and filter to model.
     *
     * @param pageParam
     * @param filter
     * @param model
     * @return main currentPage
     */
    public String fillModel(String pageParam,
                            String filter,
                            Model model
    ) {
        Iterable<Message> messages;

        if (filter != null && !filter.isEmpty())
            messages = iMessageRepo.findByTag(filter);
        else {
            messages = iMessageRepo.findAll();

            List<Message> messagesArrayList = new ArrayList<>();
            messages.forEach(messagesArrayList::add);

            messages = messagesArrayList;
        }

        int currentPage;

        try {
            currentPage = Integer.parseInt(pageParam);
        } catch (NumberFormatException e) {
            currentPage = 1;
        }

        List messagesList = ((List<Message>) messages);

        final int MAX_IN_PAGE = 5;
        final int lastMessagesPage = messagesList.size() / MAX_IN_PAGE + 1;

        if (currentPage > lastMessagesPage)
            currentPage = lastMessagesPage;
        else if (currentPage <= 0)
            currentPage = 1;

        int lastMessageIndex = currentPage * MAX_IN_PAGE;
        int firstMessageIndex = currentPage * MAX_IN_PAGE - MAX_IN_PAGE;

        if (lastMessageIndex > messagesList.size())
            lastMessageIndex = messagesList.size();

        if (firstMessageIndex == lastMessageIndex) {
            firstMessageIndex -= MAX_IN_PAGE;
            currentPage--;
        }

        List<Integer> pages = IntStream.rangeClosed(1, lastMessagesPage)
                .boxed().collect(Collectors.toList());

        model.addAttribute("messages",
                ((List<Message>) messages).subList(firstMessageIndex,
                        lastMessageIndex));
        model.addAttribute("pages", pages);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("filter", filter);

        return "main";
    }
}
