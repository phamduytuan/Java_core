/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitaplon;

import java.util.ArrayList;
import java.util.Iterator;

/**
 *
 * @author DELL
 */
public class MenuQuanLyDanhMuc extends Categories {

    public void menuDanhSachDanhMuc(ArrayList arr) {
        int menu;
        Categories cg = new Categories();
        do {
            System.out.println("*****************DANH SACH DANH MUC*************");
            System.out.println("\t1.Danh sach cay danh muc");
            System.out.println("\t2.Thong tin chi tiet danh muc");
            System.out.println("\t3.Quay lai");
            System.out.print("Su lua chon cua ban: ");
            menu = input.nextInt();
            switch (menu) {
                case 1:
                    danhSachCayDanhMuc(arr);
                    break;
                case 2:
                    thongTinChiTietDanhMuc(arr);
                    break;
                case 3:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-3. Moi chon lai!");
                    break;
            }

        } while (menu != 3);
    }

    public void danhSachCayDanhMuc(ArrayList arr) {
        Categories cg = new Categories();
    }

    public void thongTinChiTietDanhMuc(ArrayList arr) {
        String nameSearch;
        Categories cg = new Categories();
        System.out.print("Nhap vao ten danh muc can xem thong tin: ");
        nameSearch = input.nextLine();

    }

    public void themDanhMuc(ArrayList arr) {
        System.out.println("Nhap danh muc moi:");
        Categories cg = new Categories();
        cg.inputData();
        arr.add(cg);
    }

    public void xoaDanhMucTheoMa(ArrayList arr) {
        Categories cg = new Categories();
        int maXoa;
        System.out.print("Nhap vao ma danh muc can xoa:");
        maXoa = input.nextInt();
        Iterator it = arr.iterator();
        while (it.hasNext()) {
            if (maXoa == cg.getCatalogId()) {
                arr.remove(cg);
            }
        }
    }

    public void timKiemDanhMucTheoTen(ArrayList arr) {
        String nameSearch;
        Categories cg = new Categories();
        System.out.print("Nhap vao ten danh muc can xem thong tin: ");
        nameSearch = input.nextLine();
        Iterator it = arr.iterator();
        while (it.hasNext()) {
            if (nameSearch.equals(cg.getCatalogName())) {
                cg.displayData();
            }
        }
    }
}
