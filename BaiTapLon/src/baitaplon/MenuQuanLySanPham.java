/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitaplon;

import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class MenuQuanLySanPham extends Product {

    static void themSanPhamMoi(ArrayList arr) {
        System.out.println("Nhap san pham moi: ");
        Product pd = new Product();
        pd.inputData();
        arr.add(pd);
    }

    public void tinhLoiNhuanSanPham(ArrayList arr) {
        Product pd = new Product();
        for (int i = 0; i < arr.size(); i++) {
            pd.calProfit();
        }
        System.out.println("Loi nhuan cac san pham la:");
        for (int i = 0; i < arr.size(); i++) {
            System.out.println("San pham thu " + i + " : " + pd.getProfit());
        }
    }

    public void hienThiThongTinSanPhamTheoTenDanhMuc(ArrayList arr) {
        Product pd = new Product();

    }

    public void hienThiThongTinSanPhamTheoTenTimKiem(ArrayList arr) {
        Product pd = new Product();
    }

    public void sapXepSanPhamTheoGiaXuatTang(ArrayList arr) {
        Product pd = new Product();
    }

    public void sapXepSanPhamTheoLoiNhuanGiam(ArrayList arr) {
        Product pd = new Product();
    }

    public void capNhatThongTinSanPhamTheoMa(ArrayList arr) {
        Product pd = new Product();
    }

    public void capNhatTrangThaiSanPhamTheoMa(ArrayList arr) {
        Product pd = new Product();
    }
}
