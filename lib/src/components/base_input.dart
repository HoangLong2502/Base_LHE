part of base_lhe;

Widget AppInput({
  String? label,
  required String hintText,
  required TextEditingController? controller,
  required TextInputType textInputType,
  required Widget? suffixIcon,
  required Function validate,
  bool show = true,
  bool isPassword = false,
  int? maxLines,
  FocusNode? fn,
  bool required = false,
  Function? onTap,
  // required Function onChanged
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (label != null) RichText(
        text: TextSpan(
          text: label,
          style: p5.copyWith(color: blackColor),
          children: [
            if (required) TextSpan(
              text: ' *',
              style: p5.copyWith(color: red_1)
            )
          ],
        ),
      ),
      // Text('$label', style: p5),
      const SizedBox(height: sp8),
      TextFormField(
        onTap: () {
          if (onTap != null) onTap();
        },
        maxLines: maxLines,
        keyboardType: textInputType,
        controller: controller,
        obscureText: !show,
        focusNode: fn,
        validator: (value) {
          return validate(value);
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: borderColor_2,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: blue_1,
              width: 1,
            ),
          ),
          hintText: hintText,
          hintStyle: p6.copyWith(color: greyColor),
          // label: Text(
          //   label,
          //   style: p5,
          // ),
          suffixIcon: suffixIcon,
          // isPassword
          //   ? IconButton(
          //       icon: Icon(
          //         show ? Icons.visibility : Icons.visibility_off_outlined,
          //       ),
          //       onPressed: () {
          //         _loginController.changeShowPassword(value: show ? false.obs : true.obs);
          //       },
          //     )
          //   : Spacer(),
        ),
      ),
    ],
  );
}

class InputCurrency extends StatelessWidget {

  final String? label;
  final String hintText;
  final TextEditingController controller;
  final BuildContext context;
  final Widget? suffixIcon;
  final Function validate;
  final FocusNode? fn;
  final bool required;

  InputCurrency({
    required this.label,
    required this.hintText,
    required this.context,
    required this.suffixIcon,
    required this.validate,
    required this.controller,
    this.fn,
    this.required = false,
  });

  static const _locale = 'vi';
  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (label != null) RichText(
        text: TextSpan(
          text: '$label',
          style: p5.copyWith(color: blackColor),
          children: [
            if (required) TextSpan(
              text: ' *',
              style: p5.copyWith(color: red_1)
            )
          ],
        ),
      ),
      if (label != null) const SizedBox(height: sp8),
      TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        focusNode: fn,
        onChanged: (string) {
          string = _formatNumber(string.replaceAll('.', ''));
          controller.value = TextEditingValue(
            text: string,
            selection: TextSelection.collapsed(offset: string.length),
          );
        },
        validator: (value) {
          return validate(value);
        },
        decoration: InputDecoration(
          prefixText: _currency,
          contentPadding: const EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: borderColor_2,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: blue_1,
              width: 1,
            ),
          ),
          hintText: hintText,
          hintStyle: p6.copyWith(color: greyColor),
          suffixIcon: suffixIcon,
        ),
      ),
    ],
  );
  }
}
