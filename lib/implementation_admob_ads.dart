import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:text_editor_like_insta/text_edit_insta.dart';

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


  // TODO Interstitial Ads

  @override
  void initState() {
    _createInterstitialAd();
    super.initState();
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  int maxFailedLoadAttempts = 3;

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _numInterstitialLoadAttempts = 0;
          _showInterstitialAd();
        },
        onAdFailedToLoad: (LoadAdError error) {
          _numInterstitialLoadAttempts += 1;
          _interstitialAd = null;
          if (_numInterstitialLoadAttempts < maxFailedLoadAttempts) {
            _createInterstitialAd();
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const TextEditorLikeInsta()),
                  (route) => false,
            );
          }
        },
      ),
    );
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        ad.dispose();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const TextEditorLikeInsta()),
              (route) => false,
        );
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
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
