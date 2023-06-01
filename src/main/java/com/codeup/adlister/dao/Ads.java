package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    List<Ad> search(String inputvalue);

    void delete(Long id);
    Ad selectAdById(Long id);
    void update(Ad ad);
    List<Ad> selectAdByUserId(Long userId);
}



