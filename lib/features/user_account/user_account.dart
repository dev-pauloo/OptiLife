import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAccount extends ConsumerStatefulWidget {
  const UserAccount({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserAccountState();
}

class _UserAccountState extends ConsumerState<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('data'),],
      ),
    );
  }
}
