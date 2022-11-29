import 'package:flutter/material.dart';
import 'package:flutter_hello/pages/hello_listview.dart';
import 'package:flutter_hello/pages/hello_page1.dart';
import 'package:flutter_hello/pages/hello_page2.dart';
import 'package:flutter_hello/pages/hello_page3.dart';
import 'package:flutter_hello/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../util/nav.dart';
import '../widgets/drawer_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "TAB 1",
              ),
              Tab(
                text: "TAB 2",
              ),
              Tab(
                text: "TAB 2",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _body(context),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _onClikFab();
          },
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _onClikFab() {
    print("Adicionar");
  }

  _body(context) {
    return Container(
      padding: EdgeInsets.only(top: 22),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(context),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: EdgeInsets.all(20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png")
        ],
      ),
    );
  }

  Column _buttons(context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton(
                "ListView", () => _onClickNavigator(context, HelloListView())),
            BlueButton(
                "Page 2", () => _onClickNavigator(context, HelloPage2())),
            BlueButton("Page 3", () => _onClickNavigator(context, HelloPage3()))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton("Snack", () => _onClickSnack(context)),
            BlueButton("Dialog", () => _onClickDialog(context)),
            BlueButton("Toast", _onClickToast)
          ],
        )
      ],
    );
  }

  _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);

    print(">> $s");
  }

  _onClickSnack(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(
        textColor: Colors.yellow,
        label: "OK!",
        onPressed: () {
          print("OK!");
        },
      ),
    ));
  }

  _onClickDialog(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Flutter é muito legal"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print("OK!");
                  },
                  child: Text("Ok"),
                ),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Toast!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 20.0);
  }

  _img(String img) {
    return Container(
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }
}
