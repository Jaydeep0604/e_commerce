import 'package:flutter/material.dart';

class HomeNewListModel {
  final String id;
  final String imageurl;
  final String discount;
  final double rating;
  final String total_rating;
  final String like;
  final String com_name;
  final String title;
  final String old_price;
  final String new_price;
  HomeNewListModel(
      this.id,
      this.imageurl,
      this.discount,
      this.rating,
      this.total_rating,
      this.like,
      this.com_name,
      this.title,
      this.old_price,
      this.new_price);
}
