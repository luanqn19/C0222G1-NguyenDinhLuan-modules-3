package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class UserImplRepository implements IUserRepository {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "SELECT id,name,email,country from users WHERE id =?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id = ?;";
    private static final String UPDATE_USERS_SQL = "UPDATE users SET name = ?,email= ?, country =? WHERE id = ?;";
    private static final String SELECT_BY_COUNTRY = "SELECT id,name,email,country FROM users WHERE country =?";
    private static final String SORT_BY_NAME_DESC = "SELECT * FROM users ORDER BY name DESC";
    private static final String SORT_BY_NAME_ASC = "SELECT * FROM users ORDER BY name ASC";

    @Override
    public void save (User user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_USERS_SQL);
            ps.setString(1 , user.getName());
            ps.setString(2 , user.getEmail());
            ps.setString(3 , user.getCountry());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User findById (int id) {
        User user = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_USER_BY_ID);
            ps.setInt(1 , id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id , name , email , country);
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> findByCountry (String countrySearch) {
        List<User> list = new ArrayList<>();
        User user;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_BY_COUNTRY);
            ps.setString(1 , countrySearch);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id , name , email , country);
                list.add(user);
            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> findAll () {
        List<User> users = new ArrayList<>();
        Connection connection;
        PreparedStatement preparedStatement;
        try {
            connection = BaseRepository.getConnectDB();
            preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id , name , email , country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public List<User> sortByNameDesc () {
        List<User> users = new ArrayList<>();
        Connection connection;
        PreparedStatement preparedStatement;
        try {
            connection = BaseRepository.getConnectDB();
            preparedStatement = connection.prepareStatement(SORT_BY_NAME_DESC);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id , name , email , country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public List<User> sortByNameAsc () {
        List<User> users = new ArrayList<>();
        Connection connection;
        PreparedStatement preparedStatement;
        try {
            connection = BaseRepository.getConnectDB();
            preparedStatement = connection.prepareStatement(SORT_BY_NAME_ASC);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id , name , email , country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public boolean delete (int id) {
        boolean rowDeleted = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_USERS_SQL);
            ps.setInt(1 , id);
            rowDeleted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    @Override
    public boolean update (User user) {
        boolean rowUpdated = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_USERS_SQL);
            ps.setString(1 , user.getName());
            ps.setString(2 , user.getEmail());
            ps.setString(3 , user.getCountry());
            ps.setInt(4 , user.getId());

            rowUpdated = ps.executeUpdate() > 0; // Kiem tra so dong thay doi
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowUpdated;
    }
}
