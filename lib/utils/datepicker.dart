import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/utils/show_alert.dart';

void datePicker(TextEditingController controller) async {
  try {
    DateTime initialDate = DateTime.now();
    if (controller.text != "") {
      DateFormat dateFormat = DateFormat("dd MMMM yyyy");
      initialDate = dateFormat.parse(controller.text);
    }
    var date = await showDatePicker(
      context: Get.context!,
      initialDate: initialDate,
      firstDate: DateTime(1000),
      lastDate: DateTime(2999),
    );

    if (date != null) {
      controller.text = DateFormat('dd MMMM yyyy').format(date);
    }
  } catch (err) {
    showAlert(err.toString());
  }
}

void timePicker(TextEditingController controller) async {
  try {
    TimeOfDay initialTime = TimeOfDay.now();
    final DateFormat format = DateFormat.Hm();
    if (controller.text != "") {
      final currentTime = format.parse(controller.text);
      initialTime =
          TimeOfDay(hour: currentTime.hour, minute: currentTime.minute);
    }
    var date = await showTimePicker(
      context: Get.context!,
      initialTime: initialTime,
    );

    if (date != null) {
      var formattedDate = date.toDateTime();
      var formattedTime = format.format(formattedDate);
      controller.text = formattedTime;
    }
  } catch (err) {
    showAlert(err.toString());
  }
}

extension TOD on TimeOfDay {
  DateTime toDateTime() {
    return DateTime(1, 1, 1, hour, minute);
  }
}
