package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Seller;
public interface SellerRepository extends PagingAndSortingRepository<Seller, Long>,JpaSpecificationExecutor<Seller>{
    public List<Seller> findByIdAndPassword(String id,String password);
    public List<Seller> findByUsernameAndPassword(String userName,String password);
	public List<Seller> findByUsername(String userName);
}

