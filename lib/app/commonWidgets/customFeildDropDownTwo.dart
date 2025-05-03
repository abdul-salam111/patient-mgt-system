import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:patient_management/app/commonWidgets/customtext.dart';
import 'package:patient_management/app/resources/colors.dart';

Widget customFieldDropDownTwo({
  required RxString hintttext,
  required List<String> valuesList,
  required RxList<String> selectedValues,
}) {
  return Obx(() {
    return Stack(
      children: [
        TextFormField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: selectedValues.isEmpty
                ? hintttext.value
                : selectedValues.join(', '),
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: textfieldgrey,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: greyColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: greyColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            contentPadding: const EdgeInsets.only(left: 10, top: 0),
          ),
        ),
        Positioned(
          right: 20,
          top: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () async {
              final List<String>? result =
                  await showModalBottomSheet<List<String>>(
                context: Get.context!,
                builder: (BuildContext context) {
                  return MultiselectDropdown(
                    valuesList: valuesList,
                    selectedValues: selectedValues.toList(),
                  );
                },
              );
              if (result != null) {
                selectedValues.assignAll(result);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                "assets/icons/dropdown.png",
                height: 13,
                width: 13,
              ),
            ),
          ),
        ),
      ],
    );
  });
}

class MultiselectDropdown extends StatefulWidget {
  final List<String> valuesList;
  final List<String> selectedValues;

  const MultiselectDropdown({
    super.key,
    required this.valuesList,
    required this.selectedValues,
  });

  @override
  _MultiselectDropdownState createState() => _MultiselectDropdownState();
}

class _MultiselectDropdownState extends State<MultiselectDropdown> {
  late List<String> _tempSelectedValues;

  @override
  void initState() {
    super.initState();
    _tempSelectedValues = widget.selectedValues;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.valuesList.length,
          itemBuilder: (BuildContext context, int index) {
            final item = widget.valuesList[index];
            final isSelected = _tempSelectedValues.contains(item);
            return CheckboxListTile(
              title: CustomText(
                color: textfieldgrey,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
                text: item,
              ),
              value: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _tempSelectedValues.add(item);
                  } else {
                    _tempSelectedValues.remove(item);
                  }
                });
              },
            );
          },
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, _tempSelectedValues);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
