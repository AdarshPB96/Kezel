import 'package:flutter/material.dart';
import 'package:kezel/domain/firebase_auth/firebase_google_login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Firebaseauth auth = Firebaseauth();
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.6),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              PopupMenuItem(
                child: Text('Logout'),
                value: 'logout',
              ),
            ],
            onSelected: (value) {
              if (value == 'logout') {
                auth.signOut(context);
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                // pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(''),
                  background: Image.asset(
                    'assets/dummy.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                // bottom: const PreferredSize(
                //   preferredSize: Size.fromHeight(0),
                //   child: Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: Column(
                //       children: [
                //         Text(
                //           'special offers',
                //           style: TextStyle(
                //               fontSize: 14.0, fontWeight: FontWeight.w500),
                //         ),
                //         Text(
                //           'Discover our menu',
                //           style: TextStyle(fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    children: [
                      Text(
                        'special offers',
                        style: TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Discover our menu',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    height: h * 0.2,
                    width: w * 0.2,
                    child: Image.asset(
                      'assets/dummy.jpg',
                      fit: BoxFit.cover,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 50,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
