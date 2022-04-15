/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitaplon;

import java.util.Scanner;

/**
 *
 * @author DELL
 */
public class Categories implements ICategories {

    private int catalogId;
    private String catalogName;
    private String descriptions;
    private boolean catalogStatus;
    private int parentId;

    Scanner input = new Scanner(System.in);

    public Categories() {
    }

    public Categories(int catalogId, String catalogName, String descriptions, Boolean catalogStatus, int parentId) {
        this.catalogId = catalogId;
        this.catalogName = catalogName;
        this.descriptions = descriptions;
        this.catalogStatus = catalogStatus;
        this.parentId = parentId;
    }

    public int getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(int catalogId) {
        this.catalogId = catalogId;
    }

    public String getCatalogName() {
        return catalogName;
    }

    public void setCatalogName(String catalogName) {
        this.catalogName = catalogName;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public Boolean getCatalogStatus() {
        return catalogStatus;
    }

    public void setCatalogStatus(Boolean catalogStatus) {
        this.catalogStatus = catalogStatus;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    @Override
    public void inputData() {
        System.out.print("\tNhap ma danh muc: ");
        catalogId = input.nextInt();
        input.nextLine();
        System.out.print("\tNhap ten danh muc: ");
        catalogName = input.nextLine();
        System.out.print("\tNhap vao mo ta danh muc: ");
        descriptions = input.nextLine();
        System.out.print("\tNhap vao trang thai danh muc: ");
        catalogStatus = Boolean.parseBoolean(input.nextLine());
        System.out.print("\tNhap vao mã danh muc cha: ");
        parentId = input.nextInt();
    }

    @Override
    public void displayData() {
        System.out.println("Ma danh muc: " + catalogId);
        System.out.println("Ten danh muc: " + catalogName);
        System.out.println("Mo ta danh muc: " + descriptions);
        System.out.println("Trang thai danh muc: " + (catalogStatus ? "Active" : "NoneActive"));
        System.out.println("Ma danh muc cha: " + parentId);
    }

}
