import 'package:farm_flutter/view/pdf_view_page.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0,bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.yellow,
                    Colors.orangeAccent,
                    Colors.yellow.shade300,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                title: Text("Mission",style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViewPage(pdfName: 'Mission',url: 'pdf/FarmTestPDF.pdf',)));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.lightGreenAccent,
                    Colors.lightGreen,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                title: Text("Vision",style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViewPage(pdfName: 'Vision',url: 'pdf/Vision.pdf',)));
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.orangeAccent,
                    Colors.red,
                    Colors.orange,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                title: Text("Pilot Project",style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViewPage(pdfName: 'Pilot Project',url: 'pdf/Pilot_Project.pdf',)));
                },
              ),
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("Contact Phone",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("033-15246"),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
