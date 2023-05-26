class ReviewsModel {
  String id;
  String name;
  String imageUrl;
  double rating;
  String date;
  String review;
  bool helpfull;
  ReviewsModel(this.id, this.imageUrl, this.name, this.date, this.rating,
      this.review, this.helpfull);
}
