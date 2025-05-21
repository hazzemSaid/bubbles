import 'package:bubbels/utils/constants.dart';
import 'package:bubbels/widgets/buildToggleItem.dart';
import 'package:flutter/material.dart';

class ToggleSwitch extends StatelessWidget {
  final bool isEmailSelected;
  final Function(bool) onToggle;

  const ToggleSwitch({
    super.key,
    required this.isEmailSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.grayChateau,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          buildToggleItem(context, true, 'Email', isEmailSelected, onToggle),
          buildToggleItem(context, false, 'Phone', isEmailSelected, onToggle),
        ],
      ),
    );
  }
}
