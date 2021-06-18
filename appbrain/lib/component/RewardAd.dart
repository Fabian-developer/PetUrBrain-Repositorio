import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:peturbrain/utility/Pointer.dart';

class RewardAd extends StatefulWidget {
  @override
  _RewardAdState createState() => _RewardAdState();
}

class _RewardAdState extends State<RewardAd> {
  @override
  void initState() {
    super.initState();

    RewardedAd.load(
      adUnitId: 'ca-app-pub-4239593143180743/1593278261',
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          ad.show(
            onUserEarnedReward: (ad, reward) {
              blocHome.addPoints(value: reward.amount.round());
              Navigator.pop(context);
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).colorScheme.primaryVariant,
          ),
        ),
      ),
    );
  }
}
