import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fly_with_bruno/models/profile_data.dart';
import 'package:fly_with_bruno/services/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<ProfileData>? _profileData;
  fetchProfileData() async {
    _profileData = ServicesImpl().getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile Page"),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: _profileData,
              builder: (context, snapshtot) {
                print("snapshot $snapshtot");
                if (snapshtot.connectionState == ConnectionState.done) {
                  if (snapshtot.hasError) {
                    return Text("Error Loading Profile Data ");
                  } else {
                    return Text("${snapshtot.data?.name.toString()}");
                  }
                } else {
                  return LinearProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}
