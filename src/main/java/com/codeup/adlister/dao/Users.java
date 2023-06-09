package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    User findByEmail(String email);

    Long insert(User user);

    void update(User user);
    User findById(Long id);

    void deleteById(Long id);
}
