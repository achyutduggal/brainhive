import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostCard extends StatelessWidget {
  final snap;
  const PostCard({
    Key? key,
    required this.snap,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 16.0,
                ).copyWith(right: 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16.0,
                      backgroundImage: NetworkImage(
                          snap['profImage'],),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snap['username'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: ListView(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                shrinkWrap: true,
                                children: [
                                  'Delete',
                                ]
                                    .map(
                                      (e) => InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 16.0),
                                          child: Text(e),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.more_vert))
                  ],
                ),
              ),
              SizedBox(
                height: 200.0,
                width: double.infinity,
                child: Image.network(
                  snap['postUrl'],
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment_outlined,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                    ),
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: const Icon(Icons.bookmark_border),
                      onPressed: () {},
                    ),
                  ))
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                      child: Text(
                        '${snap['likes'].length} likes',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 8.0),
                      child: RichText(
                        text: TextSpan(
                            style: const TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: snap['username'],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '${snap['description']}',
                              ),
                            ]),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          'View all answers',
                          style: const TextStyle(
                              fontSize: 16,
                              color: CupertinoColors.secondaryLabel),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          DateFormat.yMMMd().format(snap['datePublished'].toDate(),),
                          style: const TextStyle(
                              fontSize: 16,
                              color: CupertinoColors.secondaryLabel),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
