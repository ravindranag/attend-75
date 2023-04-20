import 'package:attend_75/src/features/dashboard/controller/subject_controller.dart';
import 'package:attend_75/src/features/dashboard/model/subject/subject_model.dart';
import 'package:attend_75/src/repository/subjects/subject_repository.dart';
import 'package:attend_75/src/widgets/common/FilledCard.dart';
import 'package:attend_75/src/widgets/common/filled_icon_button.dart';
import 'package:attend_75/src/widgets/common/outlined_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/counter_widget.dart';

class SubjectDetailScreen extends StatefulWidget {
  const SubjectDetailScreen({Key? key, required this.subject})
      : super(key: key);

  final SubjectModel subject;

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  late int attended, classes;
  final subjectController = Get.put(SubjectController());
  bool loading = false;

  @override
  void initState() {
    super.initState();
    attended = widget.subject.attended;
    classes = widget.subject.classes;
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void navigateToDashboard() => Navigator.pop(context);

  void toggleLoading() => setState(() => loading = !loading);

  void handleSave() async {
    widget.subject.updateCounters(attended, classes);
    print(widget.subject.toJson());
    try {
      await subjectController.updateSubject(
        widget.subject.id!,
        widget.subject.toJson(),
      );
      showSnackBar('Attendance updated');
      navigateToDashboard();
    } catch (_) {
      showSnackBar('Something went wrong');
    }
  }

  void increment(String name) {
    setState(() {
      if (name == 'attended' && attended < classes) {
        attended += 1;
      } else if (name == 'classes') {
        classes += 1;
      }
    });
  }

  void decrement(String name) {
    setState(() {
      if (name == 'attended' && attended > 0) {
        attended -= 1;
      } else if (name == 'classes' && classes > 0) {
        classes -= 1;
      }
    });
  }

  void handleDelete(String name) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete $name?'),
          content: const Text('This action is irreversible.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                toggleLoading();
                try {
                  await SubjectController.instance.deleteSubject(widget.subject.id!);
                  showSnackBar('Subject deleted');
                  navigateToDashboard();
                } catch (_) {
                  showSnackBar('Operation failed.');
                  toggleLoading();
                }
              },
              child: const Text('Delete'),
              style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.error),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject.name),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () => handleDelete(widget.subject.name),
            icon: const Icon(Icons.delete_forever),
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(),
            const SizedBox(
              height: 50.0,
            ),
            Counter(
              value: attended,
              name: 'attended',
              decrement: decrement,
              increment: increment,
            ),
            const SizedBox(
              height: 50.0,
              width: double.infinity,
            ),
            Counter(
              value: classes,
              name: 'classes',
              decrement: decrement,
              increment: increment,
            ),
            const SizedBox(
              height: 50.0,
              width: double.infinity,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledIconButton(
        icon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: loading
              ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: const CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  ),
              )
              : const Icon(
                  Icons.check,
                  size: 30.0,
                ),
        ),
        onPressed: loading ? () {} : handleSave,
      ),
    );
  }
}
