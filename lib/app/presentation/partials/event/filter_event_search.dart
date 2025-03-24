import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

typedef OnSave = void Function(
  Set<String> category,
  String startDate,
  String endDate,
  String minSewa,
  String maxSewa,
);

class FilterEventSearch extends StatefulWidget {
  final OnSave handleSave;
  final Set<String> category;
  final String startDate;
  final String endDate;
  final String minSewa;
  final String maxSewa;

  const FilterEventSearch({
    super.key,
    required this.handleSave,
    required this.category,
    required this.endDate,
    required this.maxSewa,
    required this.minSewa,
    required this.startDate,
  });

  @override
  State<FilterEventSearch> createState() => _FilterEventSearchState();
}

class _FilterEventSearchState extends State<FilterEventSearch> {
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController minSewa = TextEditingController();
  TextEditingController maxSewa = TextEditingController();
  List<String> categories = [
    'Bazaar',
    'Festival Makanan',
    'Konser',
    'Pameran',
  ].obs;

  final Set<String> selectedCategories = <String>{};

  // SmeEventController controller = SmeEventController.i;
  void toggleCategory(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
  }

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

  void handleRemove() {
    setState(() {
      selectedCategories.clear();
      startDate.clear();
      endDate.clear();
      minSewa.clear();
      maxSewa.clear();
    });
  }

  void handleSave() {
    widget.handleSave(
      selectedCategories,
      startDate.text,
      endDate.text,
      minSewa.text,
      maxSewa.text,
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      maxSewa.text = widget.maxSewa;
      minSewa.text = widget.minSewa;
      startDate.text = widget.startDate;
      endDate.text = widget.endDate;
      selectedCategories.addAll(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Container(
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
                      children: categories.map((category) {
                        final isSelected =
                            selectedCategories.contains(category);
                        return GestureDetector(
                          onTap: () {
                            toggleCategory(category);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? ColorConstants.primary[300]
                                  : ColorConstants.slate[50],
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 12.w,
                            ),
                            child: Text(
                              category,
                              style: body5TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : ColorConstants.slate[600],
                                weight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
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
                            textStyle: body4TextStyle(),
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
                            textStyle: body4TextStyle(),
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
                                selectionMode:
                                    DateRangePickerSelectionMode.range,
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
                            textStyle: body4TextStyle(),
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
                            textStyle: body4TextStyle(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    AppButton(
                      onPressed: handleSave,
                      text: "SIMPAN",
                    ),
                    SizedBox(height: 8.h),
                    AppButton(
                      color: ColorConstants.error,
                      onPressed: handleRemove,
                      text: "HAPUS",
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      height: isFocus
                          ? MediaQuery.of(context).viewInsets.bottom
                          : 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
