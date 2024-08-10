import 'package:fly_with_bruno/models/profile_data.dart';

abstract class Source {
  Future<ProfileData> getProfile();
}
