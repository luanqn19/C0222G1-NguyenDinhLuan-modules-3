package services;

import model.Product;

import java.util.List;

public interface InterfaceServices {
    List<Product> findAll();

    Product findById (int id);

    void save (Product product);

    void delete (int id);
}
