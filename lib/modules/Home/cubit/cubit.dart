import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layouts/bugs_dashboard.dart';
import 'package:untitled/layouts/bugs_report.dart';
import 'package:untitled/layouts/get_Reports.dart';
import 'package:untitled/modules/Home/cubit/state.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  //Firebase:
  CollectionReference bugReport = FirebaseFirestore.instance.collection('bugs');

  int current_index = 0;
  List len = [];
  List Screens = [BugsReport(), BugsDashboard(), GetReports()];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.bug_report_outlined,
          color: Colors.deepOrange,
        ),
        label: 'Bug Report'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.dashboard_customize_outlined,
          color: Colors.deepOrange,
        ),
        label: 'Dashboard'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.group,
          color: Colors.deepOrange,
        ),
        label: 'Group')
  ];

  void changeBottomNavBar(int index) {
    current_index = index;
    emit(HomeBottomNavState());
  }

  //FireBase:
  Future<void> addBugReportToFirebase({
    required String title,
    required String disc,
    required String name,
  }) {
    return bugReport.add({
      'title': title,
      'disc': disc,
      'name': name,
    }).then((value) 
    {
      emit(BugsReportSendSuccess());
      print("Suuccess");
    }).catchError((Error)
    {
      print(Error.toString());
      emit(BugsReportSendError());
    });
  }
}
