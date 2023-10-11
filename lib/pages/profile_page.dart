import 'package:flutter/material.dart';
import 'package:profile_app/components/profile_buttons.dart';
import 'package:profile_app/components/profile_count_info.dart';
import 'package:profile_app/components/profile_drawer.dart';
import 'package:profile_app/components/profile_header.dart';
import 'package:profile_app/components/profile_tab.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ProfileDrawer(),
      body: CustomScrollView(
        //physics: RangeMaintainingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.arrow_back_ios),
            title: Text("Profile"),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ProfileHeader(),
                ProfileCountInfo(),
                ProfileButtons(),
              ],
            ),
          ),
          SliverFillRemaining(
            child: ProfileTab(),
          )
        ],
      ),
    );
  }
}