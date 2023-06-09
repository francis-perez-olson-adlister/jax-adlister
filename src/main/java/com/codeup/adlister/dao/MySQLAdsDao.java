package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    public List<Ad> search(String inputvalue) {
        try {
            String searchQuery = "SELECT * FROM ads WHERE title like ?";
            PreparedStatement stmt = connection.prepareStatement(searchQuery);
            stmt.setString(1, "%" + inputvalue + "%");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error searching for an ad.", e);
        }
    }

        public void delete (Long id){
            try {
                String deleteQuery = "DELETE FROM ads WHERE id = ?";
                PreparedStatement stmt = connection.prepareStatement(deleteQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.setLong(1, id);
                stmt.execute();
            } catch (SQLException e) {
                throw new RuntimeException("Error deleting ad.");
            }
        }

        public Ad selectAdById (Long id){
            try {
                String selectQuery = "SELECT * FROM ads WHERE id = ?";
                PreparedStatement stmt = connection.prepareStatement(selectQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.setLong(1, id);
                ResultSet rs = stmt.executeQuery();
                rs.next();
                return extractAd(rs);
            } catch (SQLException e) {
                throw new RuntimeException("Error selecting ad by id", e);
            }
        }

        public List<Ad> selectAdByUserId (Long userId){
            try {
                String selectQuery = "Select * FROM ads WHERE user_id = ?";
                PreparedStatement stmt = connection.prepareStatement(selectQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.setLong(1, userId);
                ResultSet rs = stmt.executeQuery();
                return createAdsFromResults(rs);
            } catch (SQLException e) {
                throw new RuntimeException("error selecting ad by user_id");
            }
        }

        @Override
        public void update (Ad ad){
            try {
                String updateQuery = "UPDATE ads set title = ?, description = ? WHERE id = ?";
                PreparedStatement stmt = connection.prepareStatement(updateQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.setString(1, ad.getTitle());
                stmt.setString(2, ad.getDescription());
                stmt.setLong(3, ad.getId());
                stmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException("Error updating ad", e);
            }
        }

        private Ad extractAd (ResultSet rs) throws SQLException {
            return new Ad(
                    rs.getLong("id"),
                    rs.getLong("user_id"),
                    rs.getString("title"),
                    rs.getString("description")
            );
        }

        private List<Ad> createAdsFromResults (ResultSet rs) throws SQLException {
            List<Ad> ads = new ArrayList<>();
            while (rs.next()) {
                ads.add(extractAd(rs));
            }
            return ads;
        }

    }

