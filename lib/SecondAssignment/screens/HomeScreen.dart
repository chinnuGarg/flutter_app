import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/SecondAssignment/models/Country.dart';
import 'package:flutter_app/SecondAssignment/models/Favourite.dart';
import 'package:flutter_app/SecondAssignment/models/PaymentType.dart';
import 'package:flutter_app/utils/Strings.dart';
import 'package:flutter_app/utils/Utils.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  List<CountryList> countryList = [];

  List<FavouriteList> favouriteList = [];

  List<PaymentTypes> paymentList = [];
  var selectedVal;

  @override
  void initState() {
    super.initState();
    getListData();
  }

  void getListData() {
    getCountryData("assets/json/countryList.json");
    getFavouriteData("assets/json/favouritePeople.json");
    getPaymentTypeData("assets/json/paymentType.json");
  }

  void getCountryData(String fileName) async {
    final String response = await rootBundle.loadString(fileName);
    final data = await json.decode(response);
    countryList = Country.fromJson(data).data;
    print(countryList.length);
  }

  void getFavouriteData(String fileName) async {
    final String response = await rootBundle.loadString(fileName);
    final data = await json.decode(response);
    favouriteList = Favourite.fromJson(data).data;
    print(favouriteList.length);
  }

  void getPaymentTypeData(String fileName) async {
    final String response = await rootBundle.loadString(fileName);
    final data = await json.decode(response);
    paymentList = PaymentType.fromJson(data).data;
    print(paymentList.length);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            Strings.hi,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: false,
          leadingWidth: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Utils.showToast(Strings.notificationClicked);
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ))
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: const Text(
                    "1234.00",
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                  DropdownButton(
                    dropdownColor: Colors.white,
                    underline: SizedBox(),
                    value: selectedVal,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black54,
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedVal = value;
                        print(selectedVal);
                      });
                    },
                    items: countryList.map((country) {
                      print(country);
                      return DropdownMenuItem(
                        value: country,
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                country.flag,
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Text(
                              country.title,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: const Text("Here are some things you can do",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.normal)),
                  ),
                  SizedBox(height: 24),
                  PaymentTypeOption(paymentList: paymentList),
                  const Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text("Your Favourites people",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.normal)),
                  ),
                  FavouritePeople(favouriteList: favouriteList)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FavouritePeople extends StatelessWidget {
  const FavouritePeople({
    required this.favouriteList,
  });

  final List<FavouriteList> favouriteList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: SizedBox(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favouriteList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            // The profile image
                            (index > 0)
                                ? CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                        favouriteList[index].image),
                                  )
                                : Icon(
                                    Icons.add,
                                    size: 76,
                                  ),
                            // The badge
                            (index > 0)
                                ? Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundImage: NetworkImage(
                                          favouriteList[index].flag),
                                    ),
                                  )
                                : Text(""),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Text(favouriteList[index].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal)),
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}

class PaymentTypeOption extends StatelessWidget {
  const PaymentTypeOption({
    required this.paymentList,
  });

  final List<PaymentTypes> paymentList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: GridView.count(
          padding: const EdgeInsets.only(top: 20),
          scrollDirection: Axis.horizontal,
          crossAxisCount: 2,
          crossAxisSpacing: 22,
          childAspectRatio: 1.1,
          mainAxisSpacing: 15,
          children: List.generate(paymentList.length, (index) {
            print(paymentList.first);
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(int.parse(paymentList[index].bgcolor)),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.arrow_back),
                  Text(paymentList[index].title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                  Text(paymentList[index].description,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.normal)),
                ],
              ),
            );
          })),
    );
  }
}
