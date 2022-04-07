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
public class SinhVienKhoiC extends SinhVien {

    float diemVan;
    float diemSu;
    float diemDia;

    public SinhVienKhoiC(int maSv, String tenSv, int tuoi, float diemVan, float diemSu, float diemDia) {
        this.maSv = maSv;
        this.tenSv = tenSv;
        this.tuoi = tuoi;
        this.diemVan = diemVan;
        this.diemSu = diemSu;
        this.diemDia = diemDia;
    }

    @Override
    void tinhDiem() {
        float tongDiem = diemVan * 2 + diemSu + diemDia;
    }

    @Override
    void hienThiThongTin() {
        System.out.println("Thong tin :");
        System.out.println("Ma:" + maSv + ", ten:" + tenSv + ", tuoi :" + tuoi + ", Van :" + diemVan + ", Su:" + diemSu + ",Dia:" + diemDia);
    }

    static SinhVienKhoiC nhapSv() {
        Scanner input = new Scanner(System.in);
        System.out.print("Ma:");
        int ma = input.nextInt();
        input.nextLine();
        System.out.print("Ten:");
        String ten = input.nextLine();
        System.out.print("Tuoi:");
        int tuoi = input.nextInt();
        System.out.print("Van:");
        float diemVan = input.nextFloat();
        System.out.print("Su:");
        float diemSu = input.nextFloat();
        System.out.print("Dia:");
        float diemDia = input.nextFloat();
        SinhVienKhoiC sv = new SinhVienKhoiC(ma, ten, tuoi, diemVan, diemSu, diemDia);
        return sv;

    }
}
