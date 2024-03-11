class CategoryModel {
  late String id;
  late String name;
  late String slug;
  late String illustration;
  late List<SubCategoryModel>? subcategories;
  late List<MediaModel> media; // Retirer la nullable (?)

  CategoryModel(
    this.id,
    this.name,
    this.slug,
    this.illustration, {
    this.subcategories,
    required this.media,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      json['id'].toString(),
      json['name'].toString(),
      json['slug'].toString(),
      json['illustration'].toString(),
      subcategories: (json['subcategories'] as List<dynamic>?)
          ?.map((subCategory) => SubCategoryModel.fromJson(subCategory))
          .toList(),
      media: (json['media'] as List<dynamic>?)
              ?.map((media) => MediaModel.fromJson(media))
              .toList() ??
          [], // Assurez-vous que media ne soit jamais nul, utilisez une liste vide par défaut
    );
  }
}

class SubCategoryModel {
  late String id;
  late String name;
  late String slug;

  SubCategoryModel(this.id, this.name, this.slug);

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      json['id'].toString(),
      json['name'].toString(),
      json['slug'].toString(),
    );
  }
}

class MediaModel {
  late String url;
  late String alt;

  MediaModel(this.url, this.alt);

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      json['url'].toString(),
      json['alt'].toString(),
    );
  }
}
