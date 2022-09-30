import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      // appBar: new AppBar(
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: new Text('Field Inside Card',
      //       style: new TextStyle(
      //           fontSize: 18.0,
      //           fontWeight: FontWeight.w400,
      //           color: Colors.white)),
      // ),
      body: new SingleChildScrollView(
        padding: new EdgeInsets.only(bottom: 20.0),
        child: new Center(
          child: new Form(
            //key: _formKey,
            child: new Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Card(
                    margin: new EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 8.0, bottom: 5.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 4.0,
                    child: new Padding(
                      padding: new EdgeInsets.all(25.0),
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new TextFormField(
                              maxLines: 1,
                              //controller: _nameFieldController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              decoration:
                              new InputDecoration(labelText: 'Enter Code'),
                              onFieldSubmitted: (value) {
                                //FocusScope.of(context).requestFocus(_phoneFocusNode);
                              },
                              // validator: (value) {
                              //   if (value.isEmpty) {
                              //     return 'Type your name';
                              //   }
                              // },
                            ),
                          ),
                          new Padding(padding: new EdgeInsets.only(top: 30.0)),
                          new RaisedButton(
                            color: Colors.green,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            padding: new EdgeInsets.all(16.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Text(
                                  'Submit',
                                  style: new TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            onPressed: () {
                              //_persistFormData();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
