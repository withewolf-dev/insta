import 'package:flutter/material.dart';
import 'package:insta/widgets/post_grid_view.dart';

class ProfileMediaGrid extends StatefulWidget {
  final double width;
  const ProfileMediaGrid({Key? key, required this.width}) : super(key: key);

  @override
  State<ProfileMediaGrid> createState() => _ProfileMediaGridState();
}

class _ProfileMediaGridState extends State<ProfileMediaGrid>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        TabBar(
          indicatorColor: Colors.black,
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black54,
          tabs: const [
            Tab(
                icon: Icon(
              Icons.grid_on_rounded,
            )),
            Tab(
                icon: Icon(
              Icons.calendar_view_day_rounded,
              size: 25,
            )),
            Tab(
                icon: Icon(
              Icons.shop_sharp,
            )),
            Tab(
                icon: Icon(
              Icons.perm_identity_sharp,
            )),
          ],
        ),
        SizedBox(
          height: 300,
          child: TabBarView(
            controller: _tabController,
            children: const [
              PostGridView(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ],
    );
  }
}
