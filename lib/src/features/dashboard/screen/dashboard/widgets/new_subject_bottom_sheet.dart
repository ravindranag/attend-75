import 'package:attend_75/src/features/dashboard/controller/subject_controller.dart';
import 'package:attend_75/src/features/dashboard/screen/dashboard/dashboard_screen.dart';
import 'package:attend_75/src/widgets/common/outlined_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewSubjectBottomSheet extends StatefulWidget {
  const NewSubjectBottomSheet({
    super.key,
  });

  @override
  State<NewSubjectBottomSheet> createState() => _NewSubjectBottomSheetState();
}

class _NewSubjectBottomSheetState extends State<NewSubjectBottomSheet> {
  bool processing = false;

  @override
  Widget build(BuildContext context) {
    final subjectController = Get.put(SubjectController());

    void refreshScreen() {
      Navigator.pop(context);
      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      //   builder: (context) {
      //     return const DashboardScreen();
      //   },
      // ), (route) => false);
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // constraints: BoxConstraints(
        //   minHeight: 500,
        // ),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              title: const Text(
                'New subject',
                // style: Theme.of(context).textTheme.titleMedium,
              ),
              leading: null,
              actions: [
                FilledButton(
                  onPressed: () async {
                    setState(() {
                      processing = true;
                    });
                    await subjectController.addNewSubject();
                    setState(() {
                      processing = false;
                    });
                    refreshScreen();
                  },
                  child: Row(
                    children: [
                      const Text('Save'),
                      processing
                          ? AnimatedPadding(
                              duration: Duration(milliseconds: 100),
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SizedBox(
                                width: 10,
                                height: 10,
                                child: CircularProgressIndicator(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
              automaticallyImplyLeading: false,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
              child: Column(
                children: [
                  OutlinedTextField(
                    label: const Text('Name'),
                    controller: subjectController.name,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedTextField(
                          label: const Text('Classes'),
                          keyboardType: TextInputType.number,
                          controller: subjectController.classes,
                        ),
                      ),
                      const SizedBox(
                        width: 14.0,
                      ),
                      Expanded(
                        child: OutlinedTextField(
                          label: const Text('Attended'),
                          keyboardType: TextInputType.number,
                          controller: subjectController.attended,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
