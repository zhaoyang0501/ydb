
package com.pzy.service;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.pzy.entity.Seller;
import com.pzy.repository.SellerRepository;

@Service
public class SellerService {
     @Autowired
     private SellerRepository sellerRepository;
     public List<Seller> findAll() {
          return (List<Seller>) sellerRepository.findAll();
     }
     public Page<Seller> findAll(final int pageNumber, final int pageSize,final String sellerName){
               PageRequest pageRequest = new PageRequest(pageNumber - 1, pageSize, new Sort(Direction.DESC, "id"));
              
               Specification<Seller> spec = new Specification<Seller>() {
                    @Override
                    public Predicate toPredicate(Root<Seller> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                    Predicate predicate = cb.conjunction();
                    if (sellerName != null) {
                         predicate.getExpressions().add(cb.like(root.get("name").as(String.class), sellerName+"%"));
                    }
                    return predicate;
                    }
               };
               Page<Seller> result = (Page<Seller>) sellerRepository.findAll(spec, pageRequest);
               return result;
     }
     public void delete(Long id){
          sellerRepository.delete(id);
     }
     public Seller find(Long id){
    	  return sellerRepository.findOne(id);
     }
     public void save(Seller Seller){
    	 sellerRepository.save(Seller);
     }
     public Seller login(String adminSellerName,String password){
    	 List<Seller> adminSellers=sellerRepository.findByUsernameAndPassword(adminSellerName,password);
    	 return adminSellers.size()==0?null:adminSellers.get(0);
     }
}