package com.spirit.cartest.dao;

import org.springframework.data.repository.CrudRepository;

import com.spirit.cartest.domian.entity.Car;

public interface CarDAO extends CrudRepository<Car, Integer> {

}
