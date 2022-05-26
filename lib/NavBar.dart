import 'package:flutter/material.dart';
import 'package:pomodoro/main.dart';

import 'DeadlinePage.dart';
import 'TimerPage.dart';

class NavBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
     child:Material(  
      child: ListView(
        children:<Widget>[
          UserAccountsDrawerHeader(
          accountName: Text('Lyft'), 
          accountEmail: Text('LyftCodLab@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child:ClipOval(
              child:Image.network('https://github.com/Dauka12/CodingLabPortfolio/blob/main/pomodoro-Logo.png?raw=true',
              width:90,
              height:90
              ),
            ),
          ),
         ),
        
         buildMenuItem(
           text:'Deadline',
           icon: Icons.check_circle_outline,  
           onClicked: () => selectedItem(context,0),
         ),

          buildMenuItem(
           text:'Timer',
           icon: Icons.timer,  
           onClicked: () => selectedItem(context,1),
         ),
         
          buildMenuItem(
           text:'Pomodoro technique training',
           icon: Icons.model_training,  
           onClicked: () => selectedItem(context,2),
         ),
       ],
      ),
     ),
   );
}
 
  buildMenuItem({required String text, required IconData icon, VoidCallback? onClicked}) {
    return ListTile(
           leading: Icon(icon),
           title: Text(text),
           onTap: onClicked,
    );
  }
  
  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch(index){
      case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => DeadlinePage(),
        ));

      break;
      case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TimerPage(),
        ));

      break;
       case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Pomodoro(),
        ));

      break;

    }
  }
}