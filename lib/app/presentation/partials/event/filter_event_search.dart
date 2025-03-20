import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FilterEventSearch extends StatefulWidget {
  const FilterEventSearch({super.key});

  @override
  State<FilterEventSearch> createState() => _FilterEventSearchState();
}

class _FilterEventSearchState extends State<FilterEventSearch> {
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController minSewa = TextEditingController();
  TextEditingController maxSewa = TextEditingController();

  bool isDateOpen = false;
  bool isFocus = false;
  void handleOpenDate() {
    setState(() {
      isDateOpen = true;
    });
  }

  void handleSaveDate() {
    setState(() {
      isDateOpen = false;
    });
  }

  void handleFocus() {
    setState(() {
      isFocus = true;
    });
  }

  void handleUnFocus() {
    setState(() {
      isFocus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.w),
            topRight: Radius.circular(20.w),
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Center(
                    child: Text(
                      "Tambah Filter",
                      style: h4BTextStyle(),
                    ),
                  ),
                ),
                Positioned(
                  top: 20.w,
                  right: 20.w,
                  child: GestureDetector(
                    child: Icon(
                      Icons.close,
                      color: ColorConstants.slate[400],
                      size: 22.w,
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: ColorConstants.slate[200],
              height: 3.w,
            ),
            SizedBox(height: 20.w),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Kategori",
                    style: h5BTextStyle(
                      color: ColorConstants.slate[700],
                    ),
                  ),
                  SizedBox(height: 10.w),
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 9.w,
                    children:
                        ["Bazaar", "Festival Makanan", "Konser", "Pameran"]
                            .map(
                              (e) => Container(
                                decoration: BoxDecoration(
                                  color: ColorConstants.slate[50],
                                  borderRadius: BorderRadius.circular(8.w),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 12.w,
                                ),
                                child: Text(
                                  e,
                                  style: body5TextStyle(
                                    color: ColorConstants.slate[600],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                  SizedBox(height: 16.w),
                  Text(
                    "Tanggal",
                    style: h5BTextStyle(
                      color: ColorConstants.slate[700],
                    ),
                  ),
                  SizedBox(height: 12.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppInput(
                          controller: startDate,
                          onTap: handleOpenDate,
                          label: "Tanggal Mulai",
                          placeholder: "Tanggal Mulai",
                          readOnly: true,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: AppInput(
                          controller: endDate,
                          onTap: handleOpenDate,
                          placeholder: "Tanggal Selesai",
                          label: "Tanggal Selesai",
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  isDateOpen
                      ? Column(
                          children: [
                            SfDateRangePicker(
                              headerStyle: DateRangePickerHeaderStyle(
                                backgroundColor: Colors.transparent,
                              ),
                              backgroundColor: Colors.transparent,
                              selectionMode: DateRangePickerSelectionMode.range,
                              showActionButtons: true,
                              onCancel: () {
                                setState(() {
                                  isDateOpen = false;
                                });
                              },
                              onSubmit: (e) {
                                if (e is PickerDateRange &&
                                    e.startDate != null &&
                                    e.endDate != null) {
                                  startDate.text =
                                      DateFormat("dd MMMM yyyy").format(
                                    e.startDate!,
                                  );
                                  endDate.text =
                                      DateFormat("dd MMMM yyyy").format(
                                    e.endDate!,
                                  );
                                  setState(() {
                                    isDateOpen = false;
                                  });
                                }
                              },
                            ),
                          ],
                        )
                      : Container(),
                  SizedBox(height: 20.h),
                  Text(
                    "Harga Sewa",
                    style: h5BTextStyle(
                      color: ColorConstants.slate[700],
                    ),
                  ),
                  SizedBox(height: 12.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: AppInput(
                          onFocus: handleFocus,
                          onUnFocus: handleUnFocus,
                          controller: minSewa,
                          label: "Min",
                          textInputAction: TextInputAction.next,
                          placeholder: "Input max",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: AppInput(
                          onFocus: handleFocus,
                          onUnFocus: handleUnFocus,
                          controller: maxSewa,
                          label: "Max",
                          textInputAction: TextInputAction.done,
                          placeholder: "Input max",
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  AppButton(
                    onPressed: () {},
                    text: "SIMPAN",
                  ),
                  SizedBox(height: 8.h),
                  AppButton(
                    color: ColorConstants.error,
                    onPressed: () {},
                    text: "HAPUS",
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    height:
                        isFocus ? MediaQuery.of(context).viewInsets.bottom : 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
