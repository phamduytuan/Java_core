package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import dao.impl.CustomerDAOImpl;
import entity.Customer;

public class TestInsert {

	public static void main(String[] args) {
		SimpleDateFormat sf = new SimpleDateFormat("dd/MM/yyyy");
		try {
			Customer c = new Customer();
			c.setCusId("C02");
			c.setCusName("Phạm Thúy Vân");
			c.setGender(false);
			c.setBirthday(sf.parse("02/11/2002"));
			c.setAddress("Sóc Sơn - Hà Nội");
			c.setEmail("van.pt@gmail.com");
			c.setTelephone("0912345678");
			boolean bl = new CustomerDAOImpl().insertCustomer(c);
			if(bl) {
				System.out.println("Đã insert thành công");
			}else {
				System.out.println("Insert lỗi");
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
