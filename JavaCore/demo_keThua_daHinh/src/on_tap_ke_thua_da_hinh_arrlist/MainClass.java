/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package on_tap_ke_thua_da_hinh_arrlist;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

/**
 *
 * @author ADMIN
 */
public class MainClass {
    
    public static void main(String[] args) {
        ArrayList arr = new ArrayList();
        hienThiMenu(arr);
    }
    
    static void hienThiSinhVienKhoiA(ArrayList arr) {
        System.out.println("Sinh vien khoi A:");
        Iterator it = arr.iterator();
        while (it.hasNext()) {
            Object obj = it.next();
            if (obj instanceof SinhVienKhoiA) {
                SinhVienKhoiA sv = (SinhVienKhoiA) obj;
                sv.hienThiThongTin();
            }
        }
    }
    
    static void hienThiDanhSachSinhVien(ArrayList arr) {
        Iterator it = arr.iterator();
        while (it.hasNext()) {
            Object obj = it.next();
            if (obj instanceof SinhVienKhoiA) {
                SinhVienKhoiA sv = (SinhVienKhoiA) obj;
                sv.hienThiThongTin();
            } else {
                SinhVienKhoiC sv = (SinhVienKhoiC) obj;
                sv.hienThiThongTin();
            }
        }
    }
    
    static void sapXepDSSVKhoiCDiemVanGiamDan(ArrayList arr) {
        ArrayList<SinhVienKhoiC> arrKhoiC = new ArrayList<>();
        Iterator it = arr.iterator();
        while (it.hasNext()) {
            Object obj = it.next();
            if (obj instanceof SinhVienKhoiC) {
                arrKhoiC.add((SinhVienKhoiC) obj);
            }
        }
        for (int i = 0; i < arrKhoiC.size(); i++) {
            for (int j = i + 1; j < arrKhoiC.size(); j++) {
                if (arrKhoiC.get(i).diemVan < arrKhoiC.get(j).diemVan) {
                    SinhVienKhoiC sv = arrKhoiC.get(i);
                    arrKhoiC.set(i, arrKhoiC.get(j));
                    arrKhoiC.set(j, sv);
                }
            }
        }
        System.out.println("Danh sach sinh vien khoi C theo diem giam dan:");
        hienThiDanhSachSinhVien(arrKhoiC);
        
    }
    
    static void hienThiMenu(ArrayList arr) {
        Scanner input = new Scanner(System.in);
        int menu;
        do {
            System.out.println("==================================");
            System.out.println("1.Nhap sinh vien khoi A");
            System.out.println("2.Nhap sinh vien khoi C");
            System.out.println("3.Hien thi danh sach sinh vien");
            System.out.println("4.Hien thi sinh vien khoi A");
            System.out.println("5.Hien thi danh sach sinh vien khoi C theo diem Van giam dan");
            System.out.println("6.Thoat");
            System.out.print("Moi nhap:");
            menu = input.nextInt();
            switch (menu) {
                case 1:
                    System.out.println("Nhap sinh vien khoi A");
                    SinhVienKhoiA svA = SinhVienKhoiA.nhapSv();
                    arr.add(svA);
                    break;
                case 2:
                    System.out.println("Nhap sinh vien khoi C");
                    SinhVienKhoiC svC = SinhVienKhoiC.nhapSv();
                    arr.add(svC);
                    break;
                case 3:
                    System.out.println("Danh sach tat ca sinh vien:");
                    hienThiDanhSachSinhVien(arr);
                    break;
                case 4:
                    hienThiSinhVienKhoiA(arr);
                    break;
                case 5:
                    sapXepDSSVKhoiCDiemVanGiamDan(arr);
                    break;
                case 6:
                    break;
                default:
                    System.out.println("Ban phai nhap tu 1->6");
                    break;
            }
            
        } while (menu != 6);
        
    }
}
