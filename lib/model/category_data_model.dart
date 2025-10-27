import 'package:coffee_cookies/core/constants/app_asset.dart';

class CategoryDataModel {
  final String nameCategory;
  final String title;
  final String image;
  final String price;
  final bool isFavourite;

  CategoryDataModel({
    required this.nameCategory,
    required this.title,
    required this.image,
    required this.price,
    required this.isFavourite,
  });

  static List<String> categoryTabs = [
    'All',
    'Coffee',
    'Cookies',
    'Bakery',
    'Espresso',
    'Mocha',
    'Latte',
  ];

  static List<CategoryDataModel> categoryDataList = [
    CategoryDataModel(
      nameCategory: 'Coffee',
      title: 'Americano Coffee',
      image: AppAsset.americanoCoffee,
      price: "100",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Coffee',
      title: 'Coffee Flavor',
      image: AppAsset.coffeeFlavorCoffee,
      price: "200",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Coffee',
      title: 'Cold Brew Coffee',
      image: AppAsset.coldBrewCoffee,
      price: "300",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Coffee',
      title: 'French Press Coffee',
      image: AppAsset.frenchPressCoffee,
      price: "400",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Coffee',
      title: 'Turkish Coffee',
      image: AppAsset.turkishCoffee,
      price: "500",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Cookies',
      title: 'Banana Chocolate Chip Cookies',
      image: AppAsset.bananaChocolateChipCookies,
      price: "100",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Cookies',
      title: 'Caramel Crunch Cookies',
      image: AppAsset.caramelCrunchCookies,
      price: "130",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Cookies',
      title: 'Chocolate Chip Cookies',
      image: AppAsset.chocolateChipCookies,
      price: "60",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Cookies',
      title: 'Chocolate Cookies',
      image: AppAsset.chocolateCookies,
      price: "80",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Cookies',
      title: 'Cocoa And Melon Cookies',
      image: AppAsset.cocoaAndMelonCookies,
      price: "40",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Cookies',
      title: 'Milky Way Sweet Cookies',
      image: AppAsset.milkyWaySweetCookies,
      price: "70",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Bakery',
      title: 'Donuts Bakery',
      image: AppAsset.donutsBakery,
      price: "120",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Bakery',
      title: 'Flaky Bakery',
      image: AppAsset.flakyBakery,
      price: "140",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Bakery',
      title: 'Cinnamon Bakery',
      image: AppAsset.cinnamonBakery,
      price: "135",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Bakery',
      title: 'Cupcake Bakery',
      image: AppAsset.cupcakeBakery,
      price: "85",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Espresso',
      title: 'Espresso With Steamed',
      image: AppAsset.espressoWithSteamedEspresso,
      price: "100",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Espresso',
      title: 'Lungo Espresso',
      image: AppAsset.lungoEspresso,
      price: "220",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Espresso',
      title: 'Macchiato Espresso',
      image: AppAsset.macchiatoEspresso,
      price: "135",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Espresso',
      title: 'Single Espresso',
      image: AppAsset.singleEspresso,
      price: "105",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Mocha',
      title: 'Classic Mocha',
      image: AppAsset.classicMocha,
      price: "110",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Mocha',
      title: 'Iced Mocha',
      image: AppAsset.icedMocha,
      price: "125",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Mocha',
      title: 'Peppermint Mocha',
      image: AppAsset.peppermintMocha,
      price: " 140",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Latte',
      title: 'Caramel Latte',
      image: AppAsset.caramelLatte,
      price: "135",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Latte',
      title: 'Hazelnut Latte',
      image: AppAsset.hazelnutLatte,
      price: "175",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Latte',
      title: 'Iced Latte',
      image: AppAsset.icedLatte,
      price: "155",
      isFavourite: false,
    ),
    CategoryDataModel(
      nameCategory: 'Latte',
      title: 'Vanilla Latte',
      image: AppAsset.vanillaLatte,
      price: "140",
      isFavourite: false,
    ),
  ];
}
