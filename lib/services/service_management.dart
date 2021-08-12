import 'package:ayarla/models/model_service.dart';
import 'package:ayarla/virtual_data_base/temporaryLists.dart';
import 'package:flutter/material.dart';

class ManagementService extends ChangeNotifier {
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

  setEmployee(int serviceIndex, int employeeIndex) {
    fullTimeServices[serviceIndex].employees.insert(0, employeesList[employeeIndex]);
    notifyListeners();
  }

  deleteEmployeeDefault(int employeeIndex) {
    defaultService.employees.removeAt(employeeIndex);
    notifyListeners();
  }
}
