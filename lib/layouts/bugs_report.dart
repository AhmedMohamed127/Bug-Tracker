import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/Home/cubit/cubit.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/toast.dart';

class BugsReport extends StatelessWidget {
  var bugNameController = TextEditingController();
  var bugDescriptionController = TextEditingController();
  var bugAssignForController = TextEditingController();

  String? title;
  String? disc;
  String? name;

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            defaultFormField(
                controller: bugNameController,
                type: TextInputType.text,
                label: 'Enter Bugs Titles',
                prefix: Icons.bug_report_outlined,
                valdate: (data) {
                  if (data!.isEmpty) return 'Must Enter Field';
                },
                onChange: (valu) {
                  title = valu;
                }),
            Spacer(),
            defaultFormField(
                controller: bugDescriptionController,
                type: TextInputType.text,
                label: 'Enter Bugs Description',
                prefix: Icons.description,
                valdate: (data) {
                  if (data!.isEmpty) return 'Must Enter Field';
                },
                onChange: (valu) {
                  disc = valu;
                }),
            Spacer(),
            defaultFormField(
                controller: bugAssignForController,
                type: TextInputType.text,
                label: 'Enter the name for the competitor',
                prefix: Icons.accessibility,
                valdate: (data) {
                  if (data!.isEmpty) return 'Must Enter Field';
                },
                onChange: (valu) {
                  name = valu;
                }),
            Spacer(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20),
              ),
              child: MaterialButton(
                  child: const Text(
                    'Report Bug',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: ()
                  {
                    if (formKey.currentState!.validate())
                      {
                        HomeCubit.get(context).addBugReportToFirebase(title: title.toString(), disc: disc.toString(), name: name.toString());
                        showToast(
                            text: 'Reported Successfully', error: false);
                      }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
