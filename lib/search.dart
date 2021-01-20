import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:ombre_clone_flutter/event_class.dart';
import 'package:ombre_clone_flutter/search_button.dart';
import 'package:ombre_clone_flutter/user_class.dart';
import 'package:ombre_clone_flutter/cards.dart';

class SearchRoute extends StatefulWidget {
  SearchRouteState createState() => SearchRouteState();
}

class SearchRouteState extends State<SearchRoute> {
  String eventName = "";
  var event_map = {'null':[]};
  final _firestore = Firestore.instance;
  void get_events() async{
    await for(var snapshot in _firestore.collection('events').snapshots()) {
      for (var event in snapshot.documents) {
        String name = event.data['EventName'];
        String imageUrl = event.data['ImageUrl'];
        String category = event.data['Category'];
        String copy = name;
        print(copy);
        name = name.toLowerCase();
        event_class cur_event = event_class(true, copy, imageUrl, category);

        String key = "";
        for(int i=0;i<name.length;i++) {
          key += name[i];
          if(event_map.containsKey(key)) {
            event_map[key].add(cur_event);
          } else {
            event_map[key] = [];
            event_map[key].add(cur_event);
          }
        }
      }
    }
  }

  void get_users() async {
    await for(var snapshot in _firestore.collection('users').snapshots()) {
      for (var user in snapshot.documents) {
        String name = user.data['username'];
        print(name);
        String actualname = user.data['actual_name'];
        String description = user.data['description'];
        String imageUrl = user.data['imageUrl'];
        String copy = name;
        name = name.toLowerCase();
        user_class usr = user_class(false, copy, actualname, description, imageUrl);

        String key = "";
        for(int i=0;i<name.length;i++) {
          key += name[i];
          if(event_map.containsKey(key)) {
            event_map[key].add(usr);
          } else {
            event_map[key] = [];
            event_map[key].add(usr);
          }
        }
      }
    }
  }

  int getItemCount() {
    if(event_map.containsKey(eventName)) {
      return event_map[eventName].length;
    }
    return 0;
  }

  bool renderEmptyText() {
    if(eventName.length == 0) return false;
    if(event_map.containsKey(eventName)) return false;
    return true;
  }

  @override
  void initState() {
    event_map.clear();
    get_events();
    get_users();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF111522),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.175,
            child: SafeArea(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF000000),
                              blurRadius: 20,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            fillColor: Color(0xFF263240),
                            hintText: 'Search for events, artists, or fans',

                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13.0),
                          ),
                          onChanged: (value){
                            setState(() {
                              eventName = value.toLowerCase();
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: RoundIconButton(Icons.search, () {
                        get_events();
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          (renderEmptyText() == true) ? Expanded(child: Center(child:Text('No Results Found'))) :
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: getItemCount(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top:0.0,left: 16.0,right: 8.0, bottom: 6.0),
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: (event_map[eventName][index].identifier == true) ? DisplayEvent(event_map[eventName][index]) :
                    DisplayUser(event_map[eventName][index])
                );
              },
            ),
          )
        ],
      ),
    );
  }
}