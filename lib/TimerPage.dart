import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/NavBar.dart';
import 'package:pomodoro/main.dart';

class TimerPage extends StatefulWidget{
  @override
  _TimerPageState createState() => _TimerPageState();
}
class _TimerPageState extends State<TimerPage>{
  static const countDownDuration = Duration(minutes:10);
  Duration duration = Duration();
  Timer? timer;
  bool isCountdown = true;

  
  @override
  void initState(){
    super.initState();

    startTimer();
    reset();
  }
   void reset() {
     if(isCountdown){
     setState(()=>duration = countDownDuration);}
     else{
       setState(() =>duration = Duration() );
     }
   }
  void addTime(){
    final addSeconds = isCountdown ? -1: 1;
    setState(() {
      final seconds = duration.inSeconds+addSeconds;
        if(seconds<0){
        timer?.cancel();

      duration = Duration(seconds: seconds);}
      else{
        duration = Duration(seconds: seconds);
      }
    });
  }
  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1),(_)=>addTime());
  }
  @override
  Widget build(BuildContext context)=>Scaffold(
    body:Center(child:buildTime()),
    drawer: NavBar(),
    appBar: AppBar(
      title: Text('Timer'),
      centerTitle: true,
    ),

  ); 
  Widget buildTime(){
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTimeCard(time: hours, header:'HOURS'),
        const SizedBox(width: 8),
        buildTimeCard(time: minutes, header:'MINUTES'),
        const SizedBox(width: 8),
        buildTimeCard(time: seconds, header:'SECONDS'),
      ],
    );
  }
  
  Widget buildTimeCard({required String time, required String header}) => 
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
  Container(
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
    time,
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    fontSize: 72,

      ),
     ),
    ),
    const SizedBox(height: 24),
    Text(header),
   ]
  );
  
 
}
