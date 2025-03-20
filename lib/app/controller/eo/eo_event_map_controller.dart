import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/app/controller/eo/eo_detail_event_controller.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/utils/debouncer.dart';

class EoEventMapController extends GetxController {
  static EoEventMapController get i => Get.find<EoEventMapController>();
  Rx<LatLng> position = LatLng(-6.207034, 106.838533).obs;
  RxString location = "".obs;

  void getPosition() {
    position.value = LatLng(
      GlobalController.i.position.value!.latitude,
      GlobalController.i.position.value!.longitude,
    );

    getAddress(position.value.latitude, position.value.longitude);

    position.listen(
      (p0) {
        getAddress(p0.latitude, p0.longitude);
      },
    );
  }

  void onCameraMove(CameraPosition newPosition) {
    Debouncer(duration: Duration(milliseconds: 300)).run(() {
      position.value = newPosition.target;
    });
  }

  Future getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      var place = placemarks.first;

      List<String> formattedPlace = <String>[];
      if (place.thoroughfare != null) {
        if ((!place.thoroughfare!.toLowerCase().contains("tanpa nama"))) {
          formattedPlace.add(place.thoroughfare!);
        }
      }

      if (place.subLocality != null) {
        formattedPlace.add(place.subLocality!);
      }

      if (place.locality != null) {
        formattedPlace.add(place.locality!);
      }

      if (place.subAdministrativeArea != null) {
        formattedPlace.add(place.subAdministrativeArea!);
      }

      if (place.administrativeArea != null) {
        formattedPlace.add(place.administrativeArea!);
      }

      if (place.postalCode != null) {
        formattedPlace.add(place.postalCode!);
      }
      // Format: Kelurahan, Kecamatan, Kota, Provinsi, Kode Pos
      String placeName = formattedPlace.join(", ");
      location.value = placeName;
    } catch (_) {}
  }

  void onSave() {
    EoDetailEventController.i.form['location']!.text = location.value;
    EoDetailEventController.i.form['latitude']!.text =
        position.value.latitude.toString();
    EoDetailEventController.i.form['longitude']!.text =
        position.value.longitude.toString();
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    getPosition();
  }
}
