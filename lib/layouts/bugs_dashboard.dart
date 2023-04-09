import 'package:flutter/cupertino.dart';
import 'package:untitled/shared/components/components.dart';

class BugsDashboard extends StatelessWidget {
  List test =[];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) => buildArticleItem(),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 20);
  }
}
