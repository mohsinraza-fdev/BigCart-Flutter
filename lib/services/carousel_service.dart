import 'package:big_cart/models/carousel_item_model.dart';
import 'package:injectable/injectable.dart';
import '../constants/asset_constants.dart';

@lazySingleton
class CarouselService {
  List<CarouselItem> getCarouselList() {
    List<CarouselItem> carouselList = <CarouselItem>[];
    carouselList.add(CarouselItem(
        text: '20% off on your\nfirst purchase',
        imagePath: AssetConstants.bannerImage));
    carouselList.add(CarouselItem(
        text: '20% off on your\nfirst purchase',
        imagePath: AssetConstants.bannerImage));
    carouselList.add(CarouselItem(
        text: '20% off on your\nfirst purchase',
        imagePath: AssetConstants.bannerImage));
    carouselList.add(CarouselItem(
        text: '20% off on your\nfirst purchase',
        imagePath: AssetConstants.bannerImage));
    return carouselList;
  }
}
