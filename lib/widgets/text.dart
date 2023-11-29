import 'package:epic_games/app.dart';
import 'package:epic_games/res/style.dart';

class KText
extends
StatelessWidget {

final String text;
final double? fontSize;

final FontWeight? fontWeight;
final Color? color;
final double? lineHeight;
final TextAlign? textAlign;
final TextDecoration? decoration;
final TextOverflow? overflow;

const KText(this
.
text,
{Key? key,
this.fontSize,
this.fontWeight,
this.color,
this.lineHeight,
this.textAlign,
this.decoration,
this.overflow})
:
super
(
key: key);

@override
Widget build(BuildContext context) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: overflow,
    style: appTextStyle.copyWith(
        decoration: decoration,
        fontSize: fontSize ?? 22.sp,
        fontWeight: fontWeight ?? FontWeight.w300,
        color: color ?? Theme
            .of(context)
            .colorScheme
            .onPrimaryContainer,
        height: lineHeight),
  );
}}