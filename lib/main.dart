import 'package:api_test/models/post_model.dart';
import 'package:api_test/screens/dashboard.dart';
import 'package:api_test/services/post_services.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}

class Home extends StatelessWidget { 
  callAPI(BuildContext context) {
    Post post = Post(body: 'Test body', title: 'Flutter');
    createPost(post).then((response) {
      if (response.statusCode > 200) {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed('/dashboard');
      } else {
        print(response.statusCode);
      }
    }).catchError((error) {
      print('error : $error');
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<Post>(
          //future bir future’a ihtiyaç duyar ve getPost() bir future verir.
          future: getPost(),
          //builder sonucu snapshot a dönüştürür
          builder: (context, snapshot) {
            callAPI(context);
            // bağlantı tamamlandıysa. veri geldiyse
            if (snapshot.connectionState == ConnectionState.done) {
              // internet bağlantısı yok gibi hata durumları için belirli bir UI göstermek istersem?
              if (snapshot.hasError) {
                return Text("Error");
              }

              return Text('Title from Post JSON : ${snapshot.data.title}');
            } else {
              //sonucu beklerken dönen bir çember yap
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
