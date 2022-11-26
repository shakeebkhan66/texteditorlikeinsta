import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobAdsScreen extends StatefulWidget {
  const AdmobAdsScreen({Key? key}) : super(key: key);

  @override
  State<AdmobAdsScreen> createState() => _AdmobAdsScreenState();
}

class _AdmobAdsScreenState extends State<AdmobAdsScreen> {

  BannerAd bAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad){
          print(" Ad Loaded");
        },
        onAdFailedToLoad: (Ad ad,LoadAdError error){
          print(" Ad Failed");
          ad.dispose();
        },
        onAdOpened: (Ad ad){
          print(" Ad Loaded");
        }
      ),
      request: AdRequest()
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        automaticallyImplyLeading: false,
        title: const Text(
          "Admob Ads Screen",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),

      body: Column(
        children:  const [
          Center(
            child: Text(
              "ADMOB ADS",
              style: TextStyle(
                  color: Colors.orangeAccent, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),

      bottomNavigationBar: Container(
        height: 50,
        child: AdWidget(
          ad: bAd..load(),
          key: UniqueKey(),
        ),
      ),
    );
  }
}
