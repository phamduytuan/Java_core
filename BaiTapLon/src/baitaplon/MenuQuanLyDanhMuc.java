/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitaplon;

import java.util.ArrayList;
import java.util.InputMismatchException;

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
        //ShopManagement.writeCategories(listCategories);
    }

    public void danhSachCayDanhMuc(ArrayList<Categories> listCategories) {

    }

    public void thongTinChiTietDanhMuc(ArrayList<Categories> listCategories) {
        input.nextLine();
        String nameSearch;
        do {
            System.out.println("Ten danh muc gom tu 6 den 30 ky tu.");
            System.out.print("\tNhap ten danh muc can kien tra thong tin: ");
            nameSearch = input.nextLine();
        } while (nameSearch.length() < 6 || nameSearch.length() > 30);
        for (int i = 0; i < listCategories.size(); i++) {
            Categories cg = (Categories) listCategories.get(i);
            if (nameSearch.equals(listCategories.get(i).catalogName)) {
                cg.displayData();
            }
        }
    }

    public void xoaDanhMucTheoMa(ArrayList<Categories> listCategories) {
        int maXoa = -1;
        do {
            try {
                System.out.println("Ma danh muc la so nguyen lon hon 0.");
                System.out.print("\tNhap ma danh muc can xoa: ");
                maXoa = input.nextInt();
            } catch (InputMismatchException e) {
                System.out.println("Kiem tra lai so vua nhap!");
            } catch (Exception e) {
                System.out.println("Da co loi xay ra!");
            }
        } while (maXoa <= 0);
        // kiem tra neu ko co ma vua nhap thi bat nhap lai 
        for (int i = 0; i < listCategories.size(); i++) {
            Categories cg = (Categories) listCategories.get(i);
            if (maXoa == listCategories.get(i).catalogId) {
                listCategories.remove(cg);
            }
        }
    }

    public void timKiemDanhMucTheoTen(ArrayList<Categories> listCategories) {
        input.nextLine();
        String nameSearch;
        do {
            System.out.println("Ten danh muc gom tu 6 den 30 ky tu.");
            System.out.print("\tNhap ten danh muc can tim kiem thong tin: ");
            nameSearch = input.nextLine();
        } while (nameSearch.length() < 6 || nameSearch.length() > 30);
        // kiem tra neu ko co ma vua nhap thi bat nhap lai 
        for (int i = 0; i < listCategories.size(); i++) {
            Categories cg = (Categories) listCategories.get(i);
            if (nameSearch.equals(listCategories.get(i).catalogName)) {
                cg.displayData();
            }
        }
    }
}
