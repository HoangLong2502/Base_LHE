part of base_lhe;

Widget BaseContainer(BuildContext context, Widget child) {
  return Container(
    width: widthDevice(context) - sp32,
    padding: const EdgeInsets.all(sp16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(sp8),
      color: whiteColor,
    ),
    child: child,
  );
}