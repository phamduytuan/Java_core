/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo_interface;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

/**
 *
 * @author DELL
 */
public class MainClass {

    public static void main(String[] args) {
        ArrayList arr = new ArrayList();
        hienThiMenu(arr);
    }

    static void demHinhTron(ArrayList arr) {

        Iterator it = arr.iterator();
        int dem = 0;
        while (it.hasNext()) {
            Object obj = it.next();
            if (obj instanceof HinhTron) {
                HinhTron ht = (HinhTron) obj;
                dem++;
            }
        }
        System.out.println("Co" + dem + "hinh tron!");
    }

    static void hienThiHinhVuong(ArrayList arr) {
        System.out.println("Cac hinh vuong vua nhap:");
        Iterator it = arr.iterator();
        while (it.hasNext()) {
            Object obj = it.next();
            if (obj instanceof HinhVuong) {
                HinhVuong hv = (HinhVuong) obj; //ep kieu
                hv.outputData();
            }
        }
    }

    static void hienThiMenu(ArrayList arr) {
        Scanner input = new Scanner(System.in);
        int menu;
        do {
            System.out.println("===============MENU===================");
            System.out.println("\t1.Nhap hinh vuong");
            System.out.println("\t2.Nhap hinh tron");
            System.out.println("\t3.So hinh tron da nhap");
            System.out.println("\t4.Hien thi cac hinh vuong");
            System.out.println("\t5.Thoat");
            System.out.println("");
            System.out.print("Moi nhap:");
            menu = input.nextInt();
            switch (menu) {
                case 1:
                    System.out.println("Nhap hinh vuong: ");
                    HinhVuong hv = new HinhVuong();
                    hv.inputData();
                    arr.add(hv);
                    break;
                case 2:
                    System.out.println("Nhap hinh tron: ");
                    HinhTron ht = new HinhTron();
                    ht.inputData();
                    arr.add(ht);
                    break;
                case 3:
                    demHinhTron(arr);
                    break;
                case 4:
                    hienThiHinhVuong(arr);
                    break;
                case 5:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-5. Moi nhap lai!");
                    break;
            }

        } while (menu != 5);
    }

}
