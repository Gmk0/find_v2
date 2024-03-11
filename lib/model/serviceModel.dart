class ServiceModel {
  late String id;
  late String title;
  late String slug;
  late String userSlug;
  late String basicPrice;
  late String serviceNumero;
  // late String image;
  //late List<String> files;
  late String tag;
  late String description;
  late String basicSupport;
  late String basicRevision;
  late String basicDeliveryTime;
  late String premiumPrice;
  late String premiumSupport;
  late String premiumRevision;
  late String premiumDeliveryTime;
  late String extraPrice;
  late String extraSupport;
  late String extraRevision;
  late String extraDeliveryTime;
  late String example;
  late String format;
  late bool needService;
  late String deliveryTimeUnit;
  late String subCategory;
  late String videoUrl;
  late int like;
  late bool isPublish;
  late int categoryId;
  late String isGift;
  late String likeUser;
  late String orderCount;
  late String average;
  late String commandeEncours;
  //late FreelanceModel freelance;
  //late UserModel user;
  //late CategoryModel category;
  late String urlDefault;

  ServiceModel(
    this.id,
    this.title,
    this.slug,
    this.userSlug,
    this.basicPrice,
    this.serviceNumero,
    // //this.image,

    //this.files,
    //this.tag,
    //this.description,
    //this.basicSupport,
    //this.basicRevision,
    //this.basicDeliveryTime,
    //this.premiumPrice,
    //this.premiumSupport,
    //this.premiumRevision,
    //this.premiumDeliveryTime,
    //this.extraPrice,
    //this.extraSupport,
    //this.extraRevision,
    //this.extraDeliveryTime,
    //this.example,
    //this.format,
    //this.needService,
    //this.deliveryTimeUnit,
    //this.subCategory,
    //this.videoUrl,
    //this.like,
    //this.isPublish,
    //this.categoryId,
    //this.isGift,
    //this.likeUser,
    //this.orderCount,
    //this.average,
    //this.commandeEncours,
    // //this.freelance,
    //this.user,
    //this.category,
    //this.urlDefault,
  );

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(json['id'], json['title'], json['slug'],
        json['userSlug'], json['basic_price'], json['service_numero']
        ////json['image'],
        //files: List<String>.fro//m(json['files'] ?? [])
        //  json['tag'],
        //  json['description'],
        //  json['basic_support'],
        //  json['basic_revision'],
        //  json['basic_delivery_time'],
        //  json['premium_price'],
        //  json['premium_support'],
        //  json['premium_revision'],
        //  json['premium_delivery_time'],
        //  json['extra_price'],
        //  json['extra_support'],
        //  json['extra_revision'],
        //  json['extra_delivery_time'],
        //  json['example'],
        //  json['format'],
        //  json['need_service'],
        //  json['delivery_time_unit'],
        //  json['sub_category'],
        //  json['video_url'],
        //  json['like'],
        //  json['is_publish'],
        //  json['category_id'],
        //  json['is_gift'],
        //  json['likeUser'],
        //  json['orderCount'],
        //  json['average'],
        //  json['commandeEncours'],
        ////json['freelance'] = FreelanceModel.fr//omJso//n(json['freelance']),
        ////json['user'] = UserModel.fr//omJso//n(json['user']),
        ////json['category'] = CategoryModel.fr//omJso//n(json['category']!),
        //  json['url_default']
        );
  }
}

class User {
  // Propriétés de l'utilisateur
}
