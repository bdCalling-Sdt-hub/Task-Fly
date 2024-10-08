import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_string.dart';

class CommonPhoneNumberTextFiled extends StatelessWidget {
  const CommonPhoneNumberTextFiled(
      {super.key, required this.controller, required this.countryChange});

  final TextEditingController controller;
  final Function(Country value) countryChange;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      onCountryChanged: countryChange,
      decoration: const InputDecoration(
        hintText: AppString.phoneNumber,
        fillColor: AppColors.transparent,
        filled: true,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textIcon_50),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textIcon_50),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textIcon_50),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textIcon_50),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textIcon_50),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.textIcon_50),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      initialCountryCode: "BD",
      disableLengthCheck: false,
    );
  }
}
