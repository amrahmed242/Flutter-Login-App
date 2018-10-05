import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
 
class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return new LoginState();
    }      
}
    
class LoginState extends State<Login> {

  final key=new GlobalKey<ScaffoldState>();
  final TextEditingController _userController=new TextEditingController();
  final TextEditingController _passwordController=new TextEditingController();
  String _name="";



  @override
  Widget build(BuildContext context) {
  return new Scaffold(
    key: key,
      appBar: new AppBar(
        title: new Text("PIN Protection",
        style: TextStyle(color:Colors.greenAccent,
        fontStyle: FontStyle.italic),),
        centerTitle: true,
        backgroundColor: Colors.grey.withAlpha(6),
      ),
      backgroundColor: Colors.grey.withAlpha(99),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: new EdgeInsets.all(20.1),
          children: <Widget>[
            new Image.asset("images/logofinal.png",
            width: 270.0,
            height: 160.0,
            color: Colors.greenAccent),

            new Container(
              height: 200.0,
              width: 380.0,
              // color:Colors.greenAccent.withAlpha(40),
              child: new Column(
                children: <Widget>[
                  
                  new TextField(
                    style: new TextStyle(color:Colors.greenAccent.withAlpha(650)),
                    controller: _userController ,
                    cursorColor: Colors.green,
                    decoration: new InputDecoration(
                      labelText: "Name",
                      labelStyle: new TextStyle(color: Colors.greenAccent,fontStyle: FontStyle.italic),
                      hintText: "Enter User Name",
                      hintStyle: new TextStyle(color: Colors.greenAccent.withAlpha(80)),
                      icon: new Icon(Icons.person,color: Colors.greenAccent,),
                    ),
                  ),

                  new TextField(
                    keyboardType: TextInputType.number,
                    style: new TextStyle(color:Colors.greenAccent.withAlpha(650)),
                    controller: _passwordController ,
                    cursorColor: Colors.green,
                    obscureText: true,
                    decoration: new InputDecoration(
                      labelText: "PIN",
                      labelStyle: new TextStyle(color: Colors.greenAccent,fontStyle: FontStyle.italic),
                      hintText: "Enter User PIN",
                      hintStyle: new TextStyle(fontStyle: FontStyle.italic ,color: Colors.greenAccent.withAlpha(80)),
                      icon: new Icon(Icons.lock,color: Colors.greenAccent,),
                    ),
                  ),

                  new Padding(
                    padding: new EdgeInsets.all(10.1),
                  ),
                  
                  new Center(
                    child: new Row(  
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      new Container(
                        margin: const EdgeInsets.only(right: 35.2),
                        child: new RaisedButton(
                          onPressed: () => _login(),
                          color: Colors.greenAccent.withAlpha(180),
                          highlightColor: Colors.greenAccent.withAlpha(160),
                          child: new Text("Login",
                          style: new TextStyle(fontSize:15.4,color:Colors.white,fontStyle: FontStyle.italic))
                          )
                        ),

                        new Container(
                         child: new RaisedButton(
                          onPressed: () => _clear(),
                          color: Colors.greenAccent.withAlpha(180),
                          highlightColor: Colors.greenAccent.withAlpha(160),
                          child: new Text("clear",
                          style: new TextStyle(fontSize:15.4,color:Colors.white,fontStyle: FontStyle.italic))
                          )
                        )

                    ]  
                   )
                  ),

                ],
              ),
              ), //form

               new Padding(
                    padding: new EdgeInsets.only(top:50.1),
                  ),

               new Container(
                 alignment: Alignment.center, // red circle
                 child: new Column(
                   children: <Widget>[
                     new Text("$_name",style: new TextStyle(color:Colors.white,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                     new Padding(
                       padding: new EdgeInsets.only(top:5.1),
                       ),
                     new Container(child: new Text(_name.isNotEmpty? "*secured content*" : "",style: new TextStyle(color:Colors.white),),)
                   ],
                 ),                         
                 decoration: BoxDecoration(
                 color: _name.isNotEmpty ? Colors.greenAccent.withAlpha(160) : Colors.greenAccent.withAlpha(0),
                 borderRadius: BorderRadius.all(const Radius.circular(23.0),),),
                         padding: EdgeInsets.all(12.0),
                 ),
               
          ],
        ),
      ),

  );
 }


 _clear(){
      setState(() {
          _name="";
          _userController.clear();
          _passwordController.clear();
      });
    
    }

_login(){
      setState(() {
          if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty){
            _name="Welcome "+_userController.text+" !";
          }else{
            showSnake("please enter a valid User Name and PIN !");
          
          } 
      });
    }
                         
showSnake(var txt){
    SnackBar snackBar= new SnackBar(
      content: new Text("$txt",textAlign: TextAlign.center),
      );

      key.currentState.showSnackBar(snackBar);
  }



}