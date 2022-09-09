import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/images.dart';
import 'package:weather_app/controller/home_controller.dart';
import 'package:weather_app/widgets/mychart.dart';
import 'package:weather_app/widgets/mylist.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black38, BlendMode.darken),
                    image: AssetImage(
                      'assets/images/cloud-in-blue-sky.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(120),
                      child: Container(
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          // leading: IconButton(
                          //   icon: Icon(
                          //     Icons.menu,
                          //     color: Colors.white,
                          //   ),
                          //   onPressed: () {},
                          // ),
                        ),
                      ),
                    ),

                    //TODO
                    Container(



                      padding: EdgeInsets.only(top: 35, left: 20, right: 20),
                      child: TextField(
                        onChanged: (value) => controller.city = value,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => controller.updateWeather(),
                        decoration: InputDecoration(
                          suffix: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: 'Search'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Align(
                        alignment: Alignment(0.0, 1.0),
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: OverflowBox(
                            minWidth: 0.0,
                            maxWidth: MediaQuery.of(context).size.width,
                            minHeight: 0.0,
                            maxHeight: (600),
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 300),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15),
                                    width: double.infinity,

                                    child: Card(
                                      color: Colors.white,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          //TODO
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 15, left: 20, right: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Center(
                                                  child: Text(
                                                    '${controller.currentWeatherData.name}'
                                                        .toUpperCase(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                          color: Colors.black45,
                                                          fontSize: 24,
                                                          fontWeight: FontWeight.bold,
                                                          fontFamily: 'flutterfonts',
                                                        ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    DateFormat()
                                                        .add_MMMMEEEEd()
                                                        .format(DateTime.now()),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                          color: Colors.black45,
                                                          fontSize: 16,
                                                          fontFamily: 'flutterfonts',
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.only(left: 50,top: 15),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      '${controller.currentWeatherData.weather![0].description!}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(
                                                            color: Colors.black45,
                                                            fontSize: 22,
                                                            fontFamily:
                                                                'flutterfonts',
                                                          ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline2!
                                                          .copyWith(
                                                              color: Colors.black45,
                                                              fontFamily:
                                                                  'flutterfonts'),
                                                    ),
                                                    Text(
                                                      'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .caption!
                                                          .copyWith(
                                                            color: Colors.black45,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'flutterfonts',
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(right: 20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      width: 120,
                                                      height: 120,
                                                      child: LottieBuilder.asset(
                                                          Images.cloudyAnim),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .caption!
                                                            .copyWith(
                                                              color: Colors.black45,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontFamily:
                                                                  'flutterfonts',
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: EdgeInsets.only(top: 100),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'other city'.toUpperCase(),
                                style:
                                    Theme.of(context).textTheme.caption!.copyWith(
                                          fontSize: 16,
                                          fontFamily: 'flutterfonts',
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold,
                                        ),
                              ),
                            ),
                            MyList(),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'forcast next 5 days'.toUpperCase(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45,
                                        ),
                                  ),
                                  Icon(
                                    Icons.next_plan_outlined,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
                            ),
                            MyChart(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
