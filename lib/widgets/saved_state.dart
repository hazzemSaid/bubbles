import 'package:bubbels/widgets/LoginWithEmailWidget.dart';
import 'package:bubbels/widgets/LoginWithPhoneWidget.dart';
import 'package:flutter/material.dart';

class state_storage_widget extends StatelessWidget {
  const state_storage_widget({
    super.key,
    required this.bucket,
    required this.isEmailSelected,
  });

  final PageStorageBucket bucket;
  final bool isEmailSelected;

  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: bucket,
      child: IndexedStack(
        index: isEmailSelected ? 0 : 1,
        children: [
          LoginWithEmailWidget(key: const PageStorageKey('emailLogin')),
          LoginWithPhoneWidget(key: const PageStorageKey('phoneLogin')),
        ],
      ),
    );
  }
}
