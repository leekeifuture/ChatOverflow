DELETE FROM user_role;
DELETE FROM usr;

INSERT INTO usr(id, username, password, active) VALUES
    (1, 'asf', '$2a$08$5Y4AxhyOJZ/9HhNNTrbzTO3HLyG9zkUZVbJ9rlLiJH8w7aBQin2PG', true),
    (2, 'vlad', '$2a$08$5Y4AxhyOJZ/9HhNNTrbzTO3HLyG9zkUZVbJ9rlLiJH8w7aBQin2PG', true);

INSERT INTO user_role(user_id, roles) VALUES
    (1, 'ADMIN'), (1, 'USER'),
    (2, 'USER');
