import 'package:ngamar/app/data/constants/constants.dart';

class ProductModel {
  String id;
  String image;
  String name;
  double oldPrice;
  double currentPrice;
  String offPercentage;
  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.oldPrice,
    required this.currentPrice,
    required this.offPercentage,
  });
}

List<ProductModel> dummyProductList = [
  ProductModel(
    id: '1',
    image: AppAssets.kDummyProduct1,
    name: 'Lokman Sofa Premium',
    oldPrice: 599.99,
    currentPrice: 399.99,
    offPercentage: '30% Off',
  ),
  ProductModel(
    id: '2',
    image: AppAssets.kDummyProduct2,
    name: 'King Bed Leonard',
    oldPrice: 249.99,
    currentPrice: 199.99,
    offPercentage: '20% Off',
  ),
  ProductModel(
    id: '1',
    image: AppAssets.kDummyProduct3,
    name: 'Lokman Sofa Premium',
    oldPrice: 599.99,
    currentPrice: 399.99,
    offPercentage: '30% Off',
  ),
  ProductModel(
    id: '2',
    image: AppAssets.kDummyProduct4,
    name: 'King Bed Leonard',
    oldPrice: 249.99,
    currentPrice: 199.99,
    offPercentage: '20% Off',
  ),
];
