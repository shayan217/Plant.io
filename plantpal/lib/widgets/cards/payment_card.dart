import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantpal/utils/app_colors.dart';

class PaymentCard extends StatelessWidget {
  final String icon;
  final String name;
  final int btnValue;
  final int btnGroupValue;
  final ValueChanged<int?>? onChanged;

  const PaymentCard({super.key, 
    required this.icon,
    required this.name,
    required this.btnValue,
    required this.btnGroupValue,
    required this.onChanged,
  });


  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      color: AppColor.imgBgColor,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(icon),
                const SizedBox(width: 10),
                Text(
                  name,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Radio<int>(
              activeColor: AppColor.primaryColor,
              value: btnValue,
              groupValue: btnGroupValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
