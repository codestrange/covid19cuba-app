import 'dart:developer';

import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:covid19cuba/src/utils/utils.dart';

class TipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Consejos y Respuestas'),
        centerTitle: true,
      ),
      backgroundColor: Constants.primaryColor,
      body: Center(
        child: ListView(
          children: tips() + [Container(height: 15)],
        ),
      ),
    );
  }

  List<Widget> tips() {
    List<Widget> result = [];
    for (var tip in Constants.tips) {
      result.add(
        GFAccordion(
          collapsedTitlebackgroundColor: Constants.primaryColor,
          expandedTitlebackgroundColor: Constants.primaryColor,
          contentbackgroundColor: Constants.primaryColor,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          collapsedIcon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          expandedIcon: Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
          ),
          title: tip[0],
          contentChild: Linkify(
            text: tip[1],
            options: LinkifyOptions(humanize: true),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            linkStyle: TextStyle(
              color: Colors.red,
              fontSize: 16,
            ),
            onOpen: (link) async {
              if (await canLaunch(link.url)) {
                await launch(link.url);
              } else {
                log('Could not launch $link');
              }
            },
          ),
        ),
      );
    }
    return result;
  }
}
