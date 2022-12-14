class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;
  //_변수명은 비공개 변수, 리스트
  List<ProductModel> get products=>_products;

  Product({required totalSize,required typeId,required offset,required products}) {
    this._totalSize=totalSize;
    this._typeId=typeId;
    this._offset=offset;
    this._products=products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize=json['total_size'];
    _typeId=json['type_id'];
    _offset=json['offset'];
    if(json['products']!=null) {
      //_products는 비어있지만 null은 아님
      _products =<ProductModel>[];
      json['products'].forEach((v){
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createAt;
  String? updateAt;
  int? typeId;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.stars,
    this.img,
    this.location,
    this.createAt,
    this.updateAt,
    this.typeId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    name=json['name'];
    description=json['description'];
    price=json['price'];
    stars=json['stars'];
    img=json['img'];
    location=json['location'];
    createAt=json['createAt'];
    updateAt=json['updateAt'];
    typeId=json['typeId'];
  }
}
