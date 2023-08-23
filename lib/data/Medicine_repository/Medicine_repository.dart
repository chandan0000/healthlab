import 'dart:convert';
import 'package:flutter/services.dart';

import '../../presenation/Medicine/model/medicine.dart';

class MedicineRepository {
  Future<List<Medicine>> loadMedicineData() async {
    final String jsonString =
        await rootBundle.loadString('assets/medicine_data.json');
    final List<dynamic> jsonData = json.decode(jsonString);

    return jsonData.map((item) => Medicine.fromJson(item)).toList();
  }

  
}
