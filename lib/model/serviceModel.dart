import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/model/freelanceModel.dart';

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
  late String? description;
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
  late List<String>? subCategory;
  late String videoUrl;
  late int like;
  late bool isPublish;
  late String categoryId;
  late String isGift;
  late String likeUser;
  late String orderCount;
  late String average;
  late String commandeEncours;
  late FreelanceModel freelance;
  //late UserModel user;
  //late CategoryModel category;
  late String urlDefault;

  late List<MediaModel>? media;

  ServiceModel(
      {required this.id,
      required this.title,
      required this.slug,
      required this.userSlug,
      required this.basicPrice,
      required this.serviceNumero,
      required this.categoryId,
      this.description,
      this.subCategory,
      this.media,
      required this.freelance}

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
    return ServiceModel(
        id: json['id'],
        title: json['title'],
        slug: json['slug'],
        userSlug: json['userSlug'],
        basicPrice: json['basic_price'],
        serviceNumero: json['service_numero'],
        categoryId: json['category_id'],
        description: json['description'],
        //subCategory: List<String>.from(['sub_category']),
        freelance: FreelanceModel.fromJson(json['freelance']),
        media: (json['media'] as List<dynamic>?)
                ?.map((media) => MediaModel.fromJson(media))
                .toList() ??
            []

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
