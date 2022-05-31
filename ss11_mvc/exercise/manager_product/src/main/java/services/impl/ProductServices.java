package services.impl;

import model.Product;
import repository.impl.ProductRepository;
import services.InterfaceServices;

import java.util.*;

public class ProductServices implements InterfaceServices {
    ProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll () {
        return productRepository.findAll();
    }

    @Override
    public Product findById (int id) {
        return productRepository.findById(id);
    }

    @Override
    public void save (Product product) {
        productRepository.save(product);
    }

    @Override
    public void delete (int id) {
        productRepository.delete(id);
    }
}
