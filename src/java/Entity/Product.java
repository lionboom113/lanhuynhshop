/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;

/**
 *
 * @author Spit
 */
public class Product implements Serializable{
  private String id;
  private String name;
  private double oldprice;
  private double price;
  private String description;
  private String image;
  private String[] category;

  public Product() {
  }

  public Product(String id, String name, double oldprice, double price, String description, String image) {
    this.id = id;
    this.name = name;
    this.oldprice = oldprice;
    this.price = price;
    this.description = description;
    this.image = image;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public double getOldprice() {
    return oldprice;
  }

  public void setOldprice(double oldprice) {
    this.oldprice = oldprice;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(double price) {
    this.price = price;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String[] getCategory() {
    return category;
  }

  public void setCategory(String[] category) {
    this.category = category;
  }

  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
  }
  

  @Override
  public boolean equals(Object obj) {
    Product temp = (Product)obj;
    return temp.getId().equals(this.id);
  }

  @Override
  public int hashCode() {
    return this.id.hashCode();
  }
  
  
}
