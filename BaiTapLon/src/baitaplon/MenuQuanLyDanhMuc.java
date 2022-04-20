/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitaplon;

import java.util.ArrayList;
/**
 *
 * @author DELL
 */
public class MenuQuanLyDanhMuc extends Categories {

    public void menuDanhSachDanhMuc(ArrayList<Categories> listCategories) {
        int menu;
        do {
            System.out.println("*****************DANH SACH DANH MUC*************");
            System.out.println("\t1.Danh sach cay danh muc");
            System.out.println("\t2.Thong tin chi tiet danh muc");
            System.out.println("\t3.Quay lai");
            System.out.print("Su lua chon cua ban: ");
            menu = input.nextInt();
            switch (menu) {
                case 1:
                    danhSachCayDanhMuc(listCategories);
                    break;
                case 2:
                    thongTinChiTietDanhMuc(listCategories);
                    break;
                case 3:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-3. Moi chon lai!");
                    break;
            }

        } while (menu != 3);
    }
    
    public void themDanhMuc(ArrayList<Categories> listCategories) {
        System.out.println("Nhap danh muc moi:");
        Categories cg = new Categories();
        cg.inputData();
        listCategories.add(cg);
    }

    public void danhSachCayDanhMuc(ArrayList<Categories> listCategories) {
        
    }

    public void thongTinChiTietDanhMuc(ArrayList<Categories> listCategories) {
        String nameSearch;
        System.out.print("Nhap vao ten danh muc can xem thong tin: ");
        nameSearch = input.nextLine();

    }

    public void xoaDanhMucTheoMa(ArrayList<Categories> listCategories) {
        int maXoa;
        System.out.print("Nhap vao ma danh muc can xoa:");
        maXoa = input.nextInt();
       // kiem tra neu ko co ma vua nhap thi bat nhap lai 
        for (int i = 0; i < listCategories.size(); i++) {
            Categories cg = (Categories)listCategories.get(i);
            if (maXoa == cg.getCatalogId()) {
                listCategories.remove(cg);
            }
        }
    }

    public void timKiemDanhMucTheoTen(ArrayList<Categories> listCategories) {
        String nameSearch;
        System.out.print("Nhap vao ten danh muc can xem thong tin: ");
        nameSearch = input.nextLine();
        // kiem tra neu ko co ma vua nhap thi bat nhap lai 
        for (int i = 0; i < listCategories.size(); i++) {
            Categories cg = (Categories)listCategories.get(i);
            if (nameSearch.equals(cg.getCatalogName())) {
                cg.displayData();
            }
        }
    }
}
