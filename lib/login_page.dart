import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/custom_card.dart';
import 'package:flutter_app/data/dataSources/fireBase/Firestore.dart';
import 'package:flutter_app/data/dataSources/localData/CharacterHiveProvider.dart';
import 'package:flutter_app/data/dataSources/remoteData/dioHelper.dart';
import 'package:flutter_app/data/entities/Response.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final text = '';
  String result;
  CharacterHiveProvider _provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CharacterHiveProvider.create().then((value) => _provider = value);
  }

  Future<void> _insertInHive(Results object) async {
    _provider ??= await CharacterHiveProvider.create();
    return _provider.add(object.name, object);
  }



  @override
  //To get the message sent by pother page arguments
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments;
    if (arguments != null && arguments is Map) {
      final text = arguments['exemple'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: FutureBuilder(
        future: dioHelper.instance.get('/character'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final test = Response.fromJson(snapshot.data);
              final character = test.results[1];
              //_provider.add(character.name, character);
              final list = _provider.getAll();
              print(list.elementAt(0).name);
              //_insertInHive(character);
              /*Firestore.instance
                  .insertDocument("character", character.toJson());
*/
              return Center(
                child: Text(test.info.count.toString()),
              );
            } else {
              return Text("C'est fini---");
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
