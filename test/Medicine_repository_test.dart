import 'package:flutter_test/flutter_test.dart';
import 'package:healthlab/data/Medicine_repository/Medicine_repository.dart';
import 'package:healthlab/presenation/Medicine/model/medicine.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MedicineRepository medicineRepository;
  setUp(() {
    medicineRepository = MedicineRepository();
  });
  group("MedicineRepository", () {
    test(
        "given MedicineReposiotry medcine  function is return loaded json data ",
        () async {
      List<Medicine> medicine = await medicineRepository.loadMedicineData();
      expect(medicine, isA<List<Medicine>>());
    });
  });
}
