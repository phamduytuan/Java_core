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
public class sinhVien {

    int maSV;
    String tenSV;
    int tuoi;
    float tong;
    Scanner input = new Scanner(System.in);

    public sinhVien() {

    }

    public sinhVien(int maSV, String tenSV, int tuoi) {
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
