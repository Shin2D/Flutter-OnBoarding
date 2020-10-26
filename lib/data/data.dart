import 'package:flutter/material.dart';

class SliderModel{
  String imagePath;
  String title;
  String desc;

  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath){
    imagePath = getImagePath;
  }
  void setTitle(String getTitle){
    title = getTitle;
  }
  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imagePath;
  }
  String getTitle(){
    return title;
  }
  String getDesc(){
    return desc;
  }

}

List<SliderModel> getSlides(){
  List<SliderModel>  slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setImageAssetPath("assets/illustration.png");
  sliderModel.setTitle("Search");
  sliderModel.setDesc("Discover Restaurants offering the best fast food food near you on Foodwa");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setImageAssetPath("assets/illustration2.png");
  sliderModel.setTitle("Order");
  sliderModel.setDesc("Our veggie plan is filled with delicious seasonal vegetables, whole grains, beautiful cheeses and vegetarian proteins");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setImageAssetPath("assets/illustration3.png");
  sliderModel.setTitle("Eat");
  sliderModel.setDesc("Food delivery or pickup from local restaurants, Explore restaurants that deliver near you.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();


  return slides;
}
