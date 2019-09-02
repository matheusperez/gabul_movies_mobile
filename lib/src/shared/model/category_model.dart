class CategoryModel {
  int id;
  String name;

  CategoryModel({this.id, this.name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  static List<CategoryModel> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<CategoryModel>((item) => CategoryModel.fromJson(item))
        .toList();
  }
  

}