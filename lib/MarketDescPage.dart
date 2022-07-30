import 'package:flutter/material.dart';
import 'package:flutter_application_1/image_data.dart';

class MarketDescPage extends StatefulWidget {
  const MarketDescPage({Key? key}) : super(key: key);

  @override
  State<MarketDescPage> createState() => _MarketDescPageState();
}

class _MarketDescPageState extends State<MarketDescPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            height: 380,
            decoration: BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.rectangle,
            ),
            child: Image.network(
              'http://124.53.149.174:3000/images/cafe_2.png',
              fit: BoxFit.fill,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '궤도연남',
                style: TextStyle(fontSize: 40),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(IconsPath.homeOff))),
                    ),
                    Text('4.5'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '나무 본연의 훈연향을 느낄 수 있는 우드파이어 레스토랑\n#연남동 #샐러드 #브런치 #핸드드립 #신상카페',
                style: TextStyle(fontSize: 15),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(IconsPath.homeOff))),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            width: Size.infinite.width,
            child: TabBar(
              controller: tabController,
              tabs: [
                Text('정보', style: TextStyle(color: Colors.black, fontSize: 17)),
                Text('메뉴', style: TextStyle(color: Colors.black, fontSize: 17)),
                Text('사진', style: TextStyle(color: Colors.black, fontSize: 17)),
                Text('리뷰', style: TextStyle(color: Colors.black, fontSize: 17)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
