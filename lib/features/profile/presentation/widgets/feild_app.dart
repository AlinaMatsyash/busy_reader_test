import 'package:busy_reader/res/assets/colors.gen.dart';
import 'package:busy_reader/theme/app_typography.dart';
import 'package:flutter/material.dart';

///TODO[1]: change widget
class FieldApp extends StatelessWidget {
  const FieldApp(
      {Key? key,
      this.validator,
      this.initialValue = '',
      this.labelText = '',
      required this.controller})
      : super(key: key);

  final String? Function(String?)? validator;
  final String initialValue;
  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: ColorName.drab,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextFormField(
            cursorColor: ColorName.lightGray,
            controller: controller,
            style: AppTypography.montserratMedium16
                .copyWith(color: ColorName.blackApp),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              //filled: true,
              // fillColor: Color(0xffF6F6F6),
              label: Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text(
                  labelText,
                  style: AppTypography.montserratMedium16
                      .copyWith(color: ColorName.lightGray),
                ),
              ),
              //labelText: labelText,
              labelStyle: AppTypography.montserratMedium16
                  .copyWith(color: ColorName.lightGray),
              //focusedErrorBorder: InputBorder.none,
              //errorBorder: InputBorder.none,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
