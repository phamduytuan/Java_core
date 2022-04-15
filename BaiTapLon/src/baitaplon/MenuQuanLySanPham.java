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
public class MenuQuanLySanPham extends Product {

    public void themSanPhamMoi(ArrayList arr) {
        System.out.println("Nhap san pham moi: ");
        Product pd = new Product();
        pd.inputData();
        arr.add(pd);
    }

    public void tinhLoiNhuanSanPham(ArrayList arr) {
        Product pd = new Product();
        Iterator it = arr.iterator();
        while (it.hasNext()) {
            pd.calProfit();
        }
        System.out.println("Loi nhuan cua cac san pham la: ");
        while (it.hasNext()) {
            System.out.println("\t " + pd.getProductName() + " : " + pd.getProfit());
        }
    }

    public void menuThongTinSanPham(ArrayList arr) {
        int menu;
        Product pd = new Product();
        do {
            System.out.println("*****************THONG TIN SAN PHAM*************");
            System.out.println("\t1.Hien thi san pham theo danh muc");
            System.out.println("\t2.Hien thi chi tiet san pham");
            System.out.println("\t3.Quay lai");
            System.out.print("Su lua chon cua ban: ");
            menu = input.nextInt();
            switch (menu) {
                case 1:
                    hienThiThongTinSanPhamTheoTenDanhMuc(arr);
                    break;
                case 2:
                    hienThiThongTinChiTietSanPhamTheoTen(arr);
                    break;
                case 3:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-3. Moi chon lai!");
                    break;
            }

        } while (menu != 3);
    }

    public void hienThiThongTinSanPhamTheoTenDanhMuc(ArrayList arr) {
        Product pd = new Product();

    }

    public void hienThiThongTinChiTietSanPhamTheoTen(ArrayList arr) {
        Product pd = new Product();
    }

    public void menuSapXepSanPham(ArrayList arr) {
        int menu;
        Product pd = new Product();
        do {
            System.out.println("*****************SAP XEP SAN PHAM*************");
            System.out.println("\t1.Sap xep san pham theo gia suat tang dan");
            System.out.println("\t2.Sap xep san pham theo loi nhuan giam dan");
            System.out.println("\t3.Quay lai");
            System.out.print("Su lua chon cua ban: ");
            menu = input.nextInt();
            switch (menu) {
                case 1:
                    sapXepSanPhamTheoGiaSuatTang(arr);
                    break;
                case 2:
                    sapXepSanPhamTheoLoiNhuanGiam(arr);
                    break;
                case 3:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-3. Moi chon lai!");
                    break;
            }

        } while (menu != 3);
    }

    public void sapXepSanPhamTheoGiaSuatTang(ArrayList arr) {
        Product pd = new Product();
        //Sao chep mang
    }

    public void sapXepSanPhamTheoLoiNhuanGiam(ArrayList arr) {
        Product pd = new Product();
    }

    public void capNhatThongTinSanPhamTheoMa(ArrayList arr) {
        Product pd = new Product();
        //Sao chep mang
    }

    public void capNhatTrangThaiSanPhamTheoMa(ArrayList arr) {
        Product pd = new Product();
    }
}
