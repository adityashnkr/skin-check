import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorsList extends StatefulWidget {
  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(backgroundColor:Colors.amber,title: Text('Doctors'),),
      body: Column(
        children: [
          RaisedButton(onPressed:  (){Navigator.pushNamed(context,'Chats',);},child: Text('Talk To Expert'),),

          SizedBox(height: 20,),
          Container(height: MediaQuery.of(context).size.height-200,
            child: ListView.builder(itemBuilder: (BuildContext context,int index){
              return ExpansionTile(
                  leading: Icon(Icons.manage_accounts_rounded),
                  title:Text("Doctor ${index+1}"),
               children: [
                 Row(children: [
                   Icon(Icons.phone),
                   SizedBox(width: 10,),
                   Text('+11204423233')
                 ],),
                 SizedBox(height: 10,),
                 Row(children: [
                   Icon(Icons.location_on_sharp),
                   SizedBox(width: 10,),
                   Text('2720  Little Street,Akron')
                 ],),
               ],
              );
            },itemCount: 5,),
          )
        ],
      ),
    ));
  }
}
