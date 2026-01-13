import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension EmptyPadding on num {
  // @Deprecated('used SizedBox insted')
  SizedBox get ph => SizedBox(height: h);
  SizedBox get pw => SizedBox(width: w);
}
