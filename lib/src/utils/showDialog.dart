part of base_lhe;

class DialogUtils {
  static showLoadingDialog(
    BuildContext context, {
    required String content,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: sp24, horizontal: sp16),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(sp8),
            ),
            width: max(widthDevice(context) - sp32, 343),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const BaseLoading(),
                const SizedBox(height: sp24),
                Text('Thông báo'.tr, style: h3),
                const SizedBox(height: sp12),
                Text(
                  content,
                  style: p4.copyWith(color: greyColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showSuccessDialog(
    BuildContext context, {
    required String content,
    VoidCallback? accept,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Card(
            child: BasePopupNoti(
              click: accept,
              content: content,
              status: StatusNoti.SUCCESS,
            ),
          ),
        );
      },
    );
  }

  static showDialogWithTitleAndOptionButton(
    BuildContext context, {
    required String content,
    required VoidCallback okButton,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              Text(content),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("CANCEL")),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      okButton();
                    },
                    child: const Text("OK"),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  static showErrorDialog(
    BuildContext context, {
    required String content,
  }) {
    // developer.log(
    //   "value: data type: ${data.runtimeType}",
    //   name: 'tz',
    // );
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Card(
            child: BasePopupNoti(
              click: null,
              content: content,
              status: StatusNoti.ERROR,
            ),
          ),
        );
      },
    );
  }
}
