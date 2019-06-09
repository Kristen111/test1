package com.aistar.service;

import com.aistar.entity.Customer;

public interface CustomerService {
    public boolean isExistTelno(long custTelno);


    public boolean save(Customer customer);

    public Customer getByNameAndPwd(Customer customer);
    public Customer getByEmailAndPwd(Customer customer);
    public  Customer getByTelnoAndPwd(Customer customer);

    public Customer getById(int Id);

    public boolean update(Customer customer);

}
