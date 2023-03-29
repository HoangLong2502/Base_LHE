part of base_lhe ;

abstract class BaseSelectSetup {
  void handleSelect(SelectModel? itemSelect);

  void validateSelect(SelectModel? itemSelect);
}

class BaseSelect extends StatelessWidget {
  List<SelectModel> list;
  SelectModel select;
  Function? handleSelect;
  String? hint;
  Function validator;

  BaseSelect({
    required this.list,
    required this.select,
    required this.handleSelect,
    required this.validator,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<SelectModel>(
      hint: Text(
        '$hint',
        style: p6.copyWith(color: greyColor),
      ),
      isExpanded: true,
      style: p6,
      // underline: Container(
      //   color: Color.fromARGB(0, 0, 0, 0),
      // ),
      value: select,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: sp12, horizontal: sp12),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: red_1),
            borderRadius: BorderRadius.circular(sp8)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: borderColor_2),
            borderRadius: BorderRadius.circular(sp8)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: mainColor),
            borderRadius: BorderRadius.circular(sp8)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: red_1),
            borderRadius: BorderRadius.circular(sp8)),
      ),
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 3,
      onChanged: (SelectModel? value) {
        handleSelect!(value);
      },
      validator: (value) {
        return validator(value);
      },
      items: list.map<DropdownMenuItem<SelectModel>>((item) {
        return DropdownMenuItem<SelectModel>(
          value: item,
          child: Text(
            item.label,
            style: p6.copyWith(color: blackColor),
          ),
        );
      }).toList(),
    );
  }
}
