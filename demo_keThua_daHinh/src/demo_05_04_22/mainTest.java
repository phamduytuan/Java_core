/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo_05_04_22;

import java.util.Scanner;

/**
 *
 * @author DELL
 */
public class mainTest {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("*************MENU************");
        System.out.println("\t1.Nhap sinh vien khoi A");
        System.out.println("\t2.Nhap sinh vien khoi C");
        System.out.println("\t3.Hien thi tat ca sinh vien");
        System.out.println("\t4.Hien thi tat ca sinh vien khoi A");
        System.out.println("\t5.Sap xep DSSV khoi B theo diem Van giam dan");
        System.out.println("\t6.Thoat");
        int chon;
        int n;
        System.out.print("Nhap vao so sinh vien khoi A la: n= ");
        n = input.nextInt();
        sinhVienKhoiA[] arrA = new sinhVienKhoiA[n];
        int m;
        System.out.print("Nhap vao so sinh vien khoi C la: m= ");
        m = input.nextInt();
        sinhVienKhoiC[] arrC = new sinhVienKhoiC[m];
        do {
            System.out.print("Ban chon chuc nang: ");
            chon = input.nextInt();
            switch (chon) {
                case 1:
                    for (int i = 0; i < n; i++) {
                        System.out.println("Nhap thong tin sinh vien khoi A thu " + i);
                        sinhVienKhoiA sv = new sinhVienKhoiA();
                        sv.nhapThongTin();
                        arrA[i] = sv;
                    }
                    break;
                case 2:
                    for (int i = 0; i < m; i++) {
                        System.out.println("Nhap thong tin sinh vien khoi C thu " + i);
                        sinhVienKhoiC sv = new sinhVienKhoiC();
                        sv.nhapThongTin();
                        arrC[i] = sv;
                    }
                    break;
                case 3:
                    System.out.print("Tat ca cac sinh vien vua nhap la: ");
                    for (int i = 0; i < n; i++) {
                        arrA[i].hienThiThongTin();
                    }
                    for (int i = 0; i < m; i++) {
                        arrC[i].hienThiThongTin();
                    }
                    break;
                case 4:
                    System.out.print("Tat ca cac sinh vien khoi A vua nhap la: ");
                    for (int i = 0; i < n; i++) {
                        arrA[i].hienThiThongTin();
                    }
                    break;
                case 5:
                    
                    break;
                case 6:
                    break;
                default:
                    System.out.println("Ban chi duoc chon tu 1-6, moi chon lai!");
                    break;
            }

        } while (chon != 6);
    }

}
