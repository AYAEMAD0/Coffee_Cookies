import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_cookies/firebase/firestore/model/category_model_fire.dart';
import 'package:flutter/cupertino.dart';
import '../../model/category_data_model.dart';
import 'model/user_model.dart';

class FireBaseUtils {
  //todo create user collection
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromFirebase(snapshot.data()!),
          toFirestore: (value, options) => value.toFirebase(),
        );
  }

  //todo add user
  Future<void> addUserToFirebase(UserModel user) {
    return getUserCollection().doc(user.id).set(user);
  }

  //todo get user
  Future<UserModel?> getUserFromFirebase(String id) async {
    var query = await getUserCollection().doc(id).get();
    return query.data();
  }

  //todo create category collection
  static CollectionReference<CategoryModelFire> getCategoryCollection(
    String uid,
  ) {
    return getUserCollection()
        .doc(uid)
        .collection(CategoryModelFire.collectionName)
        .withConverter<CategoryModelFire>(
          fromFirestore: (snapshot, options) =>
              CategoryModelFire.fromFirestore(snapshot.data()!),
          toFirestore: (value, options) => value.toFirestore(),
        );
  }

  //todo add category
  static Future<void> addStaticCategoriesIfEmpty(String uid) async {
    final collection = getCategoryCollection(uid);
    final snapshot = await collection.get();

    if (snapshot.docs.isEmpty) {
      for (var category in CategoryDataModel.categoryDataList) {
        final docRef = collection.doc();
        final newCategory = CategoryModelFire(
          id: docRef.id,
          image: category.image,
          price: category.price,
          nameCategory: category.nameCategory,
          title: category.title,
          isFavourite: category.isFavourite,
        );
        await docRef.set(newCategory);
      }
      debugPrint('----------------------------');
      debugPrint('Added default categories to Firestore.');
    } else {
      debugPrint('----------------------------');
      debugPrint('Categories already exist in Firestore.');
    }
  }
}
