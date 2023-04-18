part of base_lhe;

class BasePopupNoti extends StatelessWidget {
  BasePopupNoti({
    super.key,
    required this.content,
    required this.click,
    required this.status,
  });

  String content;
  Function? click;
  StatusNoti status;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: sp24, horizontal: sp16),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(sp8),
          ),
          width: max(widthDevice(context) - sp32, 343),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (status == StatusNoti.LOADING)
                const CircularProgressIndicator()
              else
                CircleAvatar(
                  radius: 30,
                  backgroundColor: status == StatusNoti.SUCCESS
                      ? green_2
                      : status == StatusNoti.WARNING
                          ? yellow_2
                          : red_2,
                  child: SvgPicture.asset(
                    '${AssetsPath.image}/${status == StatusNoti.SUCCESS ? 'noti/success.svg' : status == StatusNoti.WARNING ? 'noti/warning.svg' : 'noti/error.svg'}',
                  ),
                ),
              const SizedBox(height: sp24),
              const Text('Thông báo', style: h3),
              const SizedBox(height: sp12),
              Text(
                content,
                style: p4.copyWith(color: greyColor),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              if (status != StatusNoti.LOADING) const SizedBox(height: sp24),
              if (status != StatusNoti.LOADING)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (click != null)
                      Expanded(
                        flex: 1,
                        child: Extrabutton(
                          title: 'Quay lại',
                          event: () {
                            Get.back();
                          },
                          borderColor: borderColor_4,
                          largeButton: true,
                          icon: null,
                        ),
                      ),
                    if (click != null) const SizedBox(width: sp16),
                    if (click != null)
                      Expanded(
                        flex: 1,
                        child: MainButton(
                          title: 'Xác nhận',
                          event: () {
                            if (click != null) {
                              click!();
                            }
                          },
                          largeButton: true,
                          icon: null,
                        ),
                      ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
