import 'package:flutter_riverpod/flutter_riverpod.dart';

enum UserRole { specialist, client }

final roleProvider = StateProvider<UserRole>((ref) => UserRole.specialist);
