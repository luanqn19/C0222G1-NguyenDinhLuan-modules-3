package repository;

import model.Product;

import java.util.List;

public interface InterfaceProductRepository {
    List<Product> findAll();

    Product findById(int id);

    void save(Product product);

    void delete(int id);

}
