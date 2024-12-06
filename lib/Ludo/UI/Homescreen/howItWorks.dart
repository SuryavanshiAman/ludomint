import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../constant/style.dart';
import 'api/ruleapi.dart';

class Howitworks extends StatefulWidget {
  const Howitworks({super.key});

  @override
  State<Howitworks> createState() => _HowitworksState();
}

class _HowitworksState extends State<Howitworks> {

  @override
  void initState() {
    getrules();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo.shade900,
          centerTitle: true,
          title:Text("Steps for Refer and Earn",style: RighteousRegular.copyWith(fontSize: heights * 0.025, color: Colors.white)),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff005AA7),Color(0xffFFFDE4)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              )
          ),
          child: Column(
            children: [
              SizedBox(height: heights*0.05),
              HtmlWidget(refral_work==null?"":refral_work.toString(),textStyle: TextStyle(inherit: true,color: Colors.black,fontSize: widths*0.08),)


            ],
          ),
        ),
      ),
    );
  }
}
