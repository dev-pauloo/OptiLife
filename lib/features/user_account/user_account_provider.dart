import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/authentication/firebase_authentication.dart';
import '../../core/state/page_state.dart';
import 'user_account_state.dart';

final userAccountProvider = StateNotifierProvider<UserAccountProviderNotifier,
    PageState<UserAccountState>>((ref) {
  return UserAccountProviderNotifier(AuthService());
});

class UserAccountProviderNotifier
    extends StateNotifier<PageState<UserAccountState>> {
  final AuthService _authService;

  UserAccountProviderNotifier(this._authService)
      : super(
          PageState.init(
            data: UserAccountState(name: 'Paulo', height: '', weight: '', dob: ''),
          ),
        );
}
