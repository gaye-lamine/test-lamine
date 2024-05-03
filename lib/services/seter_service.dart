import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:terappmobile/configs/config.dart';

import '../models/response/trains_station_response.dart';

class SeterService {
  /* ------------------- seter service  -------------------*/
  static var client = http.Client(); /* login service */


  /* -------------  get all trains service         ------------------- */

static Future<TrainStationsResponse> getALLtrainService() async {
  try {
    final response = await http.get(
      Uri.parse(Config.apiUrlSeter + Config.allTrainsStation),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Accept': '*/*',
      },
    );

    if (response.statusCode == 200) {
      // Successful GET request
      final responseData = jsonDecode(response.body);
      return TrainStationsResponse.fromJson(responseData);
    } else {
      throw Exception('Failed to load train stations: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load train stations: $e');
  }
}

 }
