package services.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserImplRepository;
import services.IUserServices;

import java.util.ArrayList;
import java.util.List;

public class IUserImpl implements IUserServices {
    UserImplRepository userImplRepository = new UserImplRepository();

    @Override
    public void save (User user) {
        userImplRepository.save(user);
    }

    @Override
    public User findById (int id) {
        return userImplRepository.findById(id);
    }

    @Override
    public List<User> findAll () {
        return userImplRepository.findAll();
    }

    @Override
    public List<User> findByCountry (String countrySearch) {
        return userImplRepository.findByCountry(countrySearch);
    }

    @Override
    public List<User> sortByNameDesc () {
        return userImplRepository.sortByNameDesc();
    }

    @Override
    public List<User> sortByNameAsc () {
        return userImplRepository.sortByNameAsc();
    }

    @Override
    public boolean delete (int id) {
        return userImplRepository.delete(id);
    }

    @Override
    public boolean update (User user) {
        return userImplRepository.update(user);
    }
}
