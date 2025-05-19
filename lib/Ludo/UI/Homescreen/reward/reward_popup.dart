import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:ludo_score/Ludo/UI/constant/style.dart';
import 'package:ludo_score/audio.dart';
import 'package:ludo_score/generated/assets.dart';
import 'package:ludo_score/goggleAds/ads_helper_provider.dart';
import 'package:ludo_score/main.dart';
import 'package:provider/provider.dart';


class RewardAdPopup extends StatefulWidget {
  const RewardAdPopup({super.key});

  @override
  State<RewardAdPopup> createState() => _RewardAdPopupState();
}

class _RewardAdPopupState extends State<RewardAdPopup> {
  bool _isAdWatched = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final ads = Provider.of<AdsHelper>(context, listen: false);
      ads.loadRewardedAd();
    });
  }

  void _showAdAndReward() async {
    final ads = Provider.of<AdsHelper>(context, listen: false);
    setState(() => _isLoading = true);

    if (ads.isRewardedAdLoaded) {
      ads.showRewardedAd(() {
        setState(() {
          _isAdWatched = true;
          _isLoading = false;
        });

        // TODO: Add coins logic here
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("+5 Coins added!")),
        );
      });
    } else {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ad not loaded. Try again.")),
      );
      ads.loadRewardedAd(); // Retry load
    }
  }

  @override
  Widget build(BuildContext context) {


    return Dialog(
      insetPadding: const EdgeInsets.all(15),
      backgroundColor: Colors.transparent,
      child: Container(
        // padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF0B1736),
              Color(0xFF142D66),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border.all(color: Colors.yellow, width: 3),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -height * 0.06,
                  left: width * 0.2,
                  child: Image.asset(
                    Assets.imagesGetRewards,
                    height: height * 0.08,
                    width: width*0.5,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Audio.sound();
                      Navigator.pop(context);
                    },
                    child: Image.asset(Assets.imagesCross, height: height / 25),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Get up to 500 Coins!",
              style: RighteousMedium.copyWith(
                fontSize: 20,
                color: Colors.yellowAccent,
                fontFamily: 'acme',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Only 5 spots left!",
              style: RighteousMedium.copyWith(
                fontSize: 14,
                color: Colors.white70,
                fontFamily: 'acme',
              ),
            ),
            const SizedBox(height: 20),

            GestureDetector(
              onTap: _isLoading
                  ? null
                  : () {
                Audio.sound();
                if (_isAdWatched) {
                  Navigator.pop(context);
                } else {
                  _showAdAndReward();
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                width: width*0.4,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF50A7FF), Color(0xFF2B74F0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 6),
                      blurRadius: 6,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: _isLoading
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 4,
                )
                    : Text(
                  _isAdWatched ? "Collect Coins" : "Watch Video",
                  style: RighteousMedium.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'acme',
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
