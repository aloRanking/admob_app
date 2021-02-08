import 'package:admobapp/utils/ad_manager.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class BannerScreen extends StatefulWidget {
  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Banner'),),
      body: SafeArea(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
