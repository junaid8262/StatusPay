import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SubmitScreenshotScreen extends StatefulWidget {

  @override
  _SubmitScreenshotScreenState createState() => new _SubmitScreenshotScreenState();
}

class _SubmitScreenshotScreenState extends State<SubmitScreenshotScreen> {

  final _key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 4,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset('assets/images/status_pay_app_bar.png',height: 40,),
        ),
        body: SafeArea(
          minimum: EdgeInsets.only(top: 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          //top header
                          Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(
                                    "Submit Screenshots",
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    //width: 200,
                                    child: Divider(
                                      color: Colors.grey[600],
                                    ),
                                  )
                                ],
                              )
                          ),
                          Expanded(
                              child: Container(
                                //padding: EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                //profile info
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10,),
                                    Text(
                                      "Submit the Screenshots of Statuses", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      "Take the screenshots of both the WhatsApp statuses after 20 hours of them being alive.Please upload the screenshots in their respective slots.", style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                      textAlign: TextAlign.left,
                                    ),
                                    SizedBox(height: 30,),
                                    Text(
                                      "Advert", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20,),
                                    //button
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 80),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(top: 3, left: 3),
                                        child: MaterialButton(
                                          minWidth: double.infinity,
                                          //height: 50,
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder:(context)=>  SafeArea(
                                              child: WebView(
                                                  key: _key,
                                                  javascriptMode: JavascriptMode.unrestricted,
                                                  initialUrl: "https://docs.google.com/forms/d/1p9bqhkzt3XfqhkwFlrztnq7HThglW1HZAcCLaFjBGtc/viewform?edit_requested=true"),
                                            )));

                                            //_service("https://docs.google.com/forms/d/1p9bqhkzt3XfqhkwFlrztnq7HThglW1HZAcCLaFjBGtc/viewform?edit_requested=true");
                                            //navigationPage();
                                          },
                                          color: Colors.blueAccent,
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),

                                          ),
                                          child: Icon(
                                            Icons.cloud_upload_rounded,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Text(
                                      "Text", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 20,),
                                    //button
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 80),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(top: 3, left: 3),
                                        child: MaterialButton(
                                          minWidth: double.infinity,
                                          //height: 50,
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder:(context)=>  SafeArea(
                                              child: WebView(
                                                  key: _key,
                                                  javascriptMode: JavascriptMode.unrestricted,
                                                  initialUrl: "https://docs.google.com/forms/d/1p9bqhkzt3XfqhkwFlrztnq7HThglW1HZAcCLaFjBGtc/viewform?edit_requested=true"),
                                            )));

                                            //navigationPage();
                                          },
                                          color: Colors.blueAccent,
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),

                                          ),
                                          child: Icon(
                                            Icons.cloud_upload_rounded,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                  ],
                                ),
                              )
                          ),

                        ]
                    )
                ),
              ],
            ),

          ),
        )
    );
  }

  _service(String url) async {
    try{

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    catch (e)
    {
      print("code");
    }
  }


}
