/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitaplon;

import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author DELL
 */
public class MainTest {
    
    static void hienMenuMain() {
        int menu;
        Scanner input = new Scanner(System.in);
        do {
            System.out.println("*****************MENU*************");
            System.out.println("\t1.Quan ly danh muc");
            System.out.println("\t2.Quan ly san pham");
            System.out.println("\t3.Thoat");
            System.out.print("Su lua chon cua ban: ");
            menu = input.nextInt();
            switch (menu) {
                case 1:
                    hienMenuQuanLyDanhMuc();
                    break;
                case 2:
                    hienMenuQuanLySanPham();
                    break;
                case 3:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-3. Moi chon lai!");
                    break;
            }
            
        } while (menu != 3);
        
    }
    
    static void hienMenuQuanLyDanhMuc() {
        int menu;
        Scanner input = new Scanner(System.in);
        ArrayList arr = new ArrayList();
        MenuQuanLyDanhMuc dm = new MenuQuanLyDanhMuc();
        do {
            System.out.println("*****************QUAN LY DANH MUC*************");
            System.out.println("\t1.Danh sach danh muc");
            System.out.println("\t2.Them danh muc");
            System.out.println("\t3.Xoa danh muc");
            System.out.println("\t4.Tim kiem danh muc");
            System.out.println("\t5.Quay lai");
            System.out.print("Su lua chon cua ban: ");
            menu = input.nextInt();
            switch (menu) {
                case 1:
                    dm.danhSachCayDanhMuc(arr);
                    break;
                case 2:
                    dm.themDanhMuc(arr);
                    break;
                case 3:
                    dm.xoaDanhMucTheoMa(arr);
                    break;
                case 4:
                    dm.timKiemDanhMucTheoTen(arr);
                    break;
                case 5:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-5. Moi chon lai!");
                    break;
            }
            
        } while (menu != 5);
    }
    
    static void hienMenuQuanLySanPham() {
        int menu;
        Scanner input = new Scanner(System.in);
        ArrayList arr = new ArrayList();
        MenuQuanLySanPham sp = new MenuQuanLySanPham();
        do {
            System.out.println("*****************QUAN LY SAN PHAM*************");
            System.out.println("\t1.Them san pham moi");
            System.out.println("\t2.Tinh loi nhuan san pham");
            System.out.println("\t3.Hien thi thong tin san pham");
            System.out.println("\t4.Sap xep san pham");
            System.out.println("\t5.Cap nhat thong tin san pham");
            System.out.println("\t6.Cap nhat trang thai san pham");
            System.out.println("\t7.Quay lai");
            System.out.print("Su lua chon cua ban: ");
            menu = input.nextInt();
            switch (menu) {
                case 1:
                    sp.themSanPhamMoi(arr);
                    break;
                case 2:
                    sp.tinhLoiNhuanSanPham(arr);
                    break;
                case 3:
                    sp.menuThongTinSanPham(arr);
                    break;
                case 4:
                    sp.menuSapXepSanPham(arr);
                    break;
                case 5:
                    sp.capNhatThongTinSanPhamTheoMa(arr);
                    break;
                case 6:
                    sp.capNhatTrangThaiSanPhamTheoMa(arr);
                    break;
                case 7:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-7. Moi chon lai!");
                    break;
            }
            
        } while (menu != 7);
    }
    
    public static void main(String[] args) {
        ArrayList arr = new ArrayList();
        hienMenuMain();
    }
    
}
