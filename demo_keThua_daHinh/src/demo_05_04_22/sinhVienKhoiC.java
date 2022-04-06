/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo_05_04_22;

/**
 *
 * @author DELL
 */
public class sinhVienKhoiC extends sinhVien {

    float diemVan;
    float diemSu;
    float diemDia;

    public sinhVienKhoiC() {
    }

    public sinhVienKhoiC(int maSV, String tenSV, int tuoi, float diemVan, float diemSu, float diemDia) {
        this.maSV = maSV;
        this.tenSV = tenSV;
        this.tuoi = tuoi;
        this.diemVan = diemVan;
        this.diemSu = diemSu;
        this.diemDia = diemDia;
    }

    @Override
    void tongDiem() {
        tong = diemVan * 2 + diemSu + diemDia;
        System.out.println("Tong diem la: " + tong);
    }

    @Override
    void nhapThongTin() {
        sinhVien sv = new sinhVien();
        sv.nhapThongTin();
        System.out.print("Nhap diem van: ");
        diemVan = input.nextFloat();
        System.out.print("Nhap diem su: ");
        diemSu = input.nextFloat();
        System.out.print("Nhap vao diem dia: ");
        diemDia = input.nextFloat();
    }

    @Override
    void hienThiThongTin() {
        sinhVien sv = new sinhVien();
        sv.hienThiThongTin();
        System.out.println("Van: " + diemVan + " Su: " + diemSu + " Dia: " + diemDia);
    }

}
