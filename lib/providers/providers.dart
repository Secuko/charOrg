import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/generated/app_user.pb.dart';
import 'package:vol_org/generated/operation.pb.dart';
import 'package:vol_org/generated/search_request.pb.dart';
import 'package:vol_org/generated/vol_request.pb.dart';
import 'package:vol_org/services/user_service.dart';

import '../app_shell.dart';

const sexMap = {
  Sex.MALE: "Мужской",
  Sex.FEMALE: "Женский",
};

final tabListProvider = Provider.family.autoDispose<List<TabType>, AppUser?>(
  (ref, user) => [
    TabType.common,
    if (user?.role == AppUser_Role.VOLUNTEER ||
        user?.role == AppUser_Role.ADMIN)
      TabType.messages,
    TabType.operations,
    if (user?.role == AppUser_Role.ADMIN) TabType.admin,
  ],
);

final authProvider = StreamProvider.autoDispose<User?>((ref) {
  final streamController = StreamController<User?>();
  String? lastId;
  final sub = FirebaseAuth.instance.userChanges().listen((user) {
    if (!streamController.isClosed) {
      final nid = user?.uid ?? "";
      if (lastId != nid) {
        log("Authenticated user ${user?.uid}");
        if (!streamController.isClosed) {
          streamController.add(user);
        }
      }
      lastId = nid;
    }
  });
  ref.onDispose(() {
    streamController.close();
    sub.cancel();
  });
  return streamController.stream;
});

final currentUserProvider = FutureProvider.autoDispose<AppUser>((ref) async {
  final db = UserService();
  final curUser = ref.watch(authProvider).value;
  if (curUser != null) {
    final user = await db.getUser(curUser.uid) ?? AppUser();
    return user..freeze();
  }
  return AppUser()..freeze();
});

final allUsersProvider = StreamProvider.autoDispose<List<AppUser>>((ref) {
  final userService = UserService();
  final streamController = StreamController<List<AppUser>>();
  final sub = userService.getAllUsers.listen((user) {
    if (!streamController.isClosed) {
      final list = user.docs.map((e) => e.data()).toList();
      streamController.add(list);
    }
  });
  ref.onDispose(() {
    streamController.close();
    sub.cancel();
  });
  return streamController.stream;
});

final usersWithVolReqsProvider = Provider.family.autoDispose<List<AppUser>, List<AppUser>>((ref, users) {
  final list = users.where((user) => user.hasVolRequest() && user.volRequest.status == Status.PENDING).toList();
  return list;
});

final pendingReqsProvider = StreamProvider.autoDispose<List<SearchRequest>>((ref) {
  final userService = UserService();
  final streamController = StreamController<List<SearchRequest>>();
  final sub = userService.getPendingSearchReqs.listen((searchReq) {
    if (!streamController.isClosed) {
      final list = searchReq.docs.map((e) => e.data()).toList();
      streamController.add(list);
    }
  });
  ref.onDispose(() {
    streamController.close();
    sub.cancel();
  });
  return streamController.stream;
});

final pendingOperationsProvider = StreamProvider.autoDispose<List<Operation>>((ref) {
  final userService = UserService();
  final streamController = StreamController<List<Operation>>();
  final sub = userService.getPendingOperations.listen((op) {
    if (!streamController.isClosed) {
      final list = op.docs.map((e) => e.data()).toList();
      streamController.add(list);
    }
  });
  ref.onDispose(() {
    streamController.close();
    sub.cancel();
  });
  return streamController.stream;
});