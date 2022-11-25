import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobAdsScreen extends StatefulWidget {
  const AdmobAdsScreen({Key? key}) : super(key: key);

  @override
  State<AdmobAdsScreen> createState() => _AdmobAdsScreenState();
}

class _AdmobAdsScreenState extends State<AdmobAdsScreen> {


  late BannerAd? _bannerAd;
  bool isAdLoaded = false;
  String testAdUnitId = "ca-app-pub-xxxxxxxxxxxxxxxx~yyyyyyyyyy";

  @override
  void initState() {
    super.initState();
    _initializeBannerAd();
  }

  _initializeBannerAd() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: testAdUnitId,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isAdLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error){},
        ),
        request: const AdRequest(),
    );

    // Start the Process of Loading
    _bannerAd?.load();
  }


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
        children:  [
          const Center(
            child: Text(
              "ADMOB ADS",
              style: TextStyle(
                  color: Colors.orangeAccent, fontWeight: FontWeight.w900),
            ),
          ),
          isAdLoaded ? Container(
            height: _bannerAd?.size.height.toDouble(),
            width: _bannerAd?.size.width.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          ) : const SizedBox(),
        ],
      )
    );
  }
}
