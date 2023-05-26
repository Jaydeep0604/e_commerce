import 'package:e_commerce/ui/address/shipping_address.dart';
import 'package:e_commerce/ui/bag/bag_checkout_screen.dart';
import 'package:e_commerce/ui/bag/bagscreen.dart';
import 'package:e_commerce/ui/base/base.dart';
import 'package:e_commerce/ui/fashionsale/home_items_screen.dart';
import 'package:e_commerce/ui/forgot/forgetscreen.dart';
import 'package:e_commerce/ui/login/loginscreen.dart';
import 'package:e_commerce/ui/myorder/cancelled_screen.dart';
import 'package:e_commerce/ui/myorder/delivered_screen.dart';
import 'package:e_commerce/ui/myorder/my_order_screen.dart';
import 'package:e_commerce/ui/myorder/order_details_screen.dart';
import 'package:e_commerce/ui/myorder/processing_screen.dart';
import 'package:e_commerce/ui/new_collection/new_collection_screen.dart';
import 'package:e_commerce/ui/payment/payment_card_screen.dart';
import 'package:e_commerce/ui/register/registerscreen.dart';
import 'package:e_commerce/ui/settings/settings_screen.dart';
import 'package:e_commerce/ui/shop/choose_categories_screen.dart';
import 'package:e_commerce/ui/favourite/favouritescreen.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/ui/profile/profilescreen.dart';
import 'package:e_commerce/ui/shop/choose_category/all_category_screen.dart';
import 'package:e_commerce/ui/shop/choose_category/categories_screen.dart';
import 'package:e_commerce/ui/shop/kidscreen.dart';
import 'package:e_commerce/ui/shop/menscreen.dart';
import 'package:e_commerce/ui/shop/womenscreen.dart';
import 'package:e_commerce/ui/splash/splashscreen.dart';
import 'package:e_commerce/ui/success/success_screen.dart';
import 'package:e_commerce/ui/success/success_second_screen.dart';
import 'package:e_commerce/utils/route_transition.dart';
import 'package:flutter/material.dart';

class ECRoutes {
  static const homeScreen = HomeScreen.homeScreen;
  static const profilePage = ProfileScreen.profileScreen;
  static const shippingAddress = ShippinAddress.shippinAddress;
  static const bagCheckoutScreen = BagCheckoutScreen.bagCheckoutScreen;
  static const bagScreen = BagScreen.bagScreen;
  static const base = Base.base;
  static const homeItemsScreen = HomeItemsScreen.homeItemsScreen;
  static const favouriteScreen = FavouriteScreen.favouriteScreen;
  static const forgrtScreen = ForgrtScreen.forgrtScreen;
  static const loginScreen = LoginScreen.loginScreen;
  static const cancelledScreen = CancelledScreen.cancelledScreen;
  static const deliveredScreen = DeliveredScreen.deliveredScreen;
  static const myOrderScreen = MyOrderScreen.myOrderScreen;
  static const orderDetailsScreen = OrderDetailsScreen.orderDetailsScreen;
  static const processingScreen = ProcessingScreen.processingScreen;
  static const newCollectionScreen = NewCollectionScreen.newCollectionScreen;
  static const paymentCardScreen = PaymentCardScreen.paymentCardScreen;
  static const profileScreen = ProfileScreen.profileScreen;
  static const registerScreen = RegisterScreen.registerScreen;
  static const settingScreen = SettingsScreen.settingScreen;
  static const allCategoryScreen = AllCategoryScreen.allCategoryScreen;
  static const categoriesScreen = CategoriesScreen.categoriesScreen;
  static const chooseCategoriesScreen =
      ChooseCategoriesScreen.chooseCategoriesScreen;
  static const kidScreen = KidScreen.kidScreen;
  static const menScreen = MenScreen.menScreen;
  static const womenScreen = WomenScreen.womenScreen;
  static const splashScreen = SplashScreen.splashScreen;
  static const successScreen = SuccessScreen.successScreen;
  static const successSecondScreen = SuccessSecondScreen.successSecondScreen;

  static Map<String, WidgetBuilder> generateRoute(
      BuildContext context, int index, RouteSettings settings) {
    Map<int, Widget> routeName = {
      0: HomeScreen(),
      1: ChooseCategoriesScreen(),
      2: BagScreen(),
      3: FavouriteScreen(),
      4: ProfileScreen()
    };
    return {
      HomeScreen.homeScreen: (context) => routeName[index]!,
      ProfileScreen.profileScreen: (context) => ProfileScreen(),
      ChooseCategoriesScreen.chooseCategoriesScreen:((context) => ChooseCategoriesScreen()),
      BagScreen.bagScreen:((context) => BagScreen()),
      FavouriteScreen.favouriteScreen:(context) => FavouriteScreen(),
      // SettingsScreen.settingScreen: (context) => SettingsScreen(),
    };
  }

  static Route<dynamic> generateGlobalRoute(RouteSettings settings) {
    switch (settings.name) {  
      // case Base.base:
      //   return MaterialPageRoute(
      //       builder: (context) => Base(), settings: settings);
      case SplashScreen.splashScreen:
        return MaterialPageRoute(
            builder: (context) => SplashScreen(), settings: settings);
      case SettingsScreen.settingScreen:
        return SlideRightRouteWithBuilder(
          builder: (context,a1,a2) => SettingsScreen(),settings: settings);

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
