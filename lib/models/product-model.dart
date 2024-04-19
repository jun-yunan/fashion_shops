class ProductModel {
  String? productId;
  String? name;
  String? description;
  String? price;
  String? images;
  String? categoryId; // Danh mục sản phẩm
  String? brand; // Thương hiệu
  String? size; // Kích thước
  String? color; // Màu sắc
  String? material; // Chất liệu
  String? rating; // Đánh giá
  // List<String?>? reviews; // Đánh giá từ người dùng
  String? reviews; // Đánh giá từ người dùng
  String? discount; // Giảm giá
  String? stock; // Tồn kho
  String? saleCount; // Số lượng đã bán
  bool? isFavorite = false;

  ProductModel({
    this.productId,
    this.name,
    this.description,
    this.price,
    this.images,
    this.categoryId,
    this.brand,
    this.size,
    this.color,
    this.material,
    this.rating,
    this.reviews,
    this.discount,
    this.stock,
    this.saleCount,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String?, dynamic> json) {
    return ProductModel(
      productId: json['productId'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      // images: List<String?>.from(json['images']),
      images: json['images'],
      categoryId: json['categoryId'],
      brand: json['brand'],
      size: json['size'],
      color: json['color'],
      material: json['material'],
      rating: json['rating'],
      // reviews: List<String?>.from(json['reviews']),
      reviews: json['reviews'],
      discount: json['discount'],
      stock: json['stock'],
      saleCount: json['saleCount'],
      isFavorite: json['isFavorite'],
    );
  }

  Map<String?, dynamic> toJson() {
    return {
      'productId': productId,
      'name': name,
      'description': description,
      'price': price,
      'images': images,
      'categoryId': categoryId,
      'brand': brand,
      'size': size,
      'color': color,
      'material': material,
      'rating': rating,
      'reviews': reviews,
      'discount': discount,
      'stock': stock,
      'saleCount': saleCount,
      "isFavorite": isFavorite,
    };
  }
}
