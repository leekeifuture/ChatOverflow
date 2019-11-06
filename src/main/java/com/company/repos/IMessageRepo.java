package com.company.repos;

import com.company.domain.Message;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

public interface IMessageRepo extends CrudRepository<Message, Long> {

    Page<Message> findAll(Pageable pageable);

    Page<Message> findByTag(String tag, Pageable pageable);
}
