import 'package:flutter/material.dart';
import 'package:kezel/constants/colors.dart';
import 'package:kezel/domain/firebase_auth/firebase_google_login.dart';
import 'package:kezel/provider/data_provider.dart';
import 'package:kezel/view/AboutUs/about_us_screen.dart';
import 'package:shimmer/shimmer.dart';

class SilverTopmenuTextAdapter extends StatelessWidget {
  const SilverTopmenuTextAdapter({
    super.key,
    required this.dataProvider,
  });

  final DataProvider dataProvider;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Text(
            dataProvider.websiteDetails.sliderTitle,
            style: const TextStyle(
                color: Color.fromARGB(255, 181, 39, 29),
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic),
          ),
          Text(
            dataProvider.websiteDetails.sliderDesc,
            style: const TextStyle(
                color: Color.fromARGB(255, 181, 39, 29),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}

class SilverAppBarWidget extends StatelessWidget {
  const SilverAppBarWidget({
    super.key,
    required this.dataProvider,
    required this.auth,
  });

  final DataProvider dataProvider;
  final Firebaseauth auth;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 180.0,
      floating: false,
      // pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/w-.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
                child: Container(
              color: Colors.black.withOpacity(0.6),
            )),
            Positioned.fill(
              child: Image.network(
                dataProvider.websiteDetails.image,
                fit: BoxFit.contain,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: white,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton.icon(
          icon: Icon(Icons.account_balance_outlined, color: white),
          label: Text(
            'About us',
            style: TextStyle(color: white),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  AboutUsScreen(details: dataProvider.websiteDetails),
            ));
          },
        ),
        PopupMenuButton(
          icon: Icon(Icons.more_vert, color: white),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            const PopupMenuItem(
              value: 'logout',
              child: Row(
                children: [
                  Icon(Icons.logout),
                  Text('Logout'),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 'logout') {
              auth.signOut(context);
            }
          },
        ),
      ],
    );
  }
}
