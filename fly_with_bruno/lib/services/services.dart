import 'dart:developer';

import 'package:fly_with_bruno/models/profile_data.dart';
import 'package:fly_with_bruno/services/datasources/local_db.dart';

abstract class Services {
  Future<ProfileData> getProfileData();
}

class ServicesImpl implements Services {
  final source = LocalDbImpl();
  @override
  Future<ProfileData> getProfileData() async {
    try {
      final profileData = await source.getProfile();
      return profileData;
    } on Exception catch (e) {
      log(e.toString());
      return ProfileData();
    }
  }
}
