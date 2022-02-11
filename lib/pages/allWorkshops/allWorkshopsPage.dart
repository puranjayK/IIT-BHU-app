import 'package:flutter/material.dart';
import 'package:iit_app/model/colorConstants.dart';
import 'package:iit_app/screens/newScreens/new_home_app_bar.dart';
import 'package:iit_app/screens/newScreens/new_workshop_events_app_bar.dart';
import 'package:iit_app/ui/drawer.dart';
import 'package:iit_app/services/buildWorkshops.dart' as buildWorkshop;
import 'package:iit_app/ui/search_workshop.dart';
import 'package:iit_app/model/appConstants.dart';
import 'package:iit_app/data/internet_connection_interceptor.dart';

class AllWorkshopsScreen extends StatefulWidget {
  @override
  _AllWorkshopsScreenState createState() => _AllWorkshopsScreenState();
}

class _AllWorkshopsScreenState extends State<AllWorkshopsScreen>
    with SingleTickerProviderStateMixin {
  SearchBarWidget searchBarWidget;
  ValueNotifier<bool> searchListener;
  FocusNode searchFocusNode;

  @override
  void initState() {
    searchListener = ValueNotifier(false);
    searchBarWidget = SearchBarWidget(searchListener);
    searchFocusNode = FocusNode();
    super.initState();
  }

  void reload() async {
    try {
      await AppConstants.service.getAllWorkshops();
      setState(() {});
    } on InternetConnectionException catch (_) {
      AppConstants.internetErrorFlushBar.showFlushbar(context);
      return;
    } catch (err) {
      print(err);
    }
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  Future<bool> onPop() async {
    // if on allWorkhops screen but searchController is onFocus
    if (!searchBarWidget.isSearching.value && searchFocusNode.hasFocus) {
      searchBarWidget.searchController.clear();
      searchFocusNode.unfocus();
      return false;
    }
    // to retrun on allWorkshops route on popping from search result screen
    if (searchBarWidget.isSearching.value) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/allWorkshops');
      return false;
    }
    Navigator.pushNamed(context, '/home');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onPop,
      child: RefreshIndicator(
        onRefresh: () async => reload(),
        child: SafeArea(
          minimum: const EdgeInsets.all(2.0),
          child: Scaffold(
            backgroundColor: ColorConstants.homeBackground,
            appBar: newWorkshopEventAppBar(context, searchBarWidget, searchFocusNode),
            // AppBar(
            //   leading: IconButton(
            //     icon: Icon(Icons.arrow_back, color: ColorConstants.textColor),
            //     onPressed: () => Navigator.pop(context),
            //   ),
            //   backgroundColor: ColorConstants.homeBackground,
            //   automaticallyImplyLeading: false,
            //   title: Text("All Workshops"),
            //   actions: <Widget>[
            //     Expanded(
            //         child: Padding(
            //       padding: const EdgeInsets.fromLTRB(50.0, 5.0, 20, 0),
            //       child: searchBarWidget.getSearchTextField(context,
            //           searchFocusNode: searchFocusNode),
            //     )),
            //   ],
            // ),
            drawer: SideBar(context: context),
            body: GestureDetector(
              onTap: () {
                if (searchFocusNode.hasFocus) {
                  searchFocusNode.unfocus();
                }
              },
              child: ValueListenableBuilder(
                  valueListenable: searchListener,
                  builder: (context, isSearching, child) {
                    return (isSearching
                        ? buildWorkshop.buildWorkshopsFromSearch(
                            context: context,
                            searchPost: searchBarWidget.searchPost,
                            reload: reload)
                        : buildWorkshop.buildAllWorkshopsBody(context,
                            reload: reload));
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
