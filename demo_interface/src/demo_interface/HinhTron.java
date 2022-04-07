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
public class HinhTron extends HinhHoc implements inputOutPutInterface {

    float banKinh;

    @Override
    void tinhS() {
        float s = 3.14f * banKinh * banKinh;
        System.out.println("Dien tich: " + s);
    }

    @Override
    void tinhP() {
        float p = 2 * 3.14f * banKinh;
        System.out.println("Chu vi: " + p);
    }

    @Override
    public void inputData() {
        System.out.print("Ban kinh hinh tron la:");
        banKinh = input.nextFloat();
    }

    @Override
    public void outputData() {
        System.out.println("Ban kinh hinh tron la: " + banKinh);
        this.tinhS();
        this.tinhP();
    }

}
