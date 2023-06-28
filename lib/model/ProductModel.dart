 // product_id : 1
 // order_id : "335284"
 // vendor_id : 16
 // name : "Magnolia"
 // seo_tag : "mangolia"
 // brand : "Bamboo Marigold"
 // quantity : 1
 // unit : "piece"
 // product_stock_quantity : 51
 // price : 570
 // mrp : "600"
 // gst : "6"
 // sgst : 3
 // cgst : 3
 // category : "Climbers"
 // is_deleted : "0"
 // status : "active"
 // review : "nice one"
 // discount : "5"
 // rating : "3"
 // description : "A product description is the marketing copy that explains what a product is and why it's worth purchasing"
 // is_active : 0
 // created_on : "2023-04-28T08:30:50.000Z"
 // updated_on : "2023-04-28T08:30:50.000Z"
 // all_images_url : "http://192.168.29.109:8888/product_images/3.jpg01_868385.png,http://192.168.29.109:8888/product_images/download(2).jpeg11_880588.png,http://192.168.29.109:8888/product_images/download(3).jpeg21_178746.png,http://192.168.29.109:8888/product_images/download(4).jpeg31_162529.png"
 // cover_image : "http://192.168.29.109:8888/product_images/3.jpg01_868385.png"

class ProductModel {
  ProductModel({
      this.productId, 
      this.orderId, 
      this.vendorId, 
      this.name, 
      this.seoTag, 
      this.brand, 
      this.quantity, 
      this.unit, 
      this.productStockQuantity, 
      this.price, 
      this.mrp, 
      this.gst, 
      this.sgst, 
      this.cgst, 
      this.category, 
      this.isDeleted, 
      this.status, 
      this.review, 
      this.discount, 
      this.rating, 
      this.description, 
      this.isActive, 
      this.createdOn, 
      this.updatedOn, 
      this.allImagesUrl, 
      this.coverImage,});

  ProductModel.fromJson(dynamic json) {
   try{
     productId = json['product_id'];
     orderId = json['order_id'];
     vendorId = json['vendor_id'];
     name = json['name'];
     seoTag = json['seo_tag'];
     brand = json['brand'];
     quantity = json['quantity'];
     unit = json['unit'];
     productStockQuantity = json['product_stock_quantity'];
     price = json['price'];
     mrp = json['mrp'];
     gst = json['gst'];
     sgst = json['sgst'];
     cgst = json['cgst'];
     category = json['category'];
     isDeleted = json['is_deleted'];
     status = json['status'];
     review = json['review'];
     discount = json['discount'];
     rating = json['rating'];
     description = json['description'];
     isActive = json['is_active'];
     createdOn = json['created_on'];
     updatedOn = json['updated_on'];
     allImagesUrl = json['all_images_url'];
     coverImage = json['cover_image'];
   }catch(e){
     //
   }
  }
  int? productId;
  String? orderId;
  int? vendorId;
  String? name;
  String? seoTag;
  String? brand;
  int? quantity;
  String? unit;
  int? productStockQuantity;
  double? price;
  String? mrp;
  String? gst;
  int? sgst;
  int? cgst;
  String? category;
  String? isDeleted;
  String? status;
  String? review;
  String? discount;
  String? rating;
  String? description;
  int? isActive;
  String? createdOn;
  String? updatedOn;
  String? allImagesUrl;
  String? coverImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['order_id'] = orderId;
    map['vendor_id'] = vendorId;
    map['name'] = name;
    map['seo_tag'] = seoTag;
    map['brand'] = brand;
    map['quantity'] = quantity;
    map['unit'] = unit;
    map['product_stock_quantity'] = productStockQuantity;
    map['price'] = price;
    map['mrp'] = mrp;
    map['gst'] = gst;
    map['sgst'] = sgst;
    map['cgst'] = cgst;
    map['category'] = category;
    map['is_deleted'] = isDeleted;
    map['status'] = status;
    map['review'] = review;
    map['discount'] = discount;
    map['rating'] = rating;
    map['description'] = description;
    map['is_active'] = isActive;
    map['created_on'] = createdOn;
    map['updated_on'] = updatedOn;
    map['all_images_url'] = allImagesUrl;
    map['cover_image'] = coverImage;
    return map;
  }

}