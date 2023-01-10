import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:protobuf/protobuf.dart';
import 'package:vol_org/generated/operation.pb.dart';

import '../generated/app_user.pb.dart';
import '../generated/search_request.pb.dart';
import '../generated/vol_request.pb.dart';

class UserService {
  final storageRef = FirebaseStorage.instance.ref();

  final users =
      FirebaseFirestore.instance.collection("users").withConverter<AppUser>(
            fromFirestore: (snapshot, _) =>
                AppUser.create()..mergeFromProto3Json(snapshot.data()),
            toFirestore: (AppUser user, _) =>
                jsonDecode(jsonEncode(user.toProto3Json())),
          );

  final searchRequests = FirebaseFirestore.instance
      .collection("searchRequests")
      .withConverter<SearchRequest>(
        fromFirestore: (snapshot, _) =>
            SearchRequest.create()..mergeFromProto3Json(snapshot.data()),
        toFirestore: (SearchRequest req, _) =>
            jsonDecode(jsonEncode(req.toProto3Json())),
      );

  final operations = FirebaseFirestore.instance
      .collection("operations")
      .withConverter<Operation>(
        fromFirestore: (snapshot, _) =>
            Operation.create()..mergeFromProto3Json(snapshot.data()),
        toFirestore: (Operation op, _) =>
            jsonDecode(jsonEncode(op.toProto3Json())),
      );

  Future<void> uploadImage(Uint8List bytes, String path) async {
    try {
      await storageRef.child(path).putData(bytes);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String> getImageUrl(String path) async {
    try {
      return await storageRef.child(path).getDownloadURL();
    } catch (e) {
      log(e.toString());
      return "";
    }
  }

  /// Пользователи
  Future<AppUser?> getUser(String id) async {
    final userRef = users.doc(id);
    final docSnap = await userRef.get();
    final user = docSnap.data();
    return user;
  }

  Stream<QuerySnapshot<AppUser>> get getAllUsers => users.snapshots();

  Future<AppUser> addOrUpdateUser(AppUser user) async {
    DocumentReference userRef = users.doc(user.id.isEmpty ? null : user.id);
    await userRef.set(user);
    return user;
  }

  /// Заявки в волонтёры
  Future<bool> addOrUpdateVolReq(AppUser user, VolRequest volReq) async {
    DocumentReference userRef = users.doc(user.id.isEmpty ? null : user.id);
    try {
      await userRef.update({'volRequest': volReq.toProto3Json()});
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<bool> acceptVolReq(AppUser user) async {
    DocumentReference userRef = users.doc(user.id);
    try {
      await userRef.update({
        'volRequest.status': Status.ACCEPTED.name,
        if (user.role != AppUser_Role.ADMIN) 'role': AppUser_Role.VOLUNTEER.name
      });
      return true;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
    return false;
  }

  Future<bool> declineVolReq(AppUser user) async {
    DocumentReference userRef = users.doc(user.id);
    try {
      await userRef.update({'volRequest': FieldValue.delete()});
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  /// Заявки на поиск

  Future<SearchRequest?> getSearchReq(String id) async {
    final searchReqRef = searchRequests.doc(id);
    final docSnap = await searchReqRef.get();
    final searchReq = docSnap.data();
    return searchReq;
  }

  Stream<QuerySnapshot<SearchRequest>> get getPendingSearchReqs =>
      searchRequests.where("status", isEqualTo: Status.PENDING.name).snapshots();

  Future<bool> addOrUpdateSearchReq(SearchRequest searchReq) async {
    DocumentReference searchRef =
        searchRequests.doc(searchReq.id.isEmpty ? null : searchReq.id);
    searchReq = searchReq.rebuild((p0) {
      p0.id = searchRef.id;
    });

    try {
      await searchRef.set(searchReq);
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future<bool> acceptSearchReq(SearchRequest searchReq) async {
    DocumentReference searchReqRef = searchRequests.doc(searchReq.id);
    try {
      await searchReqRef.update({
        'status': Status.ACCEPTED.name,
      });

      DocumentReference operationRef = operations.doc(searchReq.id);
      await operationRef.set(
        Operation(
          id: searchReq.id,
          usersId: [FirebaseAuth.instance.currentUser?.uid ?? ""],
          searchReqId: searchReq.id,
          status: Status.PENDING,
        ),
      );

      return true;
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
    return false;
  }

  Future<bool> declineSearchReq(SearchRequest searchReq) async {
    DocumentReference searchReqRef = searchRequests.doc(searchReq.id);
    try {
      await searchReqRef.delete();
      return true;
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  /// Операции

  Stream<QuerySnapshot<Operation>> get getPendingOperations =>
      operations.where("status", isEqualTo: Status.PENDING.name).snapshots();
}
