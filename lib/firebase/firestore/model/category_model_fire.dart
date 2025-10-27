class CategoryModelFire {
  String? id;
  String image;
  String nameCategory;
  String title;
  String price;
  bool isFavourite;

  CategoryModelFire({
    this.id = '',
    required this.image,
    required this.nameCategory,
    required this.title,
    required this.price,
    this.isFavourite = false,
  });

  static const String collectionName = 'Category';

  //todo firebase return json(convert json into object)
  //todo json=>object
  CategoryModelFire.fromFirestore(Map<String, dynamic> json)
    : this(
        id: json['id'],
        image: json['image'] ?? '',
        nameCategory: json['nameCategory'] ?? '',
        title: json['title'] ?? '',
        price: json['price'] ?? '',
        isFavourite: json['isFavourite'] ?? false,
      );

  //todo me send for firebase object(convert object into json)
  //todo object=>json
  Map<String, dynamic> toFirestore() {
    return {
      "id": id,
      "image": image,
      "nameCategory": nameCategory,
      "title": title,
      "price": price,
      "isFavourite": isFavourite,
    };
  }
}
