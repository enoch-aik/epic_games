import 'package:epic_games/app.dart';
import 'package:epic_games/res/style.dart';

ThemeData appTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xff202020),
        contentPadding: EdgeInsets.only(left: 30.w),
        enabledBorder: OutlineInputBorder(
           // borderSide: const BorderSide(color: Colors.white,width: 0),
            borderRadius: BorderRadius.circular(50.r)),
        focusedBorder: OutlineInputBorder(
            //borderSide: const BorderSide(color: Colors.white,width: 0),
            borderRadius: BorderRadius.circular(50.r)),
        labelStyle:
            appTextStyle.copyWith(fontSize: 20.sp, color: Colors.white)));
