/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitaplon;

import java.io.Serializable;
import java.util.Scanner;

/**
 *
 * @author DELL
 */
public class Product implements IProduct, Serializable {

    String productId;
    String productName;
    String title;
    float importPrice;
    float exportPrice;
    float profit;
    String descriptions;
    boolean productStatus;
    Categories catalog;

    Scanner input = new Scanner(System.in);

    public Product() {

    }

    public Product(String productId, String productName, String title, float importPrice, float exportPrice, float profit, String descriptions, boolean productStatus, Categories catalog) {
        this.productId = productId;
        this.productName = productName;
        this.title = title;
        this.importPrice = importPrice;
        this.exportPrice = exportPrice;
        this.profit = profit;
        this.descriptions = descriptions;
        this.productStatus = productStatus;
        this.catalog = catalog;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public float getImportPrice() {
        return importPrice;
    }

    public void setImportPrice(float importPrice) {
        this.importPrice = importPrice;
    }

    public float getExportPrice() {
        return exportPrice;
    }

    public void setExportPrice(float exportPrice) {
        this.exportPrice = exportPrice;
    }

    public float getProfit() {
        return profit;
    }

    public void setProfit(float profit) {
        this.profit = profit;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public boolean isProductStatus() {
        return productStatus;
    }

    public void setProductStatus(boolean productStatus) {
        this.productStatus = productStatus;
    }

    public Categories getCatalog() {
        return catalog;
    }

    public void setCatalog(Categories catalog) {
        this.catalog = catalog;
    }

    @Override
    public void inputData() {
        do {
            System.out.println("Ma san pham gom 4 ky tu va bat dau bang ky tu C.");
            System.out.print("\tNhap ma san pham: ");
            productId = input.nextLine();
        } while (productId.charAt(0) != 'C' || productId.length() != 4);
        do {
            System.out.println("Ten san pham gom 6 den 50 ky tu.");
            System.out.print("\tNhap ten san pham: ");
            productName = input.nextLine();
        } while (productName.length() < 6 || productName.length() > 50);
        do {
            System.out.println("Tieu de san pham 6 den 30 ky tu.");
            System.out.print("\tNhap tieu de san pham: ");
            title = input.nextLine();
        } while (title.length() < 6 || title.length() > 30);
        do {
            try {
                System.out.println("Gia nhap la so thuc lon hon 0");
                System.out.print("\tNhap gia nhap san pham: ");
                importPrice = input.nextFloat();
            } catch (Exception e) {
                System.out.println("Kiem tra lai gia vua nhap.");
            }
        } while (importPrice <= 0);
        do {
            try {
                System.out.println("Gia ban la so thuc lon hon gia ban MIN_INTEREST_RATE lan.");
                System.out.print("\tNhap gia ban san pham: ");
                exportPrice = input.nextFloat();
            } catch (Exception e) {
                System.out.println("Kiem tra lai gia vua nhap.");
            }
        } while (exportPrice <= (importPrice * MIN_INTEREST_RATE));
        input.nextLine();
        do {
            System.out.println("Mo ta danh muc khong duoc de trong khi nhap.");
            System.out.print("\tNhap mo ta san pham: ");
            descriptions = input.nextLine();
        } while (descriptions.length() == 0);
        //cho 1 list roi chon
        System.out.println("\tChon trang thai san pham: ");
        int chon;
        do {
            System.out.println("\t1.Hoat dong");
            System.out.println("\t2.Khong hoat dong");
            System.out.print("Ban chon: ");
            chon = input.nextInt();
            switch (chon) {
                case 1:
                    productStatus = true;
                    break;
                case 2:
                    productStatus = false;
                    break;
                default:
                    System.out.println("Chi duoc chon 1-2, moi chon lai!");
                    break;
            }
        } while (chon != 1 && chon != 2);
        //System.out.print("\tNhap danh muc san pham cua san pham: ");
        //???????
    }

    @Override
    public void displayData() {
        System.out.println("\tMa san pham: " + productId);
        System.out.println("\tTen san pham: " + productName);
        System.out.println("\tTieu de san pham: " + title);
        System.out.println("\tGia nhap san pham: " + importPrice);
        System.out.println("\tGia ban san pham: " + exportPrice);
        System.out.println("\tLoi nhuan san pham: " + profit);
        System.out.println("\tMo ta san pham: " + productStatus);
        System.out.println("\tTrang thai san pham: " + (productStatus ? "Hoat dong" : "Khong hoat dong"));
        //System.out.println("\tDanh muc san pham cua san pham: " + catalog);
    }

    @Override
    public void calProfit() {
        this.profit = this.exportPrice - this.importPrice;
    }

}
