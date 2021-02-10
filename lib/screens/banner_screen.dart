import 'package:admobapp/screens/interad_screen.dart';
import 'package:admobapp/utils/ad_manager.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class BannerScreen extends StatefulWidget {
  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {

  //  Add _bannerAd
  BannerAd _bannerAd;


  // Implement _loadBannerAd()
  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

  Future<void> _initAdMob() {
    // TODO: Initialize AdMob SDK
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }



  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();

    _initAdMob();

    //  Initialize _bannerAd
    _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
    );

    // TODO: Load a Banner Ad
    _loadBannerAd();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Banner'),),
      body: SafeArea(
        child: FutureBuilder<void>(
          future: _initAdMob(),
          builder: (context, snapshot) {
            List<Widget> children = <Widget>[
              Text(
                "Admob App!",
                style: TextStyle(
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 72),
              ),
            ];


            if(snapshot.hasData){

              children.add(
                Column(
                  children: [
                    Icon(Icons.android, size: 34,),

                    RaisedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> InterAdScreen()));
                    },
                    child: Text('Go Inter'),
                    )
                  ],
                )
              );






            }else if( snapshot.hasError){

              children.add(
                  Icon(Icons.error, size: 34,)
              );
            }




            else{
               children.add(SizedBox(
                 child: CircularProgressIndicator(),
                 width: 48,
                 height: 48,
               ));
            }

            return Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children
            ),
            );

          }
        ),
      ),
    );
  }



  @override
  void dispose() {
    // TODO: Dispose BannerAd object
    _bannerAd?.dispose();



    super.dispose();
  }
}
