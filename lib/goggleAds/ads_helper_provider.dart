  import 'package:flutter/foundation.dart';
  import 'package:google_mobile_ads/google_mobile_ads.dart';
  import 'package:ludo_score/goggleAds/ads_constant.dart';

  class AdsHelper with ChangeNotifier{
    InterstitialAd? _interstitialAd;
    RewardedAd? _rewardedAd;
    bool _isRewardedAdLoaded = false;
    bool get isRewardedAdLoaded => _isRewardedAdLoaded;

  void initialize(){
    MobileAds.instance.initialize();
    _loadInterstitialAd();
    loadRewardedAd();
  }
    void _loadInterstitialAd() {
      InterstitialAd.load(
        adUnitId: AdsConstant.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _interstitialAd?.dispose();
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (error) {
            _interstitialAd = null;
            if (kDebugMode) print('InterstitialAd failed: $error');
          },
        ),
      );
    }


    // Future<void> loadRewardedAd() async {
    //   await RewardedAd.load(
    //     adUnitId: AdsConstant.rewardedAdUnitId,
    //     request: const AdRequest(),
    //     rewardedAdLoadCallback: RewardedAdLoadCallback(
    //       onAdLoaded: (ad) {
    //         _rewardedAd?.dispose(); // dispose previous
    //         _rewardedAd = ad;
    //       },
    //       onAdFailedToLoad: (error) {
    //         _rewardedAd = null;
    //         if (kDebugMode) print('RewardedAd failed: $error');
    //       },
    //     ),
    //   );
    // }
    void showInterstitialAd() {
      if (_interstitialAd != null) {
        _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            ad.dispose();
            _loadInterstitialAd();
          },
          onAdFailedToShowFullScreenContent: (ad, error) {
            ad.dispose();
            _interstitialAd = null;
          },
        );
        _interstitialAd!.show();
      }
    }

    Future<void> loadRewardedAd() async {
      _isRewardedAdLoaded = false;
      notifyListeners();

      await RewardedAd.load(
        adUnitId: AdsConstant.rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            _rewardedAd?.dispose();
            _rewardedAd = ad;
            _isRewardedAdLoaded = true;
            notifyListeners();
          },
          onAdFailedToLoad: (error) {
            _rewardedAd = null;
            _isRewardedAdLoaded = false;
            notifyListeners();
          },
        ),
      );
    }

    void showRewardedAd(VoidCallback onRewardEarned) {
      if (_rewardedAd != null) {
        _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {
            ad.dispose();
            loadRewardedAd();
          },
          onAdFailedToShowFullScreenContent: (ad, error) {
            ad.dispose();
            _rewardedAd = null;
          },
        );

        _rewardedAd!.show(onUserEarnedReward: (ad, reward) {
          onRewardEarned();
        });

        _rewardedAd = null;
        _isRewardedAdLoaded = false;
        notifyListeners();
      }
    }

    // void showRewardedAd(VoidCallback onRewardEarned) {
    //   if (_rewardedAd != null) {
    //     _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
    //       onAdDismissedFullScreenContent: (ad) {
    //         ad.dispose();
    //         loadRewardedAd();
    //       },
    //       onAdFailedToShowFullScreenContent: (ad, error) {
    //         ad.dispose();
    //         _rewardedAd = null;
    //       },
    //     );
    //     _rewardedAd!.show(
    //       onUserEarnedReward: (ad, reward) => onRewardEarned(),
    //     );
    //   }
    // }
    BannerAd getBannerAd() {
      return BannerAd(
        size: AdSize.banner,
        adUnitId: AdsConstant.bannerAdUnitId,
        listener: const BannerAdListener(),
        request: const AdRequest(),
      )..load();
    }

    @override
  void dispose() {
      super.dispose();
      _interstitialAd?.dispose();
      _rewardedAd?.dispose();
    }


  }
