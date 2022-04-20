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

    public static void themSanPhamMoi(ArrayList<Product> listProduct) {
        System.out.println("Nhap san pham moi: ");
        Product pd = new Product();
        pd.inputData();
        listProduct.add(pd);
    }

    public void tinhLoiNhuanSanPham(ArrayList<Product> listProduct) {
        for (int i = 0; i < listProduct.size(); i++) {
            Product pd = (Product) listProduct.get(i);
            pd.calProfit();
        }
        System.out.println("Loi nhuan cua cac san pham la: ");
        for (int i = 0; i < listProduct.size(); i++) {
            System.out.println("\t " + listProduct.get(i).getProductName() + " : " + listProduct.get(i).profit);
        }
    }

    public void menuThongTinSanPham(ArrayList<Product> listProduct) {
        int menu;
        do {
            System.out.println("*****************THONG TIN SAN PHAM*************");
            System.out.println("\t1.Hien thi san pham theo danh muc");
            System.out.println("\t2.Hien thi chi tiet san pham");
            System.out.println("\t3.Quay lai");
            System.out.print("Su lua chon cua ban: ");
            menu = input.nextInt();
            switch (menu) {
                case 1:
                    hienThiThongTinSanPhamTheoTenDanhMuc(listProduct);
                    break;
                case 2:
                    hienThiThongTinChiTietSanPhamTheoTen(listProduct);
                    break;
                case 3:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-3. Moi chon lai!");
                    break;
            }

        } while (menu != 3);
    }

    public void hienThiThongTinSanPhamTheoTenDanhMuc(ArrayList<Product> listProduct) {

    }

    public void hienThiThongTinChiTietSanPhamTheoTen(ArrayList<Product> listProduct) {

    }

    public void menuSapXepSanPham(ArrayList<Product> listProduct) {
        int menu;
        do {
            System.out.println("*****************SAP XEP SAN PHAM*************");
            System.out.println("\t1.Sap xep san pham theo gia suat tang dan");
            System.out.println("\t2.Sap xep san pham theo loi nhuan giam dan");
            System.out.println("\t3.Quay lai");
            System.out.print("Su lua chon cua ban: ");
            menu = input.nextInt();
            switch (menu) {
                case 1:
                    sapXepSanPhamTheoGiaSuatTang(listProduct);
                    break;
                case 2:
                    sapXepSanPhamTheoLoiNhuanGiam(listProduct);
                    break;
                case 3:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-3. Moi chon lai!");
                    break;
            }

        } while (menu != 3);
    }

    public void sapXepSanPhamTheoGiaSuatTang(ArrayList<Product> listProduct) {

        for (int i = 0; i < listProduct.size(); i++) {
            for (int j = i + 1; j < listProduct.size(); j++) {
                if (listProduct.get(i).getExportPrice() > listProduct.get(j).getExportPrice()) {
                    Product pd = (Product) listProduct.get(i);
                    listProduct.set(i, listProduct.get(j));
                    listProduct.set(j, pd);
                }
            }
        }
        System.out.println("Sap xep san pham theo gia suat tang la: ");
        for (int i = 0; i < listProduct.size(); i++) {
            System.out.println("\t " + listProduct.get(i).getProductName() + " : " + listProduct.get(i).getExportPrice());
        }

    }

    public void sapXepSanPhamTheoLoiNhuanGiam(ArrayList<Product> listProduct) {
        for (int i = 0; i < listProduct.size(); i++) {
            Product pd = (Product) listProduct.get(i);
            pd.calProfit();
        }
        for (int i = 0; i < listProduct.size(); i++) {
            for (int j = i + 1; j < listProduct.size(); j++) {
                if (listProduct.get(i).profit < listProduct.get(j).profit) {
                    Product pd = (Product) listProduct.get(i);
                    listProduct.set(i, listProduct.get(j));
                    listProduct.set(j, pd);
                }
            }
        }
        System.out.println("Sap xep san pham theo loi nhuan la: ");
        for (int i = 0; i < listProduct.size(); i++) {
            System.out.println("\t " + listProduct.get(i).getProductName() + " : " + listProduct.get(i).profit);
        }
    }

    public void capNhatThongTinSanPhamTheoMa(ArrayList<Product> listProduct) {
        String idSearchNew;
        for (int i = 0; i < listProduct.size(); i++) {
            Product pd = (Product) listProduct.get(i);
            // kiem tra neu ko co ma vua nhap thi bat nhap lai 
            do {
                System.out.print("Nhap vao ma san pham can cap nhat thong tin: ");
                idSearchNew = input.nextLine();
            } while (idSearchNew.equals(pd.productId) == false);
            System.out.println("Chon thong tin moi cua san pham can cap nhat: ");
            int chon;
            do {
                System.out.println("\t1.Ten san pham");
                System.out.println("\t2.Tieu de san pham");
                System.out.println("\t3.Gia nhap san pham");
                System.out.println("\t4.Gia ban san pham");
                System.out.println("\t5.Mo ta san pham");
                System.out.println("\t6.Trang thai san pham");
                System.out.print("Ban chon: ");
                chon = input.nextInt();
                switch (chon) {
                    case 1:
                        String tam;
                        System.out.print("Nhap ten moi cua san pham: ");
                        tam=input.nextLine();
                        //listProduct.get(i).setProductName()=tam;
                        break;
                    case 2:

                        break;
                    case 3:

                        break;
                    case 4:

                        break;
                    case 5:

                        break;
                    case 6:
                        System.out.println("\tChon trang thai moi cua san pham: ");
                        int chonStatus;
                        do {
                            System.out.println("\t1.Hoat dong");
                            System.out.println("\t2.Khong hoat dong");
                            System.out.print("Ban chon: ");
                            chonStatus = input.nextInt();
                            switch (chonStatus) {
                                case 1:
                                    productStatus = true;
                                    break;
                                case 2:
                                    productStatus = false;
                                    break;
                                default:
                                    System.out.println("Chi duoc chon 1-2, moi chon lai!");
                                    break;
                            }

                        } while (chon != 1 && chon != 2);
                        pd.setProductStatus(productStatus);
                        System.out.println("\tTrang thai moi san pham: " + (pd.productStatus ? "Hoat dong" : "Khong hoat dong"));
                        break;
                    default:
                        System.out.println("Chi duoc chon 1-6, moi chon lai!");
                        break;
                }

            } while (chon != 1 && chon != 2 && chon != 3 && chon != 4 && chon != 5 && chon != 6);
        }
    }

    public void capNhatTrangThaiSanPhamTheoMa(ArrayList<Product> listProduct) { 
        String idSearchStatus;
        for (int i = 0; i < listProduct.size(); i++) {
            Product pd = (Product) listProduct.get(i);
            // kiem tra neu ko co ma vua nhap thi bat nhap lai
            do {
                System.out.print("Nhap vao ma san pham can cap nhat trang thai: ");
                idSearchStatus = input.nextLine();

            } while (idSearchStatus.equals(pd.productId) == false);
            System.out.println("\tTrang cu thai san pham: " + (pd.productStatus ? "Hoat dong" : "Khong hoat dong"));
            //cho 1 list roi chon
            System.out.println("\tChon trang thai moi cua san pham: ");
            int chon;
            do {
                System.out.println("\t1.Hoat dong");
                System.out.println("\t2.Khong hoat dong");
                System.out.print("Ban chon: ");
                chon = input.nextInt();
                switch (chon) {
                    case 1:
                        productStatus = true;
                        break;
                    case 2:
                        productStatus = false;
                        break;
                    default:
                        System.out.println("Chi duoc chon 1-2, moi chon lai!");
                        break;
                }

            } while (chon != 1 && chon != 2);
            pd.setProductStatus(productStatus);
            System.out.println("\tTrang thai moi san pham: " + (pd.productStatus ? "Hoat dong" : "Khong hoat dong"));
        }
    }
}
