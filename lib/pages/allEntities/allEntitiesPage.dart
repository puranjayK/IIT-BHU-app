import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:iit_app/data/internet_connection_interceptor.dart';
import 'package:iit_app/external_libraries/spin_kit.dart';
import 'package:iit_app/model/appConstants.dart';
import 'package:iit_app/model/built_post.dart';
import 'package:iit_app/model/colorConstants.dart';
import 'package:iit_app/ui/drawer.dart';
import 'package:iit_app/ui/entity_custom_widgets.dart';
import 'package:built_collection/built_collection.dart';

class EntitiesPage extends StatefulWidget {
  @override
  _EntitiesPageState createState() => _EntitiesPageState();
}

class _EntitiesPageState extends State<EntitiesPage> {
  void initState() {
    super.initState();
  }

  Future<bool> onPop() async {
    Navigator.pushNamed(context, '/home');
    return true;
  }

  void reload() async {
    try {
      await AppConstants.updateAndPopulateAllEntities();
      setState(() {});
    } on InternetConnectionException catch (_) {
      AppConstants.internetErrorFlushBar.showFlushbar(context);
      return;
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onPop,
      child: SafeArea(
          minimum: const EdgeInsets.all(2.0),
          child: Scaffold(
            backgroundColor: ColorConstants.homeBackground,
            appBar: AppBar(
              leading: IconButton(
                color: ColorConstants.btnColor,
                iconSize: 30,
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
              backgroundColor: ColorConstants.headingColor,
              automaticallyImplyLeading: false,
              title: Text("All Entities and Fests",
              style: TextStyle(
                color: ColorConstants.btnColor
              ),),
            ),
            drawer: SideBar(context: context),
            body: RefreshIndicator(
              displacement: 60,
              onRefresh: () async => reload(),
              child: _getAllEntities(reload: reload),
            ),
          )),
    );
  }

  Widget _getAllEntities({Function reload}) {
    return Container(
        child: FutureBuilder<Response<BuiltList<EntityListPost>>>(
      future: AppConstants.service.getAllEntity(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            if (snapshot.error is InternetConnectionException) {
              AppConstants.internetErrorFlushBar.showFlushbar(context);
            }

            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }
          final posts = snapshot.data.body
              ?.where((entity) => entity.is_permanent != true)
              ?.toBuiltList();
          return _buildAllEntitiesBodyPosts(context, posts, reload: reload);
        } else {
          return Center(
            child: EntityCustomWidgets.getPlaceholder(),
          );
        }
      },
    ));
  }

  Widget _buildAllEntitiesBodyPosts(
      BuildContext context, BuiltList<EntityListPost> posts,
      {Function reload}) {
    return Container(
      child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: posts.length,
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return EntityCustomWidgets.getEntityCard(context,
                entity: posts[index], horizontal: true, reload: reload);
          }),
    );
  }
}
