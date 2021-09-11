import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Ad extends StatefulWidget {
  @override
  _AdState createState() => _AdState();
}

class _AdState extends State<Ad> {
  BannerAd ad;

  bool _loaded = false;

  @override
  void initState() {
    super.initState();

    ad = BannerAd(
      adUnitId: 'ca-app-pub-4239593143180743/8513197760',
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(() {
          _loaded = true;
        }),
      ),
      request: AdRequest(),
      size: AdSize.largeBanner,
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: _loaded
          ? AdWidget(
              ad: ad,
            )
          : SizedBox(
              height: 100,
            ),
    );
  }
}
