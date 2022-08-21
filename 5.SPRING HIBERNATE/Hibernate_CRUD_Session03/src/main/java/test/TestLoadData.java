package test;

import java.util.List;

import dao.impl.CustomerDAOImpl;
import entity.Customer;

public class TestLoadData {

	public static void main(String[] args) {
		List<Customer> listCustomers = new CustomerDAOImpl().getListCustomers();
		for (Customer customer : listCustomers) {
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

}
