import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/app_input.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'package:suits/views/layout/pages/card/widgets/address_input.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  final titleController = TextEditingController();
  final addressController = TextEditingController();
  final buildingController = TextEditingController();
  final floorController = TextEditingController();
  final apartmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("Add Address", style: theme.titleLarge),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          color: AppColors.white,
          child: AppButton(radius: 10, onTap: () {}, title: "Save"),
        ),
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            30.ph,
            AddressInput(controller: titleController, label: "Titel"),
            30.ph,

            AddressInput(controller: addressController, label: "Address"),
            30.ph,
            AddressInput(
              controller: buildingController,
              label: "Building No",
              keyboardType: TextInputType.number,
            ),
            30.ph,
            AddressInput(
              controller: floorController,
              label: "Floor No",
              keyboardType: TextInputType.number,
            ),
            30.ph,
            AddressInput(
              controller: apartmentController,
              label: "Apartment No",
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
