/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package demo_interface;

/**
 *
 * @author DELL
 */
public class HinhVuong extends HinhHoc implements inputOutPutInterface {

    float canhHinhVuong;

    @Override
    void tinhS() {
        float s = canhHinhVuong * canhHinhVuong;
        System.out.println("Dien tich: " + s);
    }

    @Override
    void tinhP() {
        float p = canhHinhVuong * 4;
        System.out.println("Chu vi: " + p);
    }

    @Override
    public void inputData() {

        System.out.print("Canh hinh vuong la:");
        canhHinhVuong = input.nextFloat();
    }

    @Override
    public void outputData() {
        System.out.println("Canh hinh vuong la:" + canhHinhVuong);
        this.tinhS();
        this.tinhP();
    }

}
