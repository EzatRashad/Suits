import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/utils/navigate.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/views/layout/pages/card/address.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.nextScreen(AddressView());
          },
          child: Row(
            children: [
              AppImage(imageName: 'location.png'),
              10.pw,
              Text("Home", style: theme.titleLarge!.copyWith(fontSize: 16.sp)),
            ],
          ),
        ),
        29.ph,
        Text(
          "Dakahlia, Mansoura, Al-Gamaa District, Al-Sabahi Street",
          style: theme.titleMedium!.copyWith(color: Color(0xff727272)),
        ),
      ],
    );
  }
}
