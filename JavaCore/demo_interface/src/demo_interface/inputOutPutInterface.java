/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo_interface;

import java.util.Scanner;

/**
 *
 * @author DELL
 */
//mac dinh la abstract, bien la final
//bat buoc phari ghi de cac phuong thuc
public interface inputOutPutInterface {
    Scanner input=new Scanner(System.in);
    void  inputData();
    void outputData();
}
