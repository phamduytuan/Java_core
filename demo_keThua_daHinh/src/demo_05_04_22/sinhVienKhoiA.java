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
public class sinhVienKhoiA extends sinhVien {

    float diemToan;
    float diemLy;
    float diemHoa;

    @Override
    void tongDiem() {
        tong = diemToan + diemLy + diemHoa;
        System.out.println("Tong diem la: " + tong);
    }

    @Override
    void nhapThongTin() {
        sinhVien sv = new sinhVien();
        sv.nhapThongTin();
        System.out.print("Nhap diem toan: ");
        diemToan = input.nextFloat();
        System.out.print("Nhap diem ly: ");
        diemLy = input.nextFloat();
        System.out.print("Nhap vao diem hoa: ");
        diemHoa = input.nextFloat();
    }

    @Override
    void hienThiThongTin() {
        sinhVien sv = new sinhVien();
        sv.hienThiThongTin();
        System.out.println("Toan: " + diemToan + " Ly: " + diemLy + " Hoa: " + diemHoa);
    }

}
