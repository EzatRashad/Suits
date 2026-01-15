import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/style/app_colors.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/button_widget.dart';
import 'package:suits/views/layout/pages/card/add_address.dart';
import 'package:suits/views/layout/pages/card/widgets/address_item.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

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
        title: Text("Shipping Address", style: theme.titleLarge),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          color: AppColors.white,
          child: AppButton(radius: 10, onTap: () {}, title: "Apply"),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: 40.ph),
              SliverList.separated(
                itemCount: 3,
                itemBuilder: (context, index) => AddressItem(),
                separatorBuilder: (context, index) =>
                    Divider(color: const Color(0xffB5B5B5), height: 20.h),
              ),
              SliverToBoxAdapter(child: 30.ph),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () => context.nextScreen(AddAddressView()),
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      color: AppColors.primary,
                      radius: Radius.circular(10.r),
                      dashPattern: [5, 5],
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 17.r,
                        horizontal: 50.r,
                      ),
                      color: AppColors.white,
                      child: Text(
                        textAlign: TextAlign.center,
                        "+ Add New Shipping Adress",
                        style: theme.titleLarge!.copyWith(
                          color: AppColors.primary,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
