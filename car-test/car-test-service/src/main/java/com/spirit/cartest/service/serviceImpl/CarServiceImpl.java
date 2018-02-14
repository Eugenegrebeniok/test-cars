package com.spirit.cartest.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spirit.cartest.dao.CarDAO;
import com.spirit.cartest.domian.entity.Car;
import com.spirit.cartest.service.CarService;

@Service
@Transactional
public class CarServiceImpl implements CarService {

	@Autowired
	private CarDAO carDao;

	@Override
	public List<Car> getAllCars() {
		List<Car> car = (List<Car>) carDao.findAll();
		return car;
	}

	@Override
	public List<Car> saveCar(Car car) {
		carDao.save(car);
		return getAllCars();
	}

	@Override
	public Car updateCar(Integer id) {
		return carDao.findOne(id);
	}

	@Override
	public List<Car> deletCar(Integer id) {
		carDao.delete(id);

		return getAllCars();
	}

}
