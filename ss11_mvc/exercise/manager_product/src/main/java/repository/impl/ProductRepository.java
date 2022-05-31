package repository.impl;

import model.Product;
import repository.InterfaceProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements InterfaceProductRepository {
    public static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1 , "SP0001" , "Iphone X" , "2022-5-29" ,
                "Iphone X" , "Apple" , 10 , 7000000));
        productList.add(new Product(2 , "SP0002" , "Iphone XS" , "2022-5-29" ,
                "Iphone XS" , "Apple" , 10 , 9000000));
        productList.add(new Product(3 , "SP0003" , "Iphone XS Max" , "2022-5-29" ,
                "Iphone XS Max" , "Apple" , 10 , 11000000));
        productList.add(new Product(4 , "SP0004" , "Iphone 11" , "2022-5-29" ,
                "Iphone 11" , "Apple" , 10 , 13000000));
        productList.add(new Product(5 , "SP0005" , "Iphone 11 Pro" , "2022-5-29" ,
                "Iphone 11 Pro" , "Apple" , 10 , 15000000));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public Product findById(int id) {
        for (Product item : productList) {
            if (item.getIdProduct() == id)
                return item;
        }
        return null;
    }

    @Override
    public void save(Product product) {
        productList.add(product);
    }

    @Override
    public void delete(int id) {
        productList.removeIf(item -> item.getIdProduct() == id);
    }
}
