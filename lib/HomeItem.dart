import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/Model/Section.dart';

typedef void HomeItemPress(Section type);

class HomeItem extends StatefulWidget {
  final Section section;
  final HomeItemPress press;

  HomeItem(this.section, this.press);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeItemState(this.section, this.press);
  }
}

class HomeItemState extends State<HomeItem> {
  Section section;
  HomeItemPress press;
  String priceTxt = null;

  void state(timer) {
    setState(() {
      //this.section.countDown += 1;
    });
  }

  HomeItemState(Section section, HomeItemPress press) {
    this.press = press;
    this.section = section;
    this.priceTxt = null;
    Timer.periodic(Duration(seconds: 1), this.state);
  }

  addtionalPrice(){
    if(priceTxt != null){
      var intValue  = int.parse(this.priceTxt) ?? 0;
      section.additionPrice += intValue;

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: section.backgroundColor(),
        padding: EdgeInsets.all(8),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("${this.section.title()}"),
                  Text("Price : ${this.section.calculateBusyTime() * 50 + section.additionPrice}T"),
                  RaisedButton(
                    child: Text(this.section.isBusy ? "Stop" : "Start"),
                    onPressed: () {
                      this.press(this.section);
                    },
                  )
                ],
              ),



                    TextField(onChanged: (text){
                      this.priceTxt = text;
                    },textAlign: TextAlign.center ,keyboardType: TextInputType.numberWithOptions(decimal: false,),),
                    RaisedButton(
                      child: Text("Add Price"),
                      onPressed: () {
                        this.addtionalPrice();
                      },
                    )
                  ],



          ),
        ));
    ;
  }
}
