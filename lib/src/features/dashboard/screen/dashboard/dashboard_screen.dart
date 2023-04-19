import 'package:attend_75/src/features/authentication/model/user_model.dart';
import 'package:attend_75/src/features/profile/controller/profile_controller.dart';
import 'package:attend_75/src/widgets/common/outlined_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/dashboard_sliver_app_bar.dart';
import 'widgets/new_subject_bottom_sheet.dart';
import 'widgets/subject_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final profileController = Get.put(ProfileController());

  void openAddNewSubjectDialog() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const NewSubjectBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
          future: profileController.getCurrentUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final UserModel currentUser = snapshot.data!;
                return CustomScrollView(
                  slivers: <Widget>[
                    DashboardSliverAppBar(currentUser: currentUser),
                    const SliverToBoxAdapter(
                      child: Divider(),
                    ),
                    const SubjectList(),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 150.0,
                      ),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            } else {
              return const SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddNewSubjectDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
