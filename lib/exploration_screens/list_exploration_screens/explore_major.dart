import 'package:flutter/material.dart';
import 'package:project_2/exploration_screens/category_card.dart';
import 'package:project_2/exploration_screens/explore_categories.dart';

import '../../api/api_links.dart';
import '../explore_categories.dart';

class ExploreMajor extends StatefulWidget {
  const ExploreMajor({Key? key}) : super(key: key);

  @override
  State<ExploreMajor> createState() => _ExploreMajorState();
}

class _ExploreMajorState extends State<ExploreMajor> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: size.height * .35,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/marketing.png"),
                          fit: BoxFit.fitWidth
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * .1,),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Major Group",
                                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Row(children: [
                                      Expanded(child: Column(
                                        children: [
                                          Text("Major Group categories contains ${categoriesMajor.length} group that comprises of the jobs of the world",
                                            maxLines: 5,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                        ],
                                      ),
                                      ),
                                    ],
                                    )
                                  ],
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height*.4 - 50),
                  child: Column(
                    children: [
                      for (int i=0; i<categoriesMajor.length; i++)
                        CategoryCard(name: categoriesMajor[i].name, tag: "Major Occupation Group", nav: ApiConstants.cateMajorInfo[i],)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}