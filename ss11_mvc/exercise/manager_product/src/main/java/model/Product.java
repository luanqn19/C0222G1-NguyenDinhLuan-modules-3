package model;

import java.util.Objects;

public class Product {
    private String codeProduct, nameProduct, dateImport, descriptionProduct, productionName;
    private int idProduct, amount;
    private double price;

    public Product (int idProduct , String codeProduct , String nameProduct , String dateImport ,
                    String descriptionProduct , String productionName , int amount , double price) {
        this.codeProduct = codeProduct;
        this.nameProduct = nameProduct;
        this.dateImport = dateImport;
        this.descriptionProduct = descriptionProduct;
        this.productionName = productionName;
        this.idProduct = idProduct;
        this.amount = amount;
        this.price = price;
    }

    public String getCodeProduct () {
        return codeProduct;
    }

    public void setCodeProduct (String codeProduct) {
        this.codeProduct = codeProduct;
    }

    public String getNameProduct () {
        return nameProduct;
    }

    public void setNameProduct (String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getDateImport () {
        return dateImport;
    }

    public void setDateImport (String dateImport) {
        this.dateImport = dateImport;
    }

    public String getDescriptionProduct () {
        return descriptionProduct;
    }

    public void setDescriptionProduct (String descriptionProduct) {
        this.descriptionProduct = descriptionProduct;
    }

    public String getProductionName () {
        return productionName;
    }

    public void setProductionName (String productionName) {
        this.productionName = productionName;
    }

    public int getIdProduct () {
        return idProduct;
    }

    public void setIdProduct (int idProduct) {
        this.idProduct = idProduct;
    }

    public int getAmount () {
        return amount;
    }

    public void setAmount (int amount) {
        this.amount = amount;
    }

    public double getPrice () {
        return price;
    }

    public void setPrice (double price) {
        this.price = price;
    }

    @Override
    public boolean equals (Object o) {
        if (this == o) return true;
        if (! (o instanceof Product)) return false;
        Product product = (Product) o;
        return Objects.equals(getCodeProduct() , product.getCodeProduct());
    }

    @Override
    public int hashCode () {
        return Objects.hash(getCodeProduct());
    }
}
