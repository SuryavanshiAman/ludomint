import 'package:flutter/material.dart';
import 'package:ludo_score/Ludo/UI/constant/style.dart';
import 'package:ludo_score/audio.dart';
import 'package:ludo_score/main.dart';

class DetailsContestScreen extends StatefulWidget {
  const DetailsContestScreen({super.key});

  @override
  State<DetailsContestScreen> createState() => _DetailsContestScreenState();
}

class _DetailsContestScreenState extends State<DetailsContestScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> rankList = [
      {"rank": "1", "amount": "₹500", "icon": Icons.emoji_events, "iconColor": Colors.yellowAccent},
      {"rank": "2", "amount": "₹300", "icon": Icons.emoji_events_outlined, "iconColor": Colors.grey},
      {"rank": "3 - 10", "amount": "₹5 each", "icon": null, "iconColor": null},
    ];

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Audio.sound();
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color(0xFF112860),
          centerTitle: true,
          title: Text("Details", style: RighteousMedium.copyWith(fontSize: height * 0.028, color: Colors.white, fontFamily: 'acme'))),
      body: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0B1736), // Deeper Navy Blue
              Color(0xFF142D66), // Slightly less saturated blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
              Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF1C3D7E),
                    Color(0xFF3A68D7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minVerticalPadding: 0,
                    title: Text("Price Pool",
                        style: RighteousMedium.copyWith(
                            fontSize: height * 0.028,
                            color: Colors.white,
                            fontFamily: 'acme')),
                    subtitle: Text("Rs.1000",
                        style: RighteousMedium.copyWith(
                            fontSize: 13, color: Colors.white, fontFamily: 'acme')),
                  ),
                  Container(
                    width: double.infinity,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 7 / 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("5 spot left",
                          style: RighteousMedium.copyWith(
                              fontSize: 13, color: Colors.white, fontFamily: 'acme')),
                      Text("10 spot",
                          style: RighteousMedium.copyWith(
                              fontSize: 13, color: Colors.white, fontFamily: 'acme')),
                    ],
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient:  const LinearGradient(
                          colors: [Color(0xFF50A7FF), Color(0xFF2B74F0)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 6),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Free Entry",
                        style: RighteousMedium.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'acme',
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 15,),
             Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text("Be the first in your network to join this contest",
                  style: RighteousMedium.copyWith(
                      fontSize: 15, color: Colors.white, fontFamily: 'acme')),
            ),
            const Divider(thickness: 0.3,color: Colors.white,),
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rank",
                      style: RighteousMedium.copyWith(
                          fontSize: 17, color: Colors.blue, fontFamily: 'acme')),
                  Text("Winning",
                      style: RighteousMedium.copyWith(
                          fontSize: 17, color: Colors.blue, fontFamily: 'acme')),
                ],
              ),
            ),
             Column(
              children: List.generate(rankList.length, (index) {
                final item = rankList[index];
                return Column(
                  children: [
                    const Divider(thickness: 0.3,color: Colors.white,height: 0,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 10,
                              color: Colors.orangeAccent,
                            ),
                            const SizedBox(width: 4,),
                            if (item['icon'] != null) ...[
                              Icon(item['icon'], color: item['iconColor'], size: 20),
                              const SizedBox(width: 6),
                            ],
                            Text(
                              item['rank'],
                              style: RighteousMedium.copyWith(
                                  fontSize: 17, color: Colors.white, fontFamily: 'acme'),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            item['amount'],
                            style: RighteousMedium.copyWith(
                                fontSize: 15, color: Colors.white, fontFamily: 'acme'),
                          ),
                        ),

                      ],
                    ),
                    if(index==rankList.length-1)
                      const Divider(thickness: 0.3,color: Colors.white,height: 0,),
                  ],
                );
              }),
            )






          ],
        ),
      ),
    );
  }
}
