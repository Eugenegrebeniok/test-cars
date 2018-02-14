<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value="/static-content/css/main.css" />">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<title>Car</title>
</head>
<body class="body">
	<table id="carList" align="center" class="tablestyle">
	<thead>
		<tr>
			<th>Марка</th>
			<th>Модель</th>
			<th>Цвет</th>
			<th>Год выпуска</th>
			<th>Страна производитель</th>
			<th>Обновить</th>
			<th>Удалить</th>
		</tr>
		</thead>
		<tbody>
		
		</tbody>
	</table>
	<hr>
	<div align="center">
	<form action="#" method="post">
		<input type="hidden" id="id" name="id" value="">
		<label>Марка:</label>
		<br>
		<input class="inputstyle" type="text" id="brand" name="brand" size="20" value=" ">
		<br>
		<label>Модель:</label>
		<br>
		<input class="inputstyle" type="text" id="model" name="model" size="20" value=" ">
		<br>
		<label>Цвет:</label>
		<br>
		<input class="inputstyle" type="text" id="color" name=color size="20" value=" ">
		<br>
		<label>Год выпуска:</label>
		<br>
		<input class="inputstyle" type="text" id="year"  name="year" size="20" value=" ">
		<br>
		<label>Страна производитель:</label>
		<br>
		<input class="inputstyle" type="text" id="country" name="country" size="20" value=" ">
		<br>
		<br>
		<input type="button" id="save" name="save" value="Сохранить">
	</form>
	</div>
</body>
<script>
$(function() {
	lodAllCars();
});

function lodAllCars(){
	$.ajax ({
		url:'rest/cars',
		method:'get',
		headers: {
			'Content-Type':'application/json'
		},
	}).success(function(data){
		
		var carList = $("#carList tbody");
		
		carList.html("");
		
		$.each(data, function(index, car){
		addCar(car);
	});
	 });
	
}


$("#save").on("click", function(){
   saveCar();
});

function saveCar(){
	var hiddenId = $("#id")
	var brand = $("#brand")
	var model = $("#model")
	var color = $("#color")
	var year = $("#year")
	var country = $("#country")
	
	var car = JSON.stringify({"id":hiddenId.val(),"brand":brand.val(),"model":model.val(),"year":year.val(),"color":color.val(),"country":country.val()})
	
	$.ajax ({
		url:'rest/cars',
		method:'post',
		data: car,
		headers: {
			'Content-Type':'application/json'
		},
	}).success(function(data){
		var carList = $("#carList tbody");
		
		carList.html("");
		
		$.each(data, function(index, car){
		addCar(car);
		
		clearFields();
	});
	 });
}


function addCar(car) {
	var carList = $("#carList tbody");
	
	var carRow = "<tr><td>" + car.brand + 
	                  "</td><td>" + car.model + 
	                  "</td><td>" + car.color + 
	                  "</td><td>" + car.year + 
	                  "</td><td>" + car.country + 
	                  "</td><td id='update_car_" + car.id + "'></td>" +
	                  "<td id='delete_car_" + car.id + "'></td></tr>";

	var updateBtn = $("<button>");
	updateBtn.text("Обновить");
	updateBtn.click(function() {
		handleUpdateClick(car.id);
	});

	var deleteBtn = $("<button>");
	deleteBtn.text("Удалить");
	deleteBtn.click(function() {
		handleDeleteClick(car.id);
	});
	
    $(carRow).appendTo(carList);

    var updateCell = $("#update_car_" + car.id);
    updateCell.append(updateBtn);
    
    


    var deleteCell = $("#delete_car_" + car.id);
    deleteCell.append(deleteBtn);
}

function handleUpdateClick(carId) {
	
	var updateUrl = 'rest/cars/' + carId;

	$.ajax({
		url : updateUrl,
		method : 'get',
		headers : {
			'Content-Type' : 'application/json'
		},
	}).success(function(car) {
		var id = $("#id");
		var brand = $("#brand");
		var model = $("#model");
		var color = $("#color");
		var year = $("#year");
		var country = $("#country");
		
		id.val(car.id);
		
		brand.val(car.brand);
		model.val(car.model);
		color.val(car.color);
		year.val(car.year);
		country.val(car.country);
	});

}

function handleDeleteClick(carId){
	
	var updateUrl = 'rest/cars/' + carId;

	$.ajax({
		url : updateUrl,
		method : 'delete',
		headers : {
			'Content-Type' : 'application/json'
		},
}).success(function(data){
		
		var carList = $("#carList tbody");
		
		carList.html("");
		
		$.each(data, function(index, car){
		addCar(car);
	});
	 });
}

function clearFields() {
	var id = $("#id");
	var brand = $("#brand");
	var model = $("#model");
	var color = $("#color");
	var year = $("#year");
	var country = $("#country");
	
	id.val("");
	
	brand.val("");
	model.val("");
	color.val("");
	year.val("");
	country.val("");
} 
</script>
</html> 