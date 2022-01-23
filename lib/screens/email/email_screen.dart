import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:buildworks/models/Email.dart';
// import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import 'components/header.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({
    Key key,
    this.email,
  }) : super(key: key);

  final Email email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0x1A000000), width: 1)
            // borderRadius: BorderRadius.circular(15),
            ),
        child: SafeArea(
          child: Column(
            children: [
              Header(),
              Divider(thickness: 1),
              Expanded(
                child: SingleChildScrollView(
                  // padding: EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      WorkUpdate(),
                      Divider(thickness: 1),
                      SizedBox(height: kDefaultPadding),
                      WorkUpdate(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WorkUpdate extends StatelessWidget {
  const WorkUpdate({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CircleAvatar(
          //   maxRadius: 24,
          //   backgroundColor: Colors.transparent,
          //   backgroundImage: AssetImage(emails[1].image),
          // ),
          SizedBox(width: kDefaultPadding),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: emails[1].person,
                              style: TextStyle(fontWeight: FontWeight.w900),
                              // style: Theme.of(context).textTheme.button,
                              children: [
                                TextSpan(
                                    text:
                                        "    Daily Progress: 10%  |  Workers: 45",
                                    // style: Theme.of(context).textTheme.caption
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF282F3F),
                                        fontSize: 12)),
                              ],
                            ),
                          ),
                          // Text(
                          //   "Inspiration for our new home",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .headline6,
                          // )
                        ],
                      ),
                    ),
                    SizedBox(width: kDefaultPadding / 2),
                    Text(
                      "Today at 15:32",
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                SizedBox(height: kDefaultPadding),
                LayoutBuilder(
                  builder: (context, constraints) => SizedBox(
                    width:
                        constraints.maxWidth > 850 ? 800 : constraints.maxWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello my love, \n \nSunt architecto voluptatum esse tempora sint nihil minus incidunt nisi. Perspiciatis natus quo unde magnam numquam pariatur amet ut. Perspiciatis ab totam. Ut labore maxime provident. Voluptate ea omnis et ipsum asperiores laborum repellat explicabo fuga. Dolore voluptatem praesentium quis eos laborum dolores cupiditate nemo labore. \n \nLove you, \n\nElvia",
                          style: TextStyle(
                            height: 1.5,
                            color: Color(0xFF4D5875),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: kDefaultPadding),
                        Row(
                          children: [
                            Text(
                              "6 attachments",
                              style: TextStyle(fontSize: 12),
                            ),
                            Spacer(),
                            Text(
                              "Download All",
                              style: Theme.of(context).textTheme.caption,
                            ),
                            SizedBox(width: kDefaultPadding / 4),
                            SvgPicture.asset(
                              "assets/Icons/Download.svg",
                              height: 16,
                              color: kGrayColor,
                            ),
                          ],
                        ),
                        Divider(thickness: 1),
                        SizedBox(height: kDefaultPadding / 2),
                        SizedBox(
                          height: 400,
                          child: StaggeredGridView.countBuilder(
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) =>
                                ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/Img_$index.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            staggeredTileBuilder: (int index) =>
                                StaggeredTile.count(
                              2,
                              index.isOdd ? 2 : 1,
                            ),
                            mainAxisSpacing: kDefaultPadding,
                            crossAxisSpacing: kDefaultPadding,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
