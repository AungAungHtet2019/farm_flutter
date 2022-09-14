import 'package:farm_flutter/Screens/Signup/signup_screen.dart';
import 'package:farm_flutter/Screens/Welcome/welcome_screen.dart';
import 'package:farm_flutter/feedui/first.dart';
import 'package:farm_flutter/feedui/fivth.dart';
import 'package:farm_flutter/feedui/fourth.dart';
import 'package:farm_flutter/feedui/second.dart';
import 'package:farm_flutter/feedui/sixth.dart';
import 'package:farm_flutter/feedui/third.dart';
import 'package:farm_flutter/view/news_page.dart';
import 'package:farm_flutter/view/profile_page.dart';
// import 'package:farm_flutter/view/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _currentIndex = 0;

  final ScrollController scrollcontroller = new ScrollController();

  bool scroll_visibility = true;

  @override
  void initState() {
    // TODO: implement initState

    scrollcontroller.addListener(() {
      if(scrollcontroller.position.pixels > 0 || scrollcontroller.position.pixels < scrollcontroller.position.maxScrollExtent)
        scroll_visibility = false;
      else
        scroll_visibility = true;

      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        // _currentIndex == 4 ? WelcomeScreen():
        _currentIndex == 1 ? NewsPage():_currentIndex == 3 ? ProfilePage():_currentIndex ==4 ? SignUpScreen(): SingleChildScrollView(
          child: Column(
            children: [


              SizedBox(
                height: 35,
              ),
              Visibility(
                visible: scroll_visibility,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Image.asset(
                            // 'assets/images/logo.png',
                            'assets/images/farm_logo.jpg',
                            height: 60,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6, left: 15.0),
                          child: Text(
                            'Farm Network',
                            style: GoogleFonts.lato(
                                color: Colors.grey[700],
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // var route = new MaterialPageRoute(
                        //   builder: (BuildContext context) => new Connections(),
                        // );

                        // Navigator.of(context).push(route);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0, top: 4),
                        child: Icon(Icons.link),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Image.asset(
              //   'images/first.png',
              //   height: 300,
              // ),
              // Container(color: Colors.white, height: 120, child: Status()),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15),
                child: Divider(),
              ),
              SizedBox(
                height: 10,
              ),
              // FirstFeedUI(),
              // SizedBox(
              //   height: 10,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 18.0, right: 18),
              //   child: Divider(),
              // ),
              // SizedBox(
              //   height: 0,
              // ),
              // SecondFeedUI(),
              // SizedBox(
              //   height: 10,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 18.0, right: 18),
              //   child: Divider(),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // ThirdFeedUI(),
              // SizedBox(
              //   height: 20,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 18.0, right: 18),
              //   child: Divider(),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              FivthFeedUI(
                  'https://www.westernunion.com/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png',
                  'Sound Byte',
                  'Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.',
                  'https://cloudfront-us-east-2.images.arcpublishing.com/reuters/4YJSBO3FOBLWZOBLAIHII2SXSA.jpg'
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Divider(),
              ),
              SizedBox(
                height: 10,
              ),
              FivthFeedUI(
                  'https://dl.memuplay.com/new_market/img/com.vicman.newprofilepic.icon.2022-06-07-21-33-07.png',
                  'Sound Byte',
                  'မြန်မာနိုင်ငံသည် သမိုင်းကြောင်းအရ လယ်ယာစိုက်ပျိုးရေး ကိုအခြေခံသည့် နိုင်ငံဖြစ်ရာ တိုင်းပြည်၏ စီးပွားရေး ထုတ်ကုန် အများစုမှာ လယ်ယာစိုက်ပျိုးရေး ကဏ္႑မှ ဖြစ်သည်။ ၂၀၀၃ ခုနှစ် မြန်မာစိုက်ပျိုးရေး သန််းခေါင်စာရင်း ၏ ဖေါ်ပြချက် အရ မြန််မာနိုင်ငံတွင် လယ်ယာ လုပ်ကိုင်သူ မိသားစု ၃.၄၆ သန်း ရှိပြီး လယ်ယာမြေ ၈.၇ သန််း ဟတ်တာ ပေါ်တွင် စိုက်ပျိုး လုပ်ကိုင်လျှက်ရှိကြောင်း သိရသည်။မြန်မာနိုင်ငံရှိ လယ်ယာစိုက်ပျိုးရေး လုပ်ငန်း လုပ်ကိုင်သူ အလုပ်သမား တစ်ဦး၏ တစ်နှစ် ၀င်ငွေမှာ ၂၀၁၂ ခုနှစ်တွင် ခန့်မှန်းခြေ အမေရိကန် ဒေါ်လာ ၁၉၄ သာ ရရှိပြီး မလေးရှား နိုင်ငံတွင် ၆၆၈၀ ဒေါ်လာ နှင့် ထိုင်းနိုင်ငံ တွင် ၇၀၆ ဒေါ်လာ ရရှိ ကြောင်း တွေ့ရသည်။11မြန်မာနိုင်ငံ၏ လယ်ယာလုပ်ငန်းစနစ်များမှာ အမျိုးမျိုးအထွေထွေ ရှိနေပြီး မုတ်သုန်ရာသီ အတော အတွင်းတွင် ရာသီဥတု စိုထိုင်းဆမြင့်မားသဖြင့် လယ်ယာအများစုမှာ စပါး ထုတ်လုပ်ကြပြီး အေးမြ ခြောက်သွေ့သော ရာသီများတွင် စပါး မဟုတ်သော အခြားသီးနှံများ- အဓိက အားဖြင့် ပဲအမျိုးမျိုး၊ ဆီထွက် သီးနှံနှင့် ပြောင်းစသည့် သီးနှံများ ကို အများစု စိုက်ပျိုး ထုတ်လုပ်ကြပါသည်။',
                  'https://merriam-webster.com/assets/mw/images/article/art-wap-landing-mp-lg/meanwhile-2453-cc63cdb89c527209296a3ec7ffd9ee59@1x.jpg'
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Divider(),
              ),
              SizedBox(
                height: 10,
              ),
              FivthFeedUI(
                  'https://www.westernunion.com/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png',
                  'Sound Byte',
                  'Was great meeting up with Anna Ferguson and Dave Bishop at the breakfast talk!',
                  'https://hbr.org/resources/images/article_assets/2021/08/Sep21_02_1176415931.jpg'
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Divider(),
              ),
              SizedBox(
                height: 10,
              ),
              FivthFeedUI(
                  'https://www.westernunion.com/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png',
                  'Sound Byte',
                  'Was great meeting up with Anna Ferguson and Dave Bishop at the breakfast talk!',
                  'https://www.travelwisconsin.com/uploads/blog/e2/e2ccbd6f-1070-4272-889b-cc7720bd664d-farm-scene-with-cows.jpg'
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Divider(),
              ),
              SizedBox(
                height: 10,
              ),
              FivthFeedUI(
                  'https://www.westernunion.com/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png',
                  'Sound Byte',
                  'Was great meeting up with Anna Ferguson and Dave Bishop at the breakfast talk!',
                  'https://ichef.bbci.co.uk/news/976/cpsprodpb/6D8F/production/_124774082_combine_gettyimages-129215813.jpg'
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Divider(),
              ),
              SizedBox(
                height: 10,
              ),
              FivthFeedUI(
                  'https://www.westernunion.com/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png',
                  'Sound Byte',
                  'Was great meeting up with Anna Ferguson and Dave Bishop at the breakfast talk!',
                  'https://www.rappler.com/tachyon/2021/11/china-vegetables-farm-february-9-2020-reuters.jpg'
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Divider(),
              ),
              SizedBox(
                height: 10,
              ),
              FivthFeedUI(
                  'https://www.westernunion.com/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png',
                  'Sound Byte',
                  'Was great meeting up with Anna Ferguson and Dave Bishop at the breakfast talk!',
                  'https://www.bordbia.ie/globalassets/bordbia2020/food-and-living/farmhouse-cheese/cheesemakers/ballyhubbock-farm/ballyhubbock-farm.jpeg'
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Divider(),
              ),
              SizedBox(
                height: 10,
              ),
              FivthFeedUI(
                  'https://www.westernunion.com/content/dam/wu/jm/responsive/send-money-in-person-from-jamaica-resp.png',
                  'Sound Byte',
                  'Was great meeting up with Anna Ferguson and Dave Bishop at the breakfast talk!',
                  'https://touroldham.com/wp-content/uploads/2021/02/foodie-farm-tours-header.jpg'
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Divider(),
              ),
              SizedBox(
                height: 10,
              ),
              // FourthFeedUI(),
              // SizedBox(
              //   height: 10,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 18.0, right: 18),
              //   child: Divider(),
              // ),

              // SixthFeedUI(),
            ],
          ),
        ),
        // ProfilePage(),


      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          /// News
          SalomonBottomBarItem(
            icon: Icon(Icons.assignment),
            title: Text("News"),
            selectedColor: Colors.purple,
          ),
          // /// Likes
          // SalomonBottomBarItem(
          //   icon: Icon(Icons.favorite_border),
          //   title: Text("Likes"),
          //   selectedColor: Colors.pink,
          // ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),

          /// More
          SalomonBottomBarItem(
            icon: Icon(Icons.menu),
            title: Text("More"),
            selectedColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
