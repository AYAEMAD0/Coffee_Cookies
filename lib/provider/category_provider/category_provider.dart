import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_cookies/firebase/firestore/model/category_model_fire.dart';
import 'package:coffee_cookies/model/category_data_model.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/custom_snackbar.dart';
import '../../firebase/firestore/firebase_utils.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModelFire> listAllItem = [];
  List<CategoryModelFire> filterList = [];
  List<CategoryModelFire> searchFilterList = [];
  List<CategoryModelFire> filterFavouriteList = [];
  List<String> categoryModel = CategoryDataModel.categoryTabs;
  CategoryModelFire? bestOfTodayItem;
  int selectedIndex = 0;

  void getAllItem(String uid) async {
    //todo: get category
    QuerySnapshot<CategoryModelFire> query =
        await FireBaseUtils.getCategoryCollection(uid).get();
    //todo: List<CategoryModelFire>   map  List<QueryDocumentSnapshot<CategoryModelFire>>
    listAllItem = query.docs.map((e) => e.data()).toList();
    filterList = listAllItem;
    if (bestOfTodayItem == null && listAllItem.isNotEmpty) {
      randomBestOfToday();
    }
    notifyListeners();
  }

  void getFilterCategory(String uid) async {
    //todo: get category
    QuerySnapshot<CategoryModelFire> query =
        await FireBaseUtils.getCategoryCollection(uid).get();
    //todo: List<CategoryModelFire>   map  List<QueryDocumentSnapshot<CategoryModelFire>>
    listAllItem = query.docs.map((e) => e.data()).toList();
    //todo: filter event
    filterList = listAllItem.where((element) {
      return element.nameCategory.toLowerCase() ==
          categoryModel[selectedIndex].toLowerCase();
    }).toList();
    notifyListeners();
  }

  //todo: change index for tabs
  void changeIndex(index, String uid) async {
    selectedIndex = index;
    selectedIndex == 0 ? getAllItem(uid) : getFilterCategory(uid);
  }

  void updateFavouriteEvent(
    CategoryModelFire event,
    BuildContext context,
    String uid,
  ) async {
    //todo: update favourite category
    await FireBaseUtils.getCategoryCollection(
      uid,
    ).doc(event.id).update({'isFavourite': !event.isFavourite}).then((value) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(CustomSnackbar.show('Category Update'));
    });
    selectedIndex == 0 ? getAllItem(uid) : getFilterCategory(uid);
    notifyListeners();
  }

  //todo search
  void searchItems(String query) {
    if (query.isEmpty) {
      searchFilterList = [];
    } else {
      searchFilterList = listAllItem.where((item) {
        final titleLower = item.title.toLowerCase();
        final categoryLower = item.nameCategory.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower) ||
            categoryLower.contains(searchLower);
      }).toList();
    }
    notifyListeners();
  }

  //todo random for best today
  void randomBestOfToday() {
    if (listAllItem.isNotEmpty) {
      final random = Random();
      //todo return random number between 0 and listAllItem.length-1
      bestOfTodayItem = listAllItem[random.nextInt(listAllItem.length)];
      notifyListeners();
    }
  }
}
