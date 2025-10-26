class CategoryModel {
  final String nameCategory;

  CategoryModel({required this.nameCategory});

  static List<CategoryModel> categoryList = [
    CategoryModel(nameCategory: 'All'),
    CategoryModel(nameCategory: 'Coffee'),
    CategoryModel(nameCategory: 'Cookies'),
    CategoryModel(nameCategory: 'Bakery'),
    CategoryModel(nameCategory: 'Espresso'),
    CategoryModel(nameCategory: 'Mocha'),
    CategoryModel(nameCategory: 'Latte'),
  ];
}
