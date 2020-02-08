import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
  primary: false,
  slivers: [
    SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 1,
        childAspectRatio: 3.8,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [const Text('Granit Arifi',
                         style: TextStyle(fontSize: 25)),
                         const Text('arifig@oregonstate.edu \nhttps://github.com/Granit23',
                         style: TextStyle(fontSize: 14))],
            ),
            // color: Colors.blueGrey[300],
            color: Theme.of(context).colorScheme.primary,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          ),
          fillerResumeInfo(),
          fillerResumeInfo(),
          fillerResumeInfo(),
          fillerResumeInfo(),
          fillerResumeInfo(),
          fillerResumeInfo(),
          fillerResumeInfo(),
          fillerResumeInfo(),
        ],
      ),
    ),
  ],
);
  }

  Widget fillerResumeInfo() {
    return Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const Text('Software Development Intern',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        const Text('E Corp.                      2016-Present                 Springfield, OR',
                        style: TextStyle(fontSize: 14)),
                        const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh ele',
                        style: TextStyle(fontSize: 14)),
                        ],
          ),
          color: Colors.blueGrey[100],
        );
  }

}

