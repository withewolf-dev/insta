import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const TextField(
            cursorColor: Colors.black54,
            decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.black12,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide.none)),
          ),
        ),
        body: SafeArea(
            child: ListView(
                scrollDirection: Axis.vertical, children: [staggeredView()])));
  }

  StaggeredGrid staggeredView() {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: [
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Image.network(
              "https://images.unsplash.com/photo-1659785814117-a9b958b06d81?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
              fit: BoxFit.cover,
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Image.network(
              "https://images.unsplash.com/photo-1659812903039-d577a4844802?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
              fit: BoxFit.cover,
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Image.network(
              "https://images.unsplash.com/photo-1659877896436-c68914c0b348?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=438&q=80",
              fit: BoxFit.cover,
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Image.network(
              "https://images.unsplash.com/photo-1659855286132-046855432688?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
              fit: BoxFit.cover,
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 2,
            child: Image.network(
              "https://images.unsplash.com/photo-1659855286132-046855432688?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
              fit: BoxFit.cover,
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Image.network(
              "https://images.unsplash.com/photo-1659785814117-a9b958b06d81?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
              fit: BoxFit.cover,
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: Image.network(
              "https://images.unsplash.com/photo-1659812903039-d577a4844802?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
              fit: BoxFit.cover,
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Image.network(
              "https://images.unsplash.com/photo-1659877896436-c68914c0b348?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=438&q=80",
              fit: BoxFit.cover,
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Image.network(
              "https://images.unsplash.com/photo-1659855286132-046855432688?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
              fit: BoxFit.cover,
            )),
        StaggeredGridTile.count(
            crossAxisCellCount: 4,
            mainAxisCellCount: 2,
            child: Image.network(
              "https://images.unsplash.com/photo-1659855286132-046855432688?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
              fit: BoxFit.cover,
            )),
      ],
    );
  }
}
