class CartModel {
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartUsersId;
  String? cartItemsId;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsImage;
  String? itemsPrice;
  String? itemsTime;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsCount;
  String? itemsCat;
  String? itemsActive;
  String? itemsDiscount;

  CartModel(
      {this.itemsprice,
        this.countitems,
        this.cartId,
        this.cartUsersId,
        this.cartItemsId,
        this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsImage,
        this.itemsPrice,
        this.itemsTime,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsCount,
        this.itemsCat,
        this.itemsActive,
        this.itemsDiscount});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersId = json['cart_users_id'];
    cartItemsId = json['cart_items_id'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsImage = json['items_image'];
    itemsPrice = json['items_price'];
    itemsTime = json['items_time'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsCount = json['items_count'];
    itemsCat = json['items_cat'];
    itemsActive = json['items_active'];
    itemsDiscount = json['items_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_users_id'] = this.cartUsersId;
    data['cart_items_id'] = this.cartItemsId;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_image'] = this.itemsImage;
    data['items_price'] = this.itemsPrice;
    data['items_time'] = this.itemsTime;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_count'] = this.itemsCount;
    data['items_cat'] = this.itemsCat;
    data['items_active'] = this.itemsActive;
    data['items_discount'] = this.itemsDiscount;
    return data;
  }
}