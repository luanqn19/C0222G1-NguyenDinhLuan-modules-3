package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    void save(User user);

    User findById(int id);

    List<User> findByCountry(String countrySearch);

    List<User> findAll();

    List<User> sortByNameDesc();

    List<User> sortByNameAsc();

    boolean delete(int id);

    boolean update(User user);
}
