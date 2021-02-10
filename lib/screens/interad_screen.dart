import 'package:admobapp/utils/ad_manager.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class InterAdScreen extends StatefulWidget {
  @override
  _InterAdScreenState createState() => _InterAdScreenState();
}

class _InterAdScreenState extends State<InterAdScreen> {

  // Add _interstitialAd
  InterstitialAd _interstitialAd;

  // Add _isInterstitialAdReady
  bool _isInterstitialAdReady;



  // Implement _loadInterstitialAd()
  void _loadInterstitialAd() {
    _interstitialAd.load();
  }

  // TODO: Implement _onInterstitialAdEvent()
  void _onInterstitialAdEvent(MobileAdEvent event) {
    switch (event) {
      case MobileAdEvent.loaded:
        _isInterstitialAdReady = true;
        break;
      case MobileAdEvent.failedToLoad:
        _isInterstitialAdReady = false;
        print('Failed to load an interstitial ad');
        break;
      case MobileAdEvent.closed:
        print('interstitial ad closed');
        break;
      default:
      // do nothing
    }
  }

  @override
  void initState() {
    // implement initState
    super.initState();

    //Initialize _isInterstitialAdReady
    _isInterstitialAdReady = false;

    //Initialize _interstitialAd
    _interstitialAd = InterstitialAd(
      adUnitId: AdManager.interstitialAdUnitId,
      listener: _onInterstitialAdEvent,
    );

    _loadInterstitialAd();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('interstitial') ),
      
      body: Container(
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to Interstitial ad',
              style: TextStyle(fontSize: 24),),


              Container(
                color: Colors.orange,
                child: FlatButton(onPressed: (){

                  // Display an Interstitial Ad
                  if (_isInterstitialAdReady) {
                    _interstitialAd.show();
                  }


                }, child: Text('show interstitial ad')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
