import 'package:flutter/material.dart';
import 'package:pomodoro/NavBar.dart';
import 'package:pomodoro/model/list_item.dart';
import 'package:pomodoro/data/list_items.dart';
import 'package:pomodoro/widget/list_item_widget.dart';

  

class DeadlinePage extends StatefulWidget {
  const DeadlinePage({Key? key}) : super(key: key);

  @override
  State<DeadlinePage> createState() => _DeadlinePageState();
}

class _DeadlinePageState extends State<DeadlinePage> {
  final listKey = GlobalKey<AnimatedListState>();
  final List <ListItem> items = List.from(listItems);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 93, 177, 247),
      drawer: NavBar(),
      appBar: AppBar(
      
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: Text('Deadline', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: AnimatedList(
        key:listKey,
        initialItemCount: items.length,
        itemBuilder: (context,index,animation)=>ListItemWidget(
          item: items[index],
          animation:animation,
          onClicked:()=> removeItem(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.add),
        onPressed: insertItem,
      ),
    );
    
  }
  void insertItem(){
    final newIndex = 1;
    final newItem = (List.of(listItems)..shuffle()).first;
    items.insert(newIndex, newItem);

    listKey.currentState!.insertItem(
      newIndex,
      duration: Duration(milliseconds: 600));
  }
  void removeItem(int index){
    final removedItem = items[index];
    items.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => ListItemWidget(item: removedItem, animation: animation, onClicked: (){}),
      duration: Duration(milliseconds: 600),
      );
  }
}
