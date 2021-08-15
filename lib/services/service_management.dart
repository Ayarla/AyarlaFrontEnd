import 'package:ayarla/components/image/imageListItem.dart';
import 'package:ayarla/models/model_coiffure.dart';
import 'package:ayarla/models/model_employee.dart';
import 'package:ayarla/models/model_service.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import "package:latlong/latlong.dart" as LatLong;
import 'package:mapbox_search/mapbox_search.dart';

class ManagementService extends ChangeNotifier {
  List<ImageListItem> pages = [];
  LatLong.LatLng markerPosition = LatLong.LatLng(41.015137, 28.979530);
  LatLong.LatLng currentPosition = LatLong.LatLng(41.015137, 28.979530);
  PickResult pickedResult = PickResult();
  CoiffureModel currentCoiffure = CoiffureModel(
    name: '',
    //star: 0,
    //index: 0,
    city:'',
    district:'',
    time:'',
    text:'',
    //averagePrice: 0,
    telephone:'',
    address:'',
    //comments:0,
    images:[],
    //uniqueId:'',
    //isPrime:false,
    employeeList:[],
    serviceList:[]
  );

  removeEmployeeFromService(int serviceIndex, int employeeIndex) {
    fullTimeServices[serviceIndex].employees.removeAt(employeeIndex);
    notifyListeners();
  }

  addService(serviceName, price) {
    fullTimeServices.add(ServiceModel(
        name: serviceName, price: price, selected: false, employees: defaultService.employees));
    notifyListeners();
  }

  deleteService(int index) {
    fullTimeServices.remove(fullTimeServices[index]);
    notifyListeners();
  }

  addEmployee(String name) {
    employeesList.add(EmployeeModel(name: name, image: 'assets/default_employee.jpg'));
    notifyListeners();
  }

  removeEmployee(int employeeIndex){
    employeesList.removeAt(employeeIndex);
    notifyListeners();
  }

  setEmployee(int serviceIndex, int employeeIndex) {
    fullTimeServices[serviceIndex].employees.insert(0, employeesList[employeeIndex]);
    notifyListeners();
  }

  deleteEmployeeDefault(int employeeIndex) {
    defaultService.employees.removeAt(employeeIndex);
    notifyListeners();
  }

  ///image functions
  addImage(ImageListItem image) {
    pages.add(image);
    notifyListeners();
  }

  deleteImage(ImageListItem image) {
    pages.remove(image);
    notifyListeners();
  }

  ///map functions
  setPickedPlace(place) {
    currentPosition = LatLong.LatLng(
        place.geometry.coordinates[1], place.geometry.coordinates[0]);
    markerPosition = LatLong.LatLng(
        place.geometry.coordinates[1], place.geometry.coordinates[0]);
    setInfo(place);
    print("Koordinatlar ${place.geometry.coordinates}");
    notifyListeners();
  }

  setCoiffurePosition(position) {
    currentPosition = LatLong.LatLng(position.latitude, position.longitude);
    markerPosition = LatLong.LatLng(position.latitude, position.longitude);
    print("marker $markerPosition");
    notifyListeners();
  }

  setMarkerPosition(position) {
    markerPosition = LatLong.LatLng(position.latitude, position.longitude);
    notifyListeners();
  }

  setInfo(MapBoxPlace place) {
    print("ADdressNumber: ${place.addressNumber}");
    print("BBox: ${place.bbox}");
    print("Context: ${place.context}");
    print("Properties: ${place.properties.address}");
    print("Wikidata: ${place.properties.wikidata}");
  }

  setDefault() {
    print('as');
    markerPosition = LatLong.LatLng(41.015137, 28.979530);
    print(markerPosition);
    /// from database
    currentPosition = LatLong.LatLng(41.015137, 28.979530);
    print(currentPosition);
    /// from database
    notifyListeners();
  }

  setPickedResult(newResult) {
    pickedResult = newResult;
    print(pickedResult.formattedPhoneNumber);
    notifyListeners();
  }

}
