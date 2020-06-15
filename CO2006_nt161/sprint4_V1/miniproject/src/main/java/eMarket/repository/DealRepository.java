package eMarket.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import eMarket.domain.Deal;

public interface DealRepository extends CrudRepository<Deal, Integer> {
    Deal findById(int id);
    //List<Deals> findByProduct(Product product);
}