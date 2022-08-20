/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package on_tap_ke_thua_da_hinh_arrlist;

import java.util.Scanner;

/**
 *
 * @author ADMIN
 */
public class SinhVienKhoiA extends SinhVien {

    float diemToan;
    float diemLy;
    float diemHoa;

    public SinhVienKhoiA(int maSv, String tenSv, int tuoi, float diemToan, float diemLy, float diemHoa) {
        this.maSv = maSv;
        this.tenSv = tenSv;
        this.tuoi = tuoi;
        this.diemToan = diemToan;
        this.diemLy = diemLy;
        this.diemHoa = diemHoa;
    }

    @Override
    void tinhDiem() {
        float tongDiem = diemToan + diemLy + diemHoa;
    }

    @Override
    void hienThiThongTin() {
        System.out.println("Thong tin :");
        System.out.println("Ma:" + maSv + ", ten:" + tenSv + ", tuoi :" + tuoi + ", Toan :" + diemToan + ", Ly:" + diemLy + ",Hoa:" + diemHoa);
    }

    static SinhVienKhoiA nhapSv() {
        Scanner input = new Scanner(System.in);
        System.out.print("Ma:");
        int ma = input.nextInt();
        input.nextLine();
        System.out.print("Ten:");
        String ten = input.nextLine();
        System.out.print("Tuoi:");
        int tuoi = input.nextInt();
        System.out.print("Toan:");
        float diemToan = input.nextFloat();
        System.out.print("Ly:");
        float diemLy = input.nextFloat();
        System.out.print("Hoa:");
        float diemHoa = input.nextFloat();
        SinhVienKhoiA sv = new SinhVienKhoiA(ma, ten, tuoi, diemToan, diemLy, diemHoa);
        return sv;

    }

}
