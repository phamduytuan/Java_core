package dao;

import java.util.List;

import entity.Customer;

public interface CustomerDAO {
	public List<Customer> getListCustomers();
	public Customer getCustomerById(String cusId);
	public boolean insertCustomer(Customer cus);
	public boolean updateCustomer(Customer cus);
	public boolean deleteCustomer(String cusId);
	public List<Customer> getCustomersByName(String cusName);
}
