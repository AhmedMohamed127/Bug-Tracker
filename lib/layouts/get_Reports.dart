import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/shared/components/components.dart';

class GetReports extends StatefulWidget {
  const GetReports({Key? key}) : super(key: key);

  @override
  State<GetReports> createState() => _GetReportsState();
}

class _GetReportsState extends State<GetReports> {
  StreamController _controller = StreamController();

  CollectionReference bugs = FirebaseFirestore.instance.collection('bugs');
  List<String> docIDs = [];
   DocumentReference? _documentReference;
  deletedata()  {
    _documentReference= FirebaseFirestore.instance.collection('bugs').doc();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream: bugs.orderBy('name').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: snapshot.data!.docs.map((bugs) {
                            return Center(
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) => InkWell(
                                    onTap: () {
                                      // navigateTo(context, WebViewScreen(article['url']),);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 65.0,
                                            height: 120.0,
                                            child:Image.asset('assets/images/bug.png'),
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 120.0,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'BugTitle: ${bugs['title']}',
                                                      style: TextStyle(
                                                          fontSize: 21
                                                      ),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Assigned For: ${bugs['name']}',
                                                    maxLines: 4,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Discrebtion: ${bugs['disc']}',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ), separatorBuilder: (BuildContext context, int index) =>myDivider(), itemCount: snapshot.data!.docs.length,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
