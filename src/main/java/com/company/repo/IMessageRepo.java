package com.company.repo;

import com.company.domain.Message;
import com.company.domain.User;
import com.company.domain.dto.MessageDto;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface IMessageRepo extends CrudRepository<Message, Long> {

    @Query("SELECT NEW com.company.domain.dto.MessageDto(" +
            "m, " +
            "COUNT(ml), " +
            "SUM(CASE WHEN ml = :user THEN 1 ELSE 0 END) > 0" +
            ") " +
            "FROM Message AS m LEFT JOIN m.likes ml " +
            "GROUP BY m")
    Page<MessageDto> findAll(Pageable pageable, @Param("user") User user);

    @Query("SELECT NEW com.company.domain.dto.MessageDto(" +
            "m, " +
            "COUNT(ml), " +
            "SUM(CASE WHEN ml = :user THEN 1 ELSE 0 END) > 0" +
            ") " +
            "FROM Message AS m LEFT JOIN m.likes ml " +
            "WHERE m.tag = :tag " +
            "GROUP BY m")
    Page<MessageDto> findByTag(@Param("tag") String tag, Pageable pageable, @Param("user") User user);

    @Query("SELECT NEW com.company.domain.dto.MessageDto(" +
            "m, " +
            "COUNT(ml), " +
            "SUM(CASE WHEN ml = :user THEN 1 ELSE 0 END) > 0" +
            ") " +
            "FROM Message AS m LEFT JOIN m.likes ml " +
            "WHERE m.author = :author " +
            "GROUP BY m")
    Page<MessageDto> findByUser(Pageable pageable, @Param("author") User author,
                                @Param("user") User user);
}
