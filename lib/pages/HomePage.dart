import 'package:flutter/material.dart';
import 'package:myprovider/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider(),
            child:Consumer<HomeProvider>(builder: (context,provider,child){
              return
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(provider.eligibilityMessage.toString(),style: TextStyle(
                      color: (provider.isEligible==true)?Colors.green:Colors.red ,
                    ),),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: 'Enter your Age?'),
                      onChanged: (val){
                        provider.checkEligibility(int.parse(val));
                      },
                    )
                  ],
                );
            }),


          ),
        ),
      ),
    );
  }
}
