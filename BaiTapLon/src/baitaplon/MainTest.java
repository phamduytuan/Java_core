/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package baitaplon;

import java.util.Scanner;

/**
 *
 * @author DELL
 */
public class MainTest {

    public void hienMenuMain() {
        int menu_0;
        Scanner input = new Scanner(System.in);
        do {
            System.out.println("*****************MENU*************");
            System.out.println("\t1.Quan ly danh muc");
            System.out.println("\t1.Quan ly san pham");
            System.out.println("\t3.Thoat");
            System.out.print("Su lua chon cua ban: ");
            menu_0 = input.nextInt();
            switch (menu_0) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-3. Moi chon lai!");
                    break;
            }

        } while (menu_0 != 3);

    }

    public void hienMenuQuanLyDanhMuc() {
        int menu_1;
        Scanner input = new Scanner(System.in);
        do {
            System.out.println("*****************QUAN LY DANH MUC*************");
            System.out.println("\t1.Danh sach danh muc");
            System.out.println("\t2.Them danh muc");
            System.out.println("\t3.Xoa danh muc");
            System.out.println("\t4.Tim kiem danh muc");
            System.out.println("\t5.Quay lai");

            System.out.print("Su lua chon cua ban: ");
            menu_1 = input.nextInt();
            switch (menu_1) {
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                case 4:
                    break;
                case 5:
                    break;
                default:
                    System.out.println("Chi duoc chon tu 1-5. Moi chon lai!");
                    break;
            }

        } while (menu_1 != 5);
    }

    public void hienMenuQuanLySanPham() {
        int menu_2;
        Scanner input = new Scanner(System.in);
        do {
            System.out.println("*****************QUAN LY SAN PHAM*************");
            System.out.println("\t1.Them san pham moi");
            System.out.println("\t2.Tinh loi nhuan san pham");
            System.out.println("\t3.Hien thi thong tin san pham");
            System.out.println("\t4.Sap xep san pham");
            System.out.println("\t5.Cap nhat thong tin san pham");
            System.out.println("\t6.Cap nhat trang thai san pham");
            System.out.println("\t7.Quay lai");

            System.out.print("Su lua chon cua ban: ");
            menu_2 = input.nextInt();
            switch (menu_2) {
                case 1:
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
                    break;
                case 7:
                    break;

                default:
                    System.out.println("Chi duoc chon tu 1-7. Moi chon lai!");
                    break;
            }

        } while (menu_2 != 7);
    }

    public static void main(String[] args) {

    }

}
