package com.company.Repository;

import java.util.List;

import com.company.modal.Product;

public interface ProductRepository {
    boolean saveProduct(Product product);
    List<Product> getAllProducts();
    Product getSingleProduct(int id);
}
