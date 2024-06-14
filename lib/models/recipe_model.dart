class RecipeModel {
  String docId;
  String userEmail;
  String recipeName;
  String category;

  RecipeModel(
      {required this.docId,
        required this.userEmail,
      required this.recipeName,
      required this.category});

  factory RecipeModel.fromMap(String docId, Map<String, dynamic> map) {
    return RecipeModel(
      docId: docId,
        userEmail: map['userEmail'],
        recipeName: map['recipeName'],
        category: map['category']);
  }
}
