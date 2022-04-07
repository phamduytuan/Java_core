/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo_ke_thua_da_hinh_arr;

import java.util.Scanner;

/**
 *
 * @author DELL
 */
public class SinhVien {

    int maSV;
    String tenSV;
    int tuoi;
    float tong;
    Scanner input = new Scanner(System.in);

    public SinhVien() {

    }

    public SinhVien(int maSV, String tenSV, int tuoi) {
        this.maSV = maSV;
        this.tenSV = tenSV;
        this.tuoi = tuoi;
    }

    void hienThiThongTin() {
        System.out.println("Ma: " + maSV + " Ten: " + tenSV + " Tuoi: " + tuoi);
    }

    void tongDiem() {

    }

    void nhapThongTin() {
        System.out.print("Nhap ma sinh vien: ");
        maSV = input.nextInt();
        input.nextLine();
        System.out.print("Nhap ten sinh vien: ");
        tenSV = input.nextLine();
        System.out.print("Nhap tuoi: ");
        tuoi = input.nextInt();
    }
}
