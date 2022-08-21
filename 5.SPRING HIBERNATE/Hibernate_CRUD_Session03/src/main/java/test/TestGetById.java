package test;

import dao.impl.CustomerDAOImpl;
import entity.Customer;

public class TestGetById {

	public static void main(String[] args) {
		Customer customer = new CustomerDAOImpl().getCustomerById("C01");
		System.out.println("Customer:");
		System.out.println("\tCustomer id: "+customer.getCusId());
		System.out.println("\tCustomer name: "+customer.getCusName());
		System.out.println("\tGender: "+(customer.getGender()?"Male":"Female"));
		System.out.println("\tBirthday: "+customer.getBirthday());
		System.out.println("\tAddress: "+customer.getAddress());
		System.out.println("\tEmail: "+customer.getEmail());
		System.out.println("\tTelephone: "+customer.getTelephone());
	}

}
