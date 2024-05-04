import 'package:flutter/material.dart';
import 'package:terappmobile/models/response/trains_station_response.dart';

class GareProvider extends ChangeNotifier {
  late TrainStationsResponse _selectedStation;

  TrainStationsResponse get selectedStation => _selectedStation;

  void setSelectedStation(TrainStationsResponse station) {
    _selectedStation = station;
    notifyListeners();
  }
}
