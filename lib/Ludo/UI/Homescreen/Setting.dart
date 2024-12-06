import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../audio.dart';
import '../constant/images.dart';
import '../constant/style.dart';
import 'api/ruleapi.dart';
import 'logout.dart';

class Mysettings extends StatefulWidget {
  const Mysettings({super.key});

  @override
  State<Mysettings> createState() => _MysettingsState();
}

class _MysettingsState extends State<Mysettings> {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  bool gamechat = false;
  bool Vibration = false;
  bool Sound = false;

  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Dialog(
      insetPadding: const EdgeInsets.all(15),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(39)),
      child: Container(
        // height: heights * 0.6,
        width: widths * 0.8,
        padding: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow.shade800, width: 3),
            borderRadius: BorderRadius.circular(40)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    child:
                        Image.asset(AppAsset.imagesCross, height: heights / 20),
                    onTap: () {
                      Audio.sound();
                      Navigator.pop(context);
                    }),
              ),
              // SizedBox(height: heights/60,),
              Text("SETTINGS",
                  style: RighteousMedium.copyWith(
                      fontSize: heights * 0.028, color: Colors.white)),
              SizedBox(height: heights * 0.04),
              // Container(
              //   width: widths / 1.6,
              //   height: heights / 15,
              //   decoration: BoxDecoration(
              //       color: Color(0xff010a40).withOpacity(0.9),
              //       border: Border.all(color: Colors.white, width: 2),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 5),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text('Sound',
              //             style: RighteousMedium.copyWith(
              //                 fontSize: heights * 0.020,
              //                 color: Colors.white)),
              //         CustomSwitch(
              //           activeColor: Colors.green,
              //           value: Sound,
              //           onChanged: (value) {
              //             print("VALUE : $value");
              //             Audio.sound();
              //             setState(() {
              //               Sound = value;
              //             });
              //           },
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: heights * 0.01),
              // Container(
              //   width: widths / 1.6,
              //   height: heights / 15,
              //   decoration: BoxDecoration(
              //       color: Color(0xff010a40).withOpacity(0.9),
              //       border: Border.all(color: Colors.white, width: 2),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 5),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text('Vibration', style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white)),
              //         CustomSwitch(
              //           activeColor: Colors.green,
              //           value: Vibration,
              //           onChanged: (value) {
              //             Audio.sound();
              //             print("VALUE : $value");
              //             setState(() {
              //               Vibration = value;
              //             });
              //           },
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: heights * 0.01,),
              // Container(
              //   width: widths / 1.6,
              //   height: heights / 15,
              //   decoration: BoxDecoration(
              //       color: Color(0xff010a40).withOpacity(0.9),
              //       border: Border.all(color: Colors.white, width: 2),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 5),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text('Game Chat', style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white)),
              //         CustomSwitch(
              //           activeColor: Colors.green,
              //           value: gamechat,
              //           onChanged: (value) {
              //             Audio.sound();
              //             print("VALUE : $value");
              //             setState(() {
              //               gamechat = value;
              //             });
              //           },
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: heights * 0.01,),
              // Container(
              //   width: widths / 1.6,
              //   height: heights / 15,
              //   decoration: BoxDecoration(
              //       color: Color(0xff010a40).withOpacity(0.9),
              //       border: Border.all(color: Colors.white, width: 2),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 5),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text('Share', style: RighteousMedium.copyWith(fontSize: heights * 0.020, color: Colors.white)),
              //         Container(
              //           height: heights/20,
              //           width: widths/10,
              //           decoration: BoxDecoration(
              //               color: Colors.green,
              //               border: Border.all(
              //                   color: Colors.yellow, width: 2),
              //               borderRadius: BorderRadius.circular(10)),
              //           child: IconButton(
              //             icon: Icon(Icons.share,size: 17,),
              //             color: Colors.white,
              //             onPressed: () {
              //               share();
              //             },
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              // SizedBox(height: heights * 0.01,),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('About Us',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.contact_page_sharp,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) => Dialog(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(39)),
                                    child: Container(
                                      height: heights * 0.6,
                                      width: widths * 0.8,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.yellow.shade800,
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                                child: InkWell(
                                                    child: Image.asset(
                                                        AppAsset.imagesCross,
                                                        height: heights / 20),
                                                    onTap: () {
                                                      Audio.sound();
                                                      Navigator.pop(context);
                                                    })),
                                          ),
                                          Center(
                                              child: Text("About Us",
                                                  style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                              heights * 0.028,
                                                          color:
                                                              Colors.white))),
                                          SizedBox(
                                            height: heights / 30,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: heights / 2.5,
                                            // color: Colors.yellowAccent,
                                            child: const SingleChildScrollView(
                                                child: Text(
                                              """Welcome to Ludo Mint!

Ludo Mint is a premier skill-based gaming platform dedicated to providing an engaging and competitive environment for Ludo enthusiasts. Our mission is to bring the traditional game of Ludo into the digital age, allowing players from around the world to connect, compete, and showcase their strategic prowess.

At Ludo Mint, we believe in fair play, fun, and continuous improvement. Our platform is designed with advanced algorithms to ensure a level playing field, where skill and strategy triumph over luck. Whether you are a casual player looking to enjoy a quick game or a serious competitor aiming to top the leaderboards, Ludo Mint offers a seamless and exhilarating gaming experience.

Join us on this exciting journey and become a part of the Ludo Mint community!
""",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                          ),

                                          // Text(
                                          //     Rules == null
                                          //         ? ""
                                          //         : Rules.toString(),
                                          //     style: GoogleFonts.robotoSlab(
                                          //         textStyle: TextStyle(
                                          //             color: Colors.white,
                                          //             fontSize: heights / 20))),
                                        ],
                                      ),
                                    )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Contact Us',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.contact_page_sharp,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) => Dialog(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(39)),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      height: heights * 0.6,
                                      width: widths * 0.8,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.yellow.shade800,
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: InkWell(
                                                child: Image.asset(
                                                    AppAsset.imagesCross,
                                                    height: heights / 20),
                                                onTap: () {
                                                  Audio.sound();
                                                  Navigator.pop(context);
                                                }),
                                          ),
                                          Center(
                                              child: Text("Contact Us",
                                                  style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                              heights * 0.028,
                                                          color:
                                                              Colors.white))),
                                          SizedBox(
                                            height: heights / 30,
                                          ),
                                          const Text(
                                            "We value your feedback and are here to assist you with any queries or concerns. Please feel free to reach out to us through any of the following method:",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          const ListTile(
                                            leading: Icon(
                                              Icons.email,
                                              color: Colors.white,
                                            ),
                                            title: Text(
                                              "Email: support@ludomint.com",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            contentPadding: EdgeInsets.all(0),
                                          ),
                                          const Text(
                                            "Our customer support team is available from Monday to Friday, 9:00 AM to 6:00 PM (EST). We strive to respond to all inquiries within 24 hours.",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Privacy Policy',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.contact_page_sharp,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) => Dialog(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(39)),
                                    child: Container(
                                      height: heights * 0.6,
                                      width: widths * 0.8,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.yellow.shade800,
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: InkWell(
                                                child: Image.asset(
                                                    AppAsset.imagesCross,
                                                    height: heights / 20),
                                                onTap: () {
                                                  Audio.sound();
                                                  Navigator.pop(context);
                                                }),
                                          ),
                                          Center(
                                              child: Text("Privacy Policy",
                                                  style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                              heights * 0.028,
                                                          color:
                                                              Colors.white))),
                                          SizedBox(
                                            height: heights / 30,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: heights / 2.5,
                                            // color: Colors.yellowAccent,
                                            child: const SingleChildScrollView(
                                                child: Text(
                                              """Your Privacy at ludomint.com
This Privacy Policy covers how Gyan Kuber Pvt. Ltd. or any of its subsidiaries or affiliates (collectively “Gyan Kuber Pvt. Ltd.”) treats personal information that Gyan Kuber Pvt. Ltd. collects and receives in connection with your use of www.ludomint.com and/or the games and applications offered by Gyan Kuber Pvt. Ltd. This includes software that you have downloaded or are about to download, any software that you have embedded on a web site or are about to embed (“Gyan Kuber Pvt. Ltd. Games”), any applications created by Gyan Kuber Pvt. Ltd. and available through social networking sites (“SNS Apps”), any applications created by Gyan Kuber Pvt. Ltd. and available through mobile devices (“Mobile Apps”), any software running on Gyan Kuber Pvt. Ltd. ’ servers, (“Gyan Kuber Pvt. Ltd. Software”), content, related documentation, information on the Gyan Kuber Pvt. Ltd. domain, and information made available by users to each other through the Gyan Kuber Pvt. Ltd. Software (collectively, the “Service”). Your privacy is important to us and, as described in this Privacy Policy, we have designed the Service to protect information about you from unauthorized disclosure to others. This Privacy Policy explains how we collect, use and, in certain circumstances, share your personally identifying information. Please read this Privacy Policy carefully, and if you have any questions, feel free to contact us. This Privacy Policy is framed in view of the Information Technology Act, 2000 read with Regulation 4 of the Information technology (Reasonable Security Practices and Procedures and Sensitive Personal Data or Information) Rules, 2011. By registering for, accessing, using, and/or downloading any Service, you agree to Gyan Kuber Pvt. Ltd. ’ Privacy Policy and that you will abide by Gyan Kuber Pvt. Ltd. ’ Terms of Service. Among other things, you consent to the collection and use of your personal information as outlined in this Privacy Policy, as such policy may be amended from time to time. We may update the Privacy Policy and if we do, we will post a notice that changes have been made on the website www.ludomint.com. You should visit this page periodically to review any changes to the Privacy Policy.




Types Of Information
Personal Information: Personal Information means any information that may be used to identify an individual, including, but not limited to, the first and last names, physical temporary and personal address, telephone number, date of birth, age, gender, e-mail address, or any other contact information, financial information including bank account details, credit/debit card details or such other payment information. Further, Sensitive Personal Data or Information (“SPDI”) of a person includes Personal Information about that person relating to: passwords, financial information (bank accounts, credit and debit cards or other payment instruments), physical information. The Company limits the collection of Personal Information to that which is necessary for its intended purpose.
Business Information: Business Information means any information that may be used to identify an individual’s business, including but not limited to the name and address of the entity, date of incorporation, e-mail address of the entity, contact information of the registered office, company identification number (CIN), financial information including bank account details, PAN details, names of the directors and such other information (hereinafter referred to as “Business Information”).
Non-Personal Information: Non-personal information means information that does not specifically identify an individual or business, but includes information from you, such as your browser type, the URL of the previous websites you visited, your Internet Service Provider (ISP), operating system and your Internet Protocol (IP) address. The Company may gather any non-personal information regarding how many people visit the website, the pages they visit, their IP address, and the type of browser they used while visiting the website (hereinafter referred to as “Non-Personal Information”). The Company may also collect Non-Personal Information that you voluntarily provide, such as information included in response to a questionnaire or a survey conducted by the Company.



Usage Information: Usage Information includes without limitation all data and information collected automatically through the website (or through the third party analytics service providers), by use and access of the website in the nature of system administrative data, statistical and demographic data, and operational information and data generated by or characterizing use of the website including without limitation Non-Personal Information, cookies, website traffic, time spent on the website, number of visits to the website and other similar information and behaviour indicating the mode and manner of use of the website (hereinafter referred to as the “Usage Information”). Personal Information, SPDI, Business Information, Non-Personal Information and Usage Information hereinafter shall be referred to as “Information”.



What we Collect
Gyan Kuber Pvt. Ltd. gives you a number of options regarding what information you will give us:
When you register a profile with Gyan Kuber Pvt. Ltd. , your profile including any information (name, address, gender) will be registered with Gyan Kuber Pvt. Ltd. When you identify yourself on a Gyan Kuber Pvt. Ltd. site, you may identify yourself using a Gyan Kuber Pvt. Ltd. account. When you identify yourself on a Gyan Kuber Pvt. Ltd. site, you may identify yourself through a social network account in which Gyan Kuber Pvt. Ltd. may receive additional information about your profile.
In each case, we will collect and record the information you have provided. Other than names and email addresses provided at your discretion, we don’t generally collect any “Personal Information” about our users (such as social security number, street address, drivers license number, etc.), exception being for billing and payments where we store your billing information such as name, street address, phone number. We may offer you the opportunity to submit other information about yourself (such as gender, age, occupation, hobbies, interests, zip code, etc.), or we may be able to collect that information from social networking systems on which you have used Gyan Kuber Pvt. Ltd. Games or SNS Apps (in accordance with the terms of use of those systems), which would then also be covered by this Privacy Policy.
In addition to information about yourself, you may choose to share information about yourself in other content (“Content”), such as in games. Any action you perform with other players is considered public, and at your own discretion. When you use an SNS App on your social network page or use an SNS App on someone else’s page, we may record information regarding the use of that SNS App, and we may collect other information that is visible on your social network page in accordance with the relevant terms of use associated with that page.
Note that since most Gyan Kuber Pvt. Ltd. Software is served through SNS Apps, it is your responsibility to read and accept their Terms of Use, as well as Privacy Policy prior to continuing. When you use a Mobile App, which includes telephones and other devices such as tablets, you agree that information about your use of the Service through your mobile device and carrier may be communicated to us. This information includes, but is not limited to your carrier, device, geo-location, IP address, telephone number, country or other information you provide. With your permission, we may also access your contacts. Your carrier’s standard fees and rates will still apply, including without limitation SMS/text messaging fees, and you accept responsibility for all charges. When you invite new members into your network or send messages through the Service, we collect and maintain on secure servers the information associated with those messages, including email addresses and content.
We may use information about you that we collect from other sources, including but not limited to newspapers and Internet sources such as blogs, instant messaging services, Gyan Kuber Pvt. Ltd. Games and other users of Gyan Kuber Pvt. Ltd. , to supplement your profile. Gyan Kuber Pvt. Ltd. may contain links to other websites. We are of course not responsible for the privacy practices of other web sites. We encourage our users to be aware when they leave our site to read the privacy statements of each and every web site that collects personally identifiable information. This Privacy Policy applies solely to information collected by Gyan Kuber Pvt. Ltd.
You should also be aware that most content is delivered through Gyan Kuber Pvt. Ltd. Games originate with another content provider. Such other content providers may place “cookies” on your browser, or otherwise gather information about you, including by asking you to provide information through the site itself.
Finally, in order to provide the best possible service and to allow us to make certain internal reports and make recommendations, we collect aggregate information about the use of the Service, including information about users accessing the Gyan Kuber Pvt. Ltd. site, playing Gyan Kuber Pvt. Ltd. Games, using SNS Apps on other sites or using Mobile Apps, such as internet protocol addresses, browser type, browser language, referring / exit pages and URLs, other browser history, platform type, number of clicks, domain names, landing pages, pages viewed and the order of those pages, the amount of time spent on particular pages, and the date and time (“Activity Information”).
By using the Service, you consent to our retaining all the above-described information in anonymous form as long as Gyan Kuber Pvt. Ltd. sees fit.





Children Under The Age Of 13
Gyan Kuber Pvt. Ltd. does not knowingly collect or solicit personal information from anyone under the age of 13 or knowingly allow such persons to register. If you are under 13, please do not attempt to register for Gyan Kuber Pvt. Ltd. or send any information about yourself to us, including your name, address, telephone number, or email address. No one under age 13 may provide any personal information to or on Gyan Kuber Pvt. Ltd. . In the event that we learn that we have collected personal information from a child under age 13 we will delete that information as quickly as possible. If you believe that we might have any information from or about a child under 13, please support@ludomint.com



Children Between The Ages Of 13 and 18
We recommend that minors over the age of 13 ask their parents for permission before sending any information about themselves to anyone over the Internet.



How We Use Your Information
We do not sell or rent your “Personally Identifiable Information” to any third party. We may, however, use certain information about you that is not personally identifiable. We may also use public information collected to determine the kinds of content that you would like to view and to assist any advertisers in targeting their advertising. We also use your name, email address, telephone number, and other information on our system to notify you of new product releases, service notifications, and to solicit your feedback and input. Those emails or SMS/text messages will contain links for preference management and where appropriate, an opt-out method.
With your consent we may send push notifications to your mobile device to provide updates and relevant messages. We may also send local notifications to your mobile device. You may manage notifications from the “Settings” page of the Mobile App or through your device. The Company uses the Information you provide to (a) manage your account; (b) respond to your inquiries about its offerings and the transactions carried out on the website; (c) provide you with information about products and services available on the website and offer you other products and services that the Company believes may be of interest to you; (d) resolve any glitches on the website including addressing any technical problems; (e) improve the services and content on the website and your experience of navigating through the website and carrying out transactions on the website and; and (f) manage the Company’s relationship with you.
By accepting our Privacy Policy or otherwise providing information to us, you consent to us collecting and using the information, as well as the processing and transferring of the information as deemed necessary.
You understand and agree that we may access, preserve, and disclose any information we may have about you and the contents of your account if required to do so by law or in a good faith belief that such access, preservation or disclosure is reasonably necessary to avoid liability, to comply with legal process, such as a search warrant, subpoena, statute, or court order, to protect our rights and property, or that of our affiliates or the public, or when there is a violation of our Terms of Service Agreement. Gyan Kuber Pvt. Ltd. is not required to question or contest the validity of any search warrant, subpoena or other similar governmental request that Gyan Kuber Pvt. Ltd. receives. Gyan Kuber Pvt. Ltd. may maintain copies of your Content indefinitely, or delete certain Content in whole or in part if Gyan Kuber Pvt. Ltd. determines, in its sole discretion, that such Content constitutes an infringing or a prohibited posting as set forth in our Terms of Service or for any or no reason.
We also use non-Personally Identifiable Information and certain technical information about your computer and your access to the Service (including your IP address) in order to operate, manage and maintain the Service, improve the Service and create new services. Gyan Kuber Pvt. Ltd. may disclose information about you to its partners in order to provide the Service, resolve service problems and correct errors in the Service, to communicate with you about the Service, to provide you with advertising and promotional information in connection with the Service, and to enhance your experience on the Service. However, we do not give our partners an independent right to share this information.
Due to our contractual obligations with these third parties and the need to share information to deliver and support the Service, we cannot provide you with the opportunity to opt-out of sharing information (whether Personally Identifiable Information or other information) with these third parties. Gyan Kuber Pvt. Ltd. , certain of its partners, and each of their contractors and employees may view the Content that you transmit to the service to provide the Service and otherwise perform the tasks set forth in this Privacy Policy.




Controlling Your Personal Information
Be advised that if you send messages or post material containing personal information, that information may be collected and used by others. You can terminate your account at any time which will remove your profile and other personal information from view. Gyan Kuber Pvt. Ltd. , however, may (but is not obligated to) keep information about you that is on its system following your termination. Please contact Gyan Kuber Pvt. Ltd. to terminate your account or for any other questions about your personal information.



Others' Information
You may decide to provide us with another person’s email address so that person may be invited to join Gyan Kuber Pvt. Ltd. or so that we may facilitate your communication with other people through the Service (such as when you upload an address book).
You may also provide us with another person’s contact information for purposes of delivering information through SNS Apps or Mobile Apps. We use this information to contact and, if necessary, remind that person that he or she has been invited to join Gyan Kuber Pvt. Ltd. or received content through an SNS App or Mobile App. All invitees are provided with the option not to receive further invitations from Gyan Kuber Pvt. Ltd. We may disclose such information if required to do so in order to comply with the legal process, as described above.





Cookies
To enhance your experience with the website, many of the web pages use “cookies” and pixel tags and clear gifts on certain pages of the website. Cookies are text files the Company places in your computer’s browser to store your preferences. Cookies, by themselves, do not tell the Company your e-mail address or other personally identifiable information unless you choose to provide this information to the Company by, for example, registering on the website. They are designed to hold a marginal amount of data specific to a particular user and website and can be accessed either by the web server or the user device. However, once you choose to furnish the website with personally identifiable information, this information may be linked to the data stored in the cookie. The Company uses cookies to understand site usage and to improve the content and offerings on the website. For example, the Company may use cookies to personalize your experience on the website (e.g., to recognize you by name when you return to the website) or save your password in password-protected areas. The Company may also use cookies to offer you products, programs, or services. Cookies may be placed on the website by third-parties as well, the use of which the Company does not control.
Session cookies are automatically deleted from your hard drive once a session ends, and most cookies are session cookies. If your browser permits, you may decline the cookies, however, if you decline the cookies, you may be unable to use certain features on the website and you may be required to re-enter your password frequently. You may opt to leave the cookie turned on.
Use Of Information
Gyan Kuber Pvt. Ltd. may contain links to other web sites, and content in Gyan Kuber Pvt. Ltd. Games, Mobile Apps and SNS Apps may be hosted by other websites. In addition, as described above, most content is offered through Gyan Kuber Pvt. Ltd. Games or SNS Apps are served or hosted by other sites. These other sites maintain their own policies regarding cookies and the collection and use of personal information. It is up to you to review those policies yourself.
 
Control Over Your Personal Information
You have the right to withdraw your consent at any point, provided such withdrawal of the consent is intimated to the Company in writing through an email at support@ludomint.com requesting the same. If you at any time wish to rectify your Personal Information, you may write to the Company. Once you withdraw your consent to share the Personal Information collected by the Company, the Company shall have the option not to fulfil the purposes for which the said Personal Information was sought and the Company may restrict you from using the services on the website and/or the website itself.
If you wish to delete your account, and thereby discontinue using the services provided by the Company on the website, you may do so at any time, in accordance with the Company terms of service and/or any other agreement that you may enter into with the Company. In other cases, you may discontinue using the services provided by the Company on the website by writing to the Company at support@ludomint.com
Rectification/Correction Of Personal Information
You shall have the right to review your Personal Information submitted by you on the website and to modify or delete any Personal Information, provided by you directly on the website. You hereby understand that any such modification or deletion may affect your ability to use the website. Further, it may affect the Company’s ability to provide its services to you.
The Company reserves the right to verify and authenticate your identity and your account Information and/or payment Information in order to ensure accurate delivery of services. Access to or correction, updating or deletion of your Personal Information may be denied or limited by the Company if it would violate another person’s rights and/or is not otherwise permitted by applicable law.
If you need to update or correct your Personal Information that the Company may have collected to offer you personalized services and offers, you may send updates and corrections to the Company at support@ludomint.com citing the reason for such rectification of Personal Information. The Company will take all reasonable efforts to incorporate the changes within a reasonable period of time.
Third-Party Advertising Companies
We use third-party advertising companies to serve ads on our site and on certain Gyan Kuber Pvt. Ltd. Games, Mobile Apps and SNS Apps. Our system and the third-party advertising technology uses information derived from Activity Information, Gyan Kuber Pvt. Ltd. ’ cookies, your visits to our site, the Gyan Kuber Pvt. Ltd. Games that you view and the SNS Apps and Mobile Apps you use to target advertising within our site, Gyan Kuber Pvt. Ltd. Games, Mobile Apps or SNS Apps. In addition, our advertisers may use other third-party advertising technology to target advertising on our site and other sites. In the course of advertisements being served to you, a unique third-party cookie or cookies may be placed on your device. Similarly, third-party advertising companies may provide us with pixel tags (also called “clear gifs” or “beacons”) to help manage and optimize our online advertising. Beacons enable us to recognize a browser’s cookie when a browser visits the site on which the beacon is located, and to learn which banner ads bring users to a given site.
Gyan Kuber Pvt. Ltd. does not provide any Personally Identifiable Information to third-party advertising companies. Note, however, that if an advertiser asks Gyan Kuber  Pvt Ltd to show an advertisement to users with certain characteristics (for example, women ages 18-24) or a segment of that group (for example, women ages 18-24 who have viewed certain categories of content) and you respond to that advertisement, the third-party advertising company may conclude that you have the characteristics of the audience that they are trying to reach.
Security
We use standard, industry-wide, commercially reasonable security practices such as encryption, firewalls and SSL (Secure Socket Layers) for protecting your information, so the protected Information and usage Information we collect is securely stored within our databases. However, it should be noted that as effective as encryption technology is, no security system is impenetrable, thus we cannot guarantee the security of our databases, nor can we guarantee that the information you supply us with won't be intercepted while being transmitted to us over the Internet or wireless communication, and that any information you transmit to Gyan Kuber you do at your own risk. If you have any questions about the security of Gyan Kuber Pvt. Ltd. website, please contact us at support@ludomint.com
 
Additional Questions
Again, feel free to contact us by sending an email to support@ludomint.com, any time, if you have further questions about Gyan Kuber Pvt. Ltd. or the Privacy Policy.
""",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.justify,
                                            )),
                                          ),

                                          // Text(
                                          //     Rules == null
                                          //         ? ""
                                          //         : Rules.toString(),
                                          //     style: GoogleFonts.robotoSlab(
                                          //         textStyle: TextStyle(
                                          //             color: Colors.white,
                                          //             fontSize: heights / 20))),
                                        ],
                                      ),
                                    )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Terms of Service',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.contact_page_sharp,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) => Dialog(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(39)),
                                    child: Container(
                                      height: heights * 0.6,
                                      width: widths * 0.8,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.yellow.shade800,
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: InkWell(
                                                child: Image.asset(
                                                    AppAsset.imagesCross,
                                                    height: heights / 20),
                                                onTap: () {
                                                  Audio.sound();
                                                  Navigator.pop(context);
                                                }),
                                          ),
                                          Center(
                                              child: Text("Terms of Service",
                                                  style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                              heights * 0.028,
                                                          color:
                                                              Colors.white))),
                                          SizedBox(
                                            height: heights / 30,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: heights / 2.5,
                                            // color: Colors.yellowAccent,
                                            child: const SingleChildScrollView(
                                                child: Text(
                                              """"This Privacy Policy covers how PG SKILL TECHNOLOGIES PRIVATE LIMITED or any of its subsidiaries or affiliates (collectively “PG SKILL TECHNOLOGIES PRIVATE LIMITED”) treats personal information that PG SKILL TECHNOLOGIES PRIVATE LIMITED collects and receives in connection with your use of www.ludomint.com and/or the games and applications offered by PG SKILL TECHNOLOGIES PRIVATE LIMITED This includes software that you have downloaded or are about to download, any software that you have embedded on a web site or are about to embed (“PG SKILL TECHNOLOGIES PRIVATE LIMITED Games”), any applications created by PG SKILL TECHNOLOGIES PRIVATE LIMITED and available through social networking sites (“SNS Apps”), any applications created by PG SKILL TECHNOLOGIES PRIVATE LIMITED and available through mobile devices (“Mobile Apps”), any software running on PG SKILL TECHNOLOGIES PRIVATE LIMITED ’ servers, (“PG SKILL TECHNOLOGIES PRIVATE LIMITED Software”), content, related documentation, information on the PG SKILL TECHNOLOGIES PRIVATE LIMITED domain, and information made available by users to each other through the PG SKILL TECHNOLOGIES PRIVATE LIMITED Software (collectively, the “Service”).

Your privacy is important to us and, as described in this Privacy Policy, we have designed the Service to protect information about you from unauthorized disclosure to others. This Privacy Policy explains how we collect, use and, in certain circumstances, share your personally identifying information. Please read this Privacy Policy carefully, and if you have any questions, feel free to contact us.

This Privacy Policy is framed in view of the Information Technology Act, 2000 read with Regulation 4 of the Information technology (Reasonable Security Practices and Procedures and Sensitive Personal Data or Information) Rules, 2011. By registering for, accessing, using, and/or downloading any Service, you agree to PG SKILL TECHNOLOGIES PRIVATE LIMITED ’ Privacy Policy and that you will abide by PG SKILL TECHNOLOGIES PRIVATE LIMITED ’ Terms of Service. Among other things, you consent to the collection and use of your personal information as outlined in this Privacy Policy, as such policy may be amended from time to time. We may update the Privacy Policy and if we do, we will post a notice that changes have been made on the website www.ludomint.com. You should visit this page periodically to review any changes to the Privacy Policy.

Types Of Information
Personal Information
Personal Information means any information that may be used to identify an individual, including, but not limited to, the first and last names, physical temporary and personal address, telephone number, date of birth, age, gender, e-mail address, or any other contact information, financial information including bank account details, credit/debit card details or such other payment information. Further, Sensitive Personal Data or Information (“SPDI”) of a person includes Personal Information about that person relating to: passwords, financial information (bank accounts, credit and debit cards or other payment instruments), physical information. The Company limits the collection of Personal Information to that which is necessary for its intended purpose.

Business Information
Business Information means any information that may be used to identify an individual’s business, including but not limited to the name and address of the entity, date of incorporation, e-mail address of the entity, contact information of the registered office, company identification number (CIN), financial information including bank account details, PAN details, names of the directors and such other information (hereinafter referred to as “Business Information”).

Non-Personal Information
Non-personal information means information that does not specifically identify an individual or business, but includes information from you, such as your browser type, the URL of the previous websites you visited, your Internet Service Provider (ISP), operating system and your Internet Protocol (IP) address. The Company may gather any non-personal information regarding how many people visit the website, the pages they visit, their IP address, and the type of browser they used while visiting the website (hereinafter referred to as “Non-Personal Information”). The Company may also collect Non-Personal Information that you voluntarily provide, such as information included in response to a questionnaire or a survey conducted by the Company.

Usage Information
Usage Information includes without limitation all data and information collected automatically through the website (or through the third party analytics service providers), by use and access of the website in the nature of system administrative data, statistical and demographic data, and operational information and data generated by or characterizing use of the website including without limitation Non-Personal Information, cookies, website traffic, time spent on the website, number of visits to the website and other similar information and behaviour indicating the mode and manner of use of the website (hereinafter referred to as the “Usage Information”). Personal Information, SPDI, Business Information, Non-Personal Information and Usage Information hereinafter shall be referred to as “Information”.

What we Collect
PG SKILL TECHNOLOGIES PRIVATE LIMITED gives you a number of options regarding what information you will give us:

When you register a profile with PG SKILL TECHNOLOGIES PRIVATE LIMITED, your profile including any information (name, address, gender) will be registered with PG SKILL TECHNOLOGIES PRIVATE LIMITED When you identify yourself on a PG SKILL TECHNOLOGIES PRIVATE LIMITED site, you may identify yourself using a PG SKILL TECHNOLOGIES PRIVATE LIMITED account. When you identify yourself on a PG SKILL TECHNOLOGIES PRIVATE LIMITED site, you may identify yourself through a social network account in which PG SKILL TECHNOLOGIES PRIVATE LIMITED may receive additional information about your profile.
In each case, we will collect and record the information you have provided. Other than names and email addresses provided at your discretion, we don’t generally collect any “Personal Information” about our users (such as social security number, street address, drivers license number, etc.), exception being for billing and payments where we store your billing information such as name, street address, phone number. We may offer you the opportunity to submit other information about yourself (such as gender, age, occupation, hobbies, interests, zip code, etc.), or we may be able to collect that information from social networking systems on which you have used PG SKILL TECHNOLOGIES PRIVATE LIMITED Games or SNS Apps (in accordance with the terms of use of those systems), which would then also be covered by this Privacy Policy.
In addition to information about yourself, you may choose to share information about yourself in other content (“Content”), such as in games. Any action you perform with other players is considered public, and at your own discretion. When you use an SNS App on your social network page or use an SNS App on someone else’s page, we may record information regarding the use of that SNS App, and we may collect other information that is visible on your social network page in accordance with the relevant terms of use associated with that page.
Note that since most PG SKILL TECHNOLOGIES PRIVATE LIMITED Software is served through SNS Apps, it is your responsibility to read and accept their Terms of Use, as well as Privacy Policy prior to continuing. When you use a Mobile App, which includes telephones and other devices such as tablets, you agree that information about your use of the Service through your mobile device and carrier may be communicated to us. This information includes, but is not limited to your carrier, device, geo-location, IP address, telephone number, country or other information you provide. With your permission, we may also access your contacts. Your carrier’s standard fees and rates will still apply, including without limitation SMS/text messaging fees, and you accept responsibility for all charges. When you invite new members into your network or send messages through the Service, we collect and maintain on secure servers the information associated with those messages, including email addresses and content.
We may use information about you that we collect from other sources, including but not limited to newspapers and Internet sources such as blogs, instant messaging services, PG SKILL TECHNOLOGIES PRIVATE LIMITED Games and other users of PG SKILL TECHNOLOGIES PRIVATE LIMITED, to supplement your profile. PG SKILL TECHNOLOGIES PRIVATE LIMITED may contain links to other websites. We are of course not responsible for the privacy practices of other web sites. We encourage our users to be aware when they leave our site to read the privacy statements of each and every web site that collects personally identifiable information. This Privacy Policy applies solely to information collected by PG SKILL TECHNOLOGIES PRIVATE LIMITED
You should also be aware that most content is delivered through PG SKILL TECHNOLOGIES PRIVATE LIMITED Games originate with another content provider. Such other content providers may place “cookies” on your browser, or otherwise gather information about you, including by asking you to provide information through the site itself.
Finally, in order to provide the best possible service and to allow us to make certain internal reports and make recommendations, we collect aggregate information about the use of the Service, including information about users accessing the PG SKILL TECHNOLOGIES PRIVATE LIMITED site, playing PG SKILL TECHNOLOGIES PRIVATE LIMITED Games, using SNS Apps on other sites or using Mobile Apps, such as internet protocol addresses, browser type, browser language, referring / exit pages and URLs, other browser history, platform type, number of clicks, domain names, landing pages, pages viewed and the order of those pages, the amount of time spent on particular pages, and the date and time (“Activity Information”).
By using the Service, you consent to our retaining all the above-described information in anonymous form as long as PG SKILL TECHNOLOGIES PRIVATE LIMITED sees fit.

Children Under The Age Of 13
PG SKILL TECHNOLOGIES PRIVATE LIMITED does not knowingly collect or solicit personal information from anyone under the age of 13 or knowingly allow such persons to register. If you are under 13, please do not attempt to register for PG SKILL TECHNOLOGIES PRIVATE LIMITED or send any information about yourself to us, including your name, address, telephone number, or email address. No one under age 13 may provide any personal information to or on PG SKILL TECHNOLOGIES PRIVATE LIMITED In the event that we learn that we have collected personal information from a child under age 13 we will delete that information as quickly as possible. If you believe that we might have any information from or about a child under 13, please contact us at support@ludomint.com.

Children Between The Ages Of 13 and 18
We recommend that minors over the age of 13 ask their parents for permission before sending any information about themselves to anyone over the Internet.

How We Use Your Information
We do not sell or rent your “Personally Identifiable Information” to any third party. We may, however, use certain information about you that is not personally identifiable. We may also use public information collected to determine the kinds of content that you would like to view and to assist any advertisers in targeting their advertising. We also use your name, email address, telephone number, and other information on our system to notify you of new product releases, service notifications, and to solicit your feedback and input. Those emails or SMS/text messages will contain links for preference management and where appropriate, an opt-out method.

With your consent, we may send push notifications to your mobile device to provide updates and relevant messages. We may also send local notifications to your mobile device. You may manage notifications from the “Settings” page of the Mobile App or through your device. The Company uses the Information you provide to (a) manage your account; (b) respond to your inquiries about its offerings and the transactions carried out on the website; (c) provide you with information about products and services available on the website and offer you other products and services that the Company believes may be of interest to you; (d) resolve any glitches on the website including addressing any technical problems; (e) improve the services and content on the website and your experience of navigating through the website and carrying out transactions on the website and; (f) manage the Company’s relationship with you.

By accepting our Privacy Policy or otherwise providing information to us, you consent to us collecting and using the information, as well as the processing and transferring of the information as deemed necessary.

You understand and agree that we may access, preserve, and disclose any information we may have about you and the contents of your account if required to do so by law or in a good faith belief that such access, preservation or disclosure is reasonably necessary to avoid liability, to comply with legal process, such as a search warrant, subpoena, statute, or court order, to protect our rights and property, or that of our affiliates or the public, or when there is a violation of our Terms of Service Agreement. PG SKILL TECHNOLOGIES PRIVATE LIMITED is not required to question or contest the validity of any search warrant, subpoena or other similar governmental request that PG SKILL TECHNOLOGIES PRIVATE LIMITED receives. PG SKILL TECHNOLOGIES PRIVATE LIMITED may maintain copies of your Content indefinitely, or delete certain Content in whole or in part if PG SKILL TECHNOLOGIES PRIVATE LIMITED determines, in its sole discretion, that such Content constitutes an infringing or a prohibited posting as set forth in our Terms of Service or for any or no reason.

We also use non-Personally Identifiable Information and certain technical information about your computer and your access to the Service (including your IP address) in order to operate, manage and maintain the Service, improve the Service and create new services. PG SKILL TECHNOLOGIES PRIVATE LIMITED may disclose information about you to its partners in order to provide the Service, resolve service problems and correct errors in the Service, to communicate with you about the Service, to provide you with advertising and promotional information in connection with the Service, and to enhance your experience on the Service. However, we do not give our partners an independent right to share this information.

Due to our contractual obligations with these third parties and the need to share information to deliver and support the Service, we cannot provide you with the opportunity to opt-out of sharing information (whether Personally Identifiable Information or other information) with these third parties. PG SKILL TECHNOLOGIES PRIVATE LIMITED, certain of its partners, and each of their contractors and employees may view the Content that you transmit to the service to provide the Service and otherwise perform the tasks set forth in this Privacy Policy.

Controlling Your Personal Information
Be advised that if you send messages or post material containing personal information, that information may be collected and used by others. You can terminate your account at any time which will remove your profile and other personal information from view. PG SKILL TECHNOLOGIES PRIVATE LIMITED, however, may (but is not obligated to) keep information about you that is on its system following your termination. Please contact PG SKILL TECHNOLOGIES PRIVATE LIMITED to terminate your account or for any other questions about your personal information.

Others' Information
You may decide to provide us with another person’s email address so that person may be invited to join PG SKILL TECHNOLOGIES PRIVATE LIMITED or so that we may facilitate your communication with other people through the Service (such as when you upload an address book). You may also provide us with another person’s contact information for purposes of delivering information through SNS Apps or Mobile Apps. We use this information to contact and, if necessary, remind that person that he or she has been invited to join PG SKILL TECHNOLOGIES PRIVATE LIMITED or received content through an SNS App or Mobile App. All invitees are provided with the option not to receive further invitations from PG SKILL TECHNOLOGIES PRIVATE LIMITED We may disclose such information if required to do so in order to comply with the legal process, as described above.

Cookies
To enhance your experience with the website, many of the web pages use “cookies” and pixel tags and clear gifts on certain pages of the website. Cookies are text files the Company places in your computer’s browser to store your preferences. Cookies, by themselves, do not tell the Company your e-mail address or other personally identifiable information unless you choose to provide this information to the Company by, for example, registering on the website. They are designed to hold a marginal amount of data specific to a particular user and website and can be accessed either by the web server or the user device. However, once you choose to furnish the website with personally identifiable information, this information may be linked to the data stored in the cookie. The Company uses cookies to understand site usage and to improve the content and offerings on the website. For example, the Company may use cookies to personalize your experience on the website (e.g., to recognize you by name when you return to the website) or save your password in password-protected areas. The Company may also use cookies to offer you products, programs, or services. Cookies may be placed on the website by third-parties as well, the use of which the Company does not control.

Session cookies are automatically deleted from your hard drive once a session ends, and most cookies are session cookies. If your browser permits, you may decline the cookies, however, if you decline the cookies, you may be unable to use certain features on the website and you may be required to re-enter your password frequently. You may opt to leave the cookie turned on.

Use Of Information
PG SKILL TECHNOLOGIES PRIVATE LIMITED may contain links to other web sites, and content in PG SKILL TECHNOLOGIES PRIVATE LIMITED Games, Mobile Apps and SNS Apps may be hosted by other websites. In addition, as described above, most content is offered through PG SKILL TECHNOLOGIES PRIVATE LIMITED Games or SNS Apps are served or hosted by other sites. These other sites maintain their own policies regarding cookies and the collection and use of personal information. It is up to you to review those policies yourself.

Control Over Your Personal Information
You have the right to withdraw your consent at any point, provided such withdrawal of the consent is intimated to the Company in writing through an email at support@ludomint.com requesting the same. If you at any time wish to rectify your Personal Information, you may write to the Company as per the above details. Once you withdraw your consent to share the Personal Information collected by the Company, the Company shall have the option not to fulfill the purposes for which the said Personal Information was sought and the Company may restrict you from using the services of the Company and notify you for the same.

Security
We use industry-standard practices to safeguard the confidentiality of your personal identifiable information, including “firewalls” and Secure Socket Layers. We treat data as an asset that must be protected against loss and unauthorized access. We employ many different security techniques to protect such data from unauthorized access by users inside and outside the company. However, “perfect security” does not exist on the Internet. Your account information and profile are password-protected, so you should use a unique and strong password, and limit access to your computer and browser by signing off after you have finished accessing your account.

Contacting the Company
If you have any questions about this Privacy Policy, the practices of the Company, or your dealings with the website, you can contact us at support@ludomint.com. Any grievances or complaints, in relation to processing of information, should be addressed in writing to the Grievance Officer. Grievance Officer shall redress the grievances expeditiously but within one month from the date of receipt of the grievance.

Your Responsibilities
You are liable and responsible for all your tasks using this site and its services. You agree to follow posted forum guidelines and code of conduct on the fan page, game, and any official Ludo Mint websites.

Your use of this website and the services is governed. The Rules of Conduct are illustrative and are not meant to be comprehensive. We reserve the right to determine what behavior might be a violation and to take proper actions as we consider necessary, including termination of your Account and exclusion from participation in the services. We reserve the right to alter the Rules of Conduct at any time to the extent that is in perspective of any remuneration or attribute by you just as well as reasonable. By accessing and using the services, you agree that you will not engage in, attempt or encourage any of the following activities:

Prohibited Activities
Cheat, or use, launch, develop, or distribute any spider, “bot,” “macro,” or other “cheat utility” software program or applications which are designed to cheat, hack, crack, interfere with, disrupt, or modify the intended operation and experience of the services
Upload, disseminate or transmit files that contain viruses, Trojan horses, worms, time bombs, spyware, adware, cancelbots, corrupted files or data, or any other similar invasive software or programs designed to damage, interrupt, destroy, or limit the functionality or disrupt the operation of the services, any software, hardware, telecommunications, networks, servers or other equipment, or other users’ computers, or that launches any unauthorized script or other software
Disrupt, attempt to, or otherwise assist in the disruption of any computer used to support the services or any other party’s uninterrupted use and enjoyment of the services
Interfere with or circumvent any security feature of the services or any feature that restricts or enforces limitations on use of or access to the services
Restrict, disturb, disrupt or inhibit any other user from using or enjoying the services, for example, by repeatedly posting the same message or excessive posts within chat rooms (“flooding”), disrupting the flow in chat rooms by hitting the return key repeatedly, inputting excessively large images so the screen goes by too fast to read, using of excessive “shouting” (all caps), or “spamming.”
No commercial use: Reproduce, transmit, sell, use or exploit the services or this site for commercial purposes that are not expressly authorized in these Terms, including use as a cyber café, computer gaming center, network play over the Internet, gaming network, or connection to an unauthorized server that emulates the game experience
Use the services or this site to advertise, market, or promote any goods, services, website, pyramid scheme, or other multi-tiered marketing scheme; solicit funds or goods; or solicit anyone to join or become a user of any other website or other organization
Post messages for any purpose other than personal communication as an individual user, including advertising or promotional messaging, chain letters, surveys, contests, chain letters, junk email, spam, other unsolicited messages, or other commercial activities
No fraudulent use: Use the services or this site for fraudulent transactions or for any purpose that violates any applicable federal, state, local, or foreign laws, regulations, ordinances or treaties
Impersonate another person or user, create a false identity, trick, defraud or mislead Ludo Mint or any users, for any purpose, including misleading others to attempt to access an Account, user name, password, persona, Virtual Currency or Virtual Goods, or any personal information about a user
Create an Account based on information that is untrue, inaccurate, not current or incomplete
Make improper use of Ludo Mint support services or submit false reports of abuse or misconduct
Disguise or mislead any person as to the source of your or other information you submit or use tools which anonymize your internet protocol address (e.g. anonymous proxy) to access the services or this site
Collect, gather, harvest (in an automated manner or otherwise), disclose, reveal or use in any manner the Account, user name, password, persona, Virtual Currency or Virtual Goods, or any personal information about another individual, including address, phone number, e-mail address, credit card number, or any information that may be used to track, contact or impersonate the individual
No unauthorized use: Host, or intercept, emulate or redirect the proprietary communication protocols used by Ludo Mint in connection with the services and this site, regardless of the method used, including protocol emulation and reverse engineering, or create derivative works of the services or this site, in whole or in part
Copy, reproduce, translate, reverse engineer, modify, disassemble, decompile, reverse assemble, or attempt to discover any software (source code or object code) related to the services and this site
Modify, impair, disrupt, alter or interfere with the use, features, functions, operation or maintenance of the services and this site, including adding unauthorized components or modifying this site or the online game experience
Use any third-party software or other means that intercepts, mines or otherwise collects information from or through this site
Frame or otherwise impose editorial comment, commercial material or any information on this site, or cover, remove, obliterate, obscure or obstruct any notice, banner, advertisement, proprietary notices or labels, or any portion of the services or this site
Remove, obscure, or alter notices of copyright, patent, trademark, or other proprietary rights affixed to any or this site
Sell, license, distribute, copy, modify, publicly perform or display, transmit, publish, edit, adapt, create derivative works from, or otherwise make unauthorized use of any
Attempt to use the services or this site on or through any service that is not controlled or authorized by Ludo Mint; and Violate these Terms, any other applicable agreement or terms governing the access or use of the services (including the terms of use of any social networking website through which the services may be accessed), or any federal, state or local, or international law, regulation, ordinance, or treaty
Purchase, sell, trade, rent, lease, license, grant a security interest in, transfer to or allow any other person to use or access your Account, password, user name, persona, Virtual Currency or Virtual Goods, whether or not in exchange for real currency or items of monetary value; or offer, advertise, market, or promote any of the foregoing
Changes to Terms of Use
We reserve the right to alter these Conditions at any moment and whatsoever. We'll try to provide you advance notice of any change in these Terms by sending a message telling you, and by posting on this website. We reserve the right to make adjustments as depending on our sole discretion. You agree to check this website for info and conditions that govern the use of this website and their services, and also to read any adjustments. Utilizing our services become effective and constitutes your acceptance of the Terms. You don't have permission to utilize the professional services if you don't consent to these Conditions and you have to immediately discontinue any use of these services.

Terminating Your Account
When we terminate your Account, you may eliminate access to your Account, password, username, character, and you'll forfeit all associated entitlements, such as those quantities of digital Money for which you haven't paid in actual cash, Virtual Goods (such as virtual vehicles, gear, factors, standings, rankings, evaluations, or some other electronic things appearing in, originating from or connected with this website).

Data Collection
You might be asked to start an Account straight by providing information regarding yourself and completing the enrollment procedure. The providers may be provided via a social networking site through to you. Information is subject to the policies of the social networking website. By utilizing or accessing a game, program, or action on this website, you could be granting the social networking site permission to talk about any other information and your email address.

We utilize this information for other functions, rules, game management and authentication, copy protection, account blocking, in addition to system. By using and accessing this website and also the services, you agree to our collection and use of your private information, including the transport of the information by Ludo Mint and its affiliates for usage, processing and storage. Within these services, Additionally, we might supply communications, such as service announcements and administrative messages to you.

Third-Party Data Collection and Use of End-User Information
When you utilize a Ludo Mint Technologies' services through a Third Party Platform--such as Facebook--you permit us to collect information. You allow us to get information contained in cookies placed on your own device from the Third Party Platform as allowed by the conditions of privacy preferences and your agreement. We can share this info as allowed by the conditions of privacy preferences and your agreement together with the Third Party Platform. We'll share some of this information we gather with sellers and service providers working with us to encourage the operations of our cellular program from you. By way of instance, we utilize a service to also help us organize mobile and website application analytics and advertising tracking.

Our third party advertisement tracking and analytics firm never sends notifications mails, or other messages. If you'd like to opt from analytics and advertisement tracking, please see here. Your decision doesn't restrict our capability to collect information for sellers, subject to the conditions of the privacy policy or to email you."""
                                              "",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.justify,
                                            )),
                                          ),

                                          // Text(
                                          //     Rules == null
                                          //         ? ""
                                          //         : Rules.toString(),
                                          //     style: GoogleFonts.robotoSlab(
                                          //         textStyle: TextStyle(
                                          //             color: Colors.white,
                                          //             fontSize: heights / 20))),
                                        ],
                                      ),
                                    )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Refund Policy',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.contact_page_sharp,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) => Dialog(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(39)),
                                    child: Container(
                                      height: heights * 0.6,
                                      width: widths * 0.8,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.yellow.shade800,
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: InkWell(
                                                child: Image.asset(
                                                    AppAsset.imagesCross,
                                                    height: heights / 20),
                                                onTap: () {
                                                  Audio.sound();
                                                  Navigator.pop(context);
                                                }),
                                          ),
                                          Center(
                                              child: Text("Refund Policy",
                                                  style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                              heights * 0.028,
                                                          color:
                                                              Colors.white))),
                                          SizedBox(
                                            height: heights / 30,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            height: heights / 2.5,
                                            // color: Colors.yellowAccent,
                                            child: const SingleChildScrollView(
                                                child: Text(
                                              """In app purchases and payments
You may be required to pay for certain services, including an exchange for Virtual Currency, a purchase of Virtual Goods, and upgrades. You must have a valid Account to pay for and participate in these services. You are responsible for all charges and usage on your Account, including applicable taxes, including all purchases made by you or anyone that uses your Account.

 You may pay using the methods available for the particular services, including credit card, debit card, PayPal, or other similar payment accounts, and you agree to the terms and conditions applicable to each payment method you choose. When you provide credit card or other payment information, you represent that you are the authorized user of the credit card or other payment method. You must provide current, complete, and accurate information for your billing account. You must promptly update all information to keep your billing account current, complete, and accurate (such as a change in billing address, credit card number, or credit card expiration date), and you must promptly notify us if your credit card is canceled, lost or stolen. We may use a third party credit card updating service to obtain current expiration dates on credit cards provided by you. Customers who use a payment method other than credit card may incur an additional payment processing fee. \n\n
No Refund policy
In-app purchases are not refundable. Gyan Kuber follows no-refund policy for all in-app purchases.
""",
                                              style: TextStyle(
                                                  color: Colors.white),
                                              textAlign: TextAlign.justify,
                                            )),
                                          ),
                                        ],
                                      ),
                                    )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Gamer Rules',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.020, color: Colors.white)),
                      Container(
                        height: heights / 20,
                        width: widths / 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.rule_folder,
                            size: 17,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Audio.sound();
                            showDialog(
                                context: context,
                                builder: (ctx) => Dialog(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(39)),
                                    child: Container(
                                      height: heights * 0.6,
                                      width: widths * 0.8,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.yellow.shade800,
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                                child: InkWell(
                                                    child: Image.asset(
                                                        AppAsset.imagesCross,
                                                        height: heights / 20),
                                                    onTap: () {
                                                      Audio.sound();
                                                      Navigator.pop(context);
                                                    })),
                                          ),
                                          Center(
                                              child: Text("RULES",
                                                  style:
                                                      RighteousMedium.copyWith(
                                                          fontSize:
                                                              heights * 0.028,
                                                          color:
                                                              Colors.white))),
                                          SizedBox(
                                            height: heights / 30,
                                          ),
                                          Container(
                                            height: heights / 2.5,
                                            // color: Colors.yellowAccent,
                                            child: SingleChildScrollView(
                                              child: HtmlWidget(
                                                Rules == null
                                                    ? "pg-dghp[,h["
                                                    : Rules.toString(),
                                              ),
                                            ),
                                          ),

                                          // Text(
                                          //     Rules == null
                                          //         ? ""
                                          //         : Rules.toString(),
                                          //     style: GoogleFonts.robotoSlab(
                                          //         textStyle: TextStyle(
                                          //             color: Colors.white,
                                          //             fontSize: heights / 20))),
                                        ],
                                      ),
                                    )));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heights * 0.01,
              ),
              // Container(
              //   width: widths / 1.6,
              //   height: heights / 15,
              //   decoration: BoxDecoration(
              //       color: const Color(0xff010a40).withOpacity(0.9),
              //       border: Border.all(color: Colors.white, width: 2),
              //       borderRadius: BorderRadius.circular(10)),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 5),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text('Change Password',
              //             style: RighteousMedium.copyWith(
              //                 fontSize: heights * 0.019, color: Colors.white)),
              //         InkWell(
              //             onTap: () {
              //               Audio.sound();
              //               showDialog(
              //                   context: context,
              //                   builder: (context) => const Mypassword());
              //             },
              //             child: Container(
              //               height: heights / 20,
              //               width: widths / 10,
              //               decoration: BoxDecoration(
              //                   color: Colors.green,
              //                   border:
              //                       Border.all(color: Colors.yellow, width: 2),
              //                   borderRadius: BorderRadius.circular(10)),
              //               child: const Icon(Icons.remove_red_eye,
              //                   size: 17, color: Colors.white),
              //             ))
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: heights * 0.01,
              // ),
              Container(
                width: widths / 1.6,
                height: heights / 15,
                decoration: BoxDecoration(
                    color: const Color(0xff010a40).withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Logout',
                          style: RighteousMedium.copyWith(
                              fontSize: heights * 0.019, color: Colors.white)),
                      InkWell(
                        onTap: () {
                          Audio.sound();
                          showDialog(
                              context: context,
                              builder: (context) => const Mylogout());
                        },
                        child: Container(
                          height: heights / 20,
                          width: widths / 10,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              border:
                                  Border.all(color: Colors.yellow, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.logout_outlined,
                              size: 17, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String referalCode = 'initialData';
Future<void> share() async {
  await FlutterShare.share(
      title: 'Referral Code :',
      text: 'Join Now & Get Exiting Prizes. here is my Referral Code : ',
      linkUrl: "",
      chooserTitle: 'Referrel Code : ');
}
