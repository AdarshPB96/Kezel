import 'package:flutter/material.dart';
import 'package:kezel/domain/firebase_auth/firebase_google_login.dart';
import 'package:kezel/provider/data_provider.dart';
import 'package:kezel/view/home/widgets/home_menu_list.dart';
import 'package:kezel/view/home/widgets/top_home_silver_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context, listen: false);

    Firebaseauth auth = Firebaseauth();
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: dataProvider.isLoading
            ? const Center(child: LinearProgressIndicator())
            : CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SilverAppBarWidget(dataProvider: dataProvider, auth: auth),
                  SilverTopmenuTextAdapter(dataProvider: dataProvider),
                  SilverListwithSeparated(
                      dataProvider: dataProvider, h: h, w: w),
                ],
              ),
      ),
    );
  }
}

