package services;

import model.User;

import java.util.List;

public interface IUserServices {
    void save(User user);

    User findById(int id);

    List<User> findAll();

    List<User> findByCountry(String countrySearch);

    List<User> sortByNameDesc();

    List<User> sortByNameAsc();

    boolean delete(int id);

    boolean update(User user);
}
