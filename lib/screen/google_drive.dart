import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:google_drive_proj/Constants/constants.dart';
import 'package:google_drive_proj/model/dropbox.dart';
import 'package:google_drive_proj/model/lastfile_list.dart';
import 'package:google_drive_proj/screen/second_page.dart';
import 'package:google_drive_proj/widget/circular_progress_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GoogleDrive extends StatefulWidget {
  // double percent = 0.0;
  @override
  _GoogleDriveState createState() => _GoogleDriveState();
}

class _GoogleDriveState extends State<GoogleDrive> {

  double _height;
  double _width;

  int _selectIndex;

  double percent = 0.0;

  bool progressLoader=false;

  bool checkActiveProgress=false;


  List<DropBox>dropBox;
  List<LastFile>lastFile;

  @override
  void initState() {
    dropBox=Constants.getDropBox();
    lastFile=Constants.getLastFile();

    Timer timer;
    timer = Timer.periodic(Duration(milliseconds:20),(_){
      print('Percent Update');

      setState(() {
        percent+=5;
        if(percent >= 100){
          timer.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height=MediaQuery.of(context).size.height;
    _width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.blue[700],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:Colors.white,
        leading:Container(
          margin:EdgeInsets.all(5),
          height:_height/25,
          width:_width/25,
          // alignment: Alignment.centerRight,
          child:Image.asset('assets/images/dots_circle-cropped.png'),
        ),

        actions: <Widget>[
          Container(
            // alignment: Alignment.centerRight,
            margin:EdgeInsets.only(bottom:2,top: 2.0,right:10.0,left:10),
            height: _height/16,
            width: _width/7,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5.0,
              color: Colors.white,
              child: Icon(Icons.notification_important,size:20.0,color:Colors.black,),
            ),
          ),
        ],

      ),
      body:SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child:Container(
          height:_height,
          child:Column(
            children: <Widget>[
              Container(
                height: _height/2.5,
                width: _width,

                decoration:BoxDecoration(
                  borderRadius:BorderRadius.only(bottomLeft:Radius.circular(25.0),bottomRight:Radius.circular(25.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading:Container(
                        //color: Colors.cyanAccent,
                        // alignment: Alignment.centerRight,
                        height: _height/16,
                        width: _width/8,

                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(10.0),
                          child: Image.asset('assets/images/female_above40.jpg'),
                        ),
                      ),
                      title: Text('Hello,',style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.w600),),

                      subtitle: Text('Ruth Black',style: TextStyle(color: Colors.black,fontSize:18.0,fontWeight: FontWeight.bold),),
                    ),

                    Container(
                      // margin: EdgeInsets.only(top:0.0),
                      width: _width,
                      height: _height/4,
                      child: ListView.builder(
                          itemCount: dropBox.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildDropBox(dropBox[index]);
                          }),
                    ),

                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(bottom:0.0),
                height: _height/2.0,
                color: Colors.indigoAccent[600],
                width: _width,
                child: SingleChildScrollView(
                    physics:NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(left: 15.0,right: 15.0,bottom:0.0,top:0.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 19.0,left:4.0),
                          alignment: Alignment.topLeft,
                          height:_height/16,
                          child: Text('Last File',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.w600),),
                        ),

                        Container(
                          //color: Color(0x4885ea),
                          // margin: EdgeInsets.only(top: 5),
                          //padding: EdgeInsets.only(bottom: 20.0),
                          // width: _width,
                          height: _height/2,
                          // color: Colors.orange,
                          child: ListView.builder(
                              itemCount:lastFile.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return _buildLastFile(lastFile[index], index);
                              }),
                        ),

                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    ); }

  Widget _buildDropBox(DropBox item) {
    return Container(
      padding: EdgeInsets.only( left:15.0,right: 5.0),
      width: _width/1.5,
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation:2.0,
          color: Colors.white,
          child:Padding(
            padding: EdgeInsets.only(left:10.0,right: 10.0,top:10.0,bottom:10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  height: _height/12,
                  width: _width/4.9,
                  //color: Colors.grey,
                  child:Card(
                    elevation:2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Image.asset(
                      item.img,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.folder,color: Colors.cyan,size:30.0),
                    SizedBox(width:5.0,),
                    Icon(Icons.image,color: Colors.grey[300],size:30.0),
                    SizedBox(width:5.0,),
                    Icon(Icons.add_comment,color: Colors.grey[300],size:30.0),
                    SizedBox(width:5.0,),
                    Icon(Icons.folder,color: Colors.grey[300],size:30.0),
                  ],
                ),

                Text(item.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),

                Column(

                  children: <Widget>[

                    Container(
                      margin:EdgeInsets.only(right:5.0),
                      alignment: Alignment.topRight,
                      child: Text('10/2019',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w600),),
                    ),

                    //SizedBox(height:5.0,),

                    Row(
                      children: <Widget>[
                        Container(
                          height: _height/120.0,
                          width: _width/4.5,
                          color: Colors.indigo,
                        ),
                        Container(
                          height: _height/120.0,
                          width: _width/3.5,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
      ),
    );
  }

  Widget _buildLastFile(LastFile item, int index) {
    return InkWell(
      child:Container(
        height:80.0,
        // color: Colors.transparent,
        child: Opacity(
          opacity: 0.9,
          child: Card(
            // color: Color(0xFF2196F3),
            elevation: 1,
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading:ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: Container(
                  height:60,
                  width: 25,
                  child:Image.asset(item.img),
                ),
              ),
              title: Row(
                children: <Widget>[
                  Text(item.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
                  Text('.PDF',style: TextStyle(color: Colors.white70),),
                ],
              ),
              subtitle: Text(item.subTitle,style: TextStyle(color: Colors.white70,fontSize:10.0)),
              trailing: InkWell(
                child: item.isProgressBar?ProgressBar():Container(
                  height:_height/10.0,
                  width: _width/12.0,
                 // color: Colors.white,
                  child: _selectIndex!=null?_selectIndex:Image.asset(item.iconImg),
                ),
                onTap: (){
                  setState(() {
                    item.isProgressBar = !item.isProgressBar;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

/*  Widget showProgressBar(BuildContext context) {
    return Container(
      height:50,
      width: 25,
      // color: Colors.cyan,
      child:CircularPercentIndicator(
        radius: 30.0,
        lineWidth:4.0,
        animation: true,

        animationDuration:2000,

        percent: percent/100,

        center:Text(percent.toString() +"%",style: TextStyle(fontSize:5.0,fontWeight: FontWeight.w600,color: Colors.white),),

        circularStrokeCap: CircularStrokeCap.round,
        progressColor: Colors.red,
        backgroundColor: Colors.white,
      ),
    );
  }*/

}
