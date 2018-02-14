package com.spirit.cartest.service;

import java.util.List;

import com.spirit.cartest.domian.entity.Car;

public interface CarService {

	List<Car> getAllCars();

	List<Car> saveCar(Car car);

	Car updateCar(Integer id);

	List<Car> deletCar(Integer id);

}
