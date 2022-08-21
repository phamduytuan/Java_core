/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ghichu;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class TestDocGhiFile {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String txt = "Nguyen Van A";
        String arr[]={"Nguyen van B","Nguyen Van C"};
        try {
            //FileWriter fw = new FileWriter("data.txt");//add de cai moi len
            FileWriter fw = new FileWriter("data.txt", true);//ghi noi tiep
            BufferedWriter bw = new BufferedWriter(fw);
            
            for (String s : arr){
               bw.write(s);
               bw.newLine();// ghi tren dong moi
            }
            bw.close();
            fw.close();
        } catch (IOException ex) {

        }
    }

}
