import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:suits/core/utils/utils.dart';
import 'package:suits/core/widgets/App_image.dart';
import 'package:suits/views/layout/pages/product_details/widgets/details_app_bar.dart';
import 'package:suits/views/layout/pages/product_details/widgets/details_nav.dart';
import 'package:suits/views/layout/pages/product_details/widgets/details_quantity.dart';
import 'package:suits/views/layout/pages/product_details/widgets/size_and_color.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      bottomNavigationBar: DetailsNav(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            DetailsAppBar(),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Famale Style",
                          style: theme.titleMedium!.copyWith(
                            color: const Color(0xff979696),
                            fontSize: 12.sp,
                          ),
                        ),
                        Spacer(),
                        AppImage(imageName: "star.png"),
                        Text(
                          " 5.0",
                          style: theme.titleMedium!.copyWith(
                            color: const Color(0xff979696),
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),

                    10.ph,

                    Text(
                      "Classic Blazar",
                      style: theme.titleMedium!.copyWith(
                        fontSize: 20.sp,
                        fontVariations: [FontVariation("wght", 500)],
                      ),
                    ),

                    18.ph,

                    Text(
                      "Product Details",
                      style: theme.titleMedium!.copyWith(
                        fontSize: 16.sp,
                        fontVariations: [FontVariation("wght", 500)],
                      ),
                    ),
                    Text(
                      "cotton sweat shirt with a text point",
                      style: theme.titleMedium!.copyWith(
                        color: const Color(0xff979696),
                        fontSize: 16.sp,
                        fontVariations: [FontVariation("wght", 500)],
                      ),
                    ),
                    19.ph,
                    DetailsQuantity(),
                    26.ph,
                    Divider(color: Color(0xffB5B5B5)),
                    23.ph,
                    SizeAndColor(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
