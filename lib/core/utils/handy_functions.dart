import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/core/constants/themes.dart';

appSnackbar(bool isSuccess, String title) {
  if (Get.context != null) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: isSuccess ? const Color(0xFFECFDF3) : const Color(0xFFFEF3F2),
        content: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: isSuccess ? const Color(0xFFD1FADF) : const Color(0xFFFEE4E2),
                    shape: BoxShape.circle,
                    border: Border.all(color: isSuccess ? const Color(0xFFECFDF3) : const Color(0xFFFEF3F2), width: 8),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Icon(
                    isSuccess ? Icons.check_circle_outline_outlined : Icons.error_outline_outlined,
                    color: isSuccess ? const Color(0xFF22C55E) : const Color(0xFFD92D20),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(isSuccess ? 'تم بنجاح!'.tr : 'حدث خطأ!'.tr, style: textStyles.titleLarge),
                  Text(title, style: textStyles.bodyMedium!.copyWith(overflow: TextOverflow.visible))
                ],
              ),
            ),
          ],
        ),
        dismissDirection: DismissDirection.down,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(bottom: MediaQuery.of(Get.context!).size.height - 150, left: 10, right: 10),
      ),
    );
  }
}

appInfoSnackbar(String msg) {
  if (Get.context != null) {
    return ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFFECF5FD),
        content: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFECF5FD),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFFECF5FD), width: 8),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Icon(Icons.info_outline_rounded, color: const Color(0xFF2076D9)),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('تنبيه!', style: textStyles.titleLarge),
                  Text(msg, style: textStyles.bodyMedium!.copyWith(overflow: TextOverflow.visible))
                ],
              ),
            ),
          ],
        ),
        dismissDirection: DismissDirection.down,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(bottom: MediaQuery.of(Get.context!).size.height - 150, left: 10, right: 10),
      ),
    );
  }
}
