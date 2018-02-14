package com.spirit.cartest.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spirit.cartest.domian.entity.Car;
import com.spirit.cartest.service.CarService;

@RestController
@RequestMapping(value = "/rest/cars", consumes = MediaType.APPLICATION_JSON_VALUE, 
                                      produces = MediaType.APPLICATION_JSON_VALUE)
public class CarApi {

	@Autowired
	private CarService carService;

	@ResponseBody
	@RequestMapping(method = RequestMethod.GET)
	public ResponseEntity<List<Car>> getAllCars() {
		List<Car> cars = carService.getAllCars();
		return new ResponseEntity<List<Car>>(cars, HttpStatus.OK);

	}

	@ResponseBody
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<List<Car>> saveCar(@RequestBody Car car) {
		List<Car> cars = carService.saveCar(car);
		return new ResponseEntity<List<Car>>(cars, HttpStatus.OK);

	}

	@ResponseBody
	@RequestMapping(value = "/{carId}", method = RequestMethod.DELETE)
	public ResponseEntity<List<Car>> deletCar(@PathVariable Integer carId) {
		List<Car> cars = carService.deletCar(carId);
		return new ResponseEntity<List<Car>>(cars, HttpStatus.OK);

	}

	@ResponseBody
	@RequestMapping(value = "/{carId}", method = RequestMethod.GET)
	public ResponseEntity<Car> UpdateCare(@PathVariable Integer carId) {
		Car car = carService.updateCar(carId);
		return new ResponseEntity<Car>(car, HttpStatus.OK);

	}

}
