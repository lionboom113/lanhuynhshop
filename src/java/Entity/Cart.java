/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.HashMap;

/**
 *
 * @author Spit
 */
public class Cart {
  HashMap<Product,Integer> hashmap;
  int counter;
  double sum;

  public Cart() {
    hashmap = new HashMap<Product, Integer>();
    counter = 0;
    sum = 0;
  }
  public void add(Product product,int qty){
    if (hashmap.containsKey(product)) {
      hashmap.put(product, hashmap.get(product)+qty);
    } else {
      hashmap.put(product, qty);
    }
    counter+=qty;
    sum+=product.getPrice()*qty;
  }
  public void remove(Product product){
    int qty = 0;
    double price = 0;
    if (hashmap.containsKey(product)) {
      qty = hashmap.get(product);
      price = product.getPrice();
      hashmap.remove(product);
    }
    counter-=qty;
    sum-=price*qty;
  }
  public void changeQty(Product product,int qty){
    int oldQty = 0;
    if (hashmap.containsKey(product)) {
      oldQty = hashmap.get(product);
    } 
      hashmap.put(product, qty);
      counter = counter - oldQty + qty;
      sum = sum + product.getPrice()*qty - product.getPrice()*oldQty;
  }

  public int getCounter() {
    return counter;
  }

  public double getSum() {
    return sum;
  }

  public HashMap<Product, Integer> getHashmap() {
    return hashmap;
  }
  
  
  
  
  
}
