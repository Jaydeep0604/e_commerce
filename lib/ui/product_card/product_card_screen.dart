import 'package:e_commerce/model/home_new_List_model.dart';
import 'package:e_commerce/ui/home/homescreen.dart';
import 'package:e_commerce/ui/rating&riview/rating_and_riview_screen.dart';
import 'package:e_commerce/ui/register/registerscreen.dart';
import 'package:e_commerce/utils/app_colors.dart';
import 'package:e_commerce/utils/message.dart';
import 'package:e_commerce/widget/appbar/common_appbar.dart';
import 'package:e_commerce/widget/appbar/common_appbar_content.dart';
import 'package:e_commerce/widget/home_items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:expandable/expandable.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductCardScreen extends StatefulWidget {
  static String productCardScreen = "/productCardScreen";
  const ProductCardScreen({Key? key}) : super(key: key);

  @override
  State<ProductCardScreen> createState() => _ProductCardScreenState();
}

class _ProductCardScreenState extends State<ProductCardScreen> {
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  late Color screenPickerColor; // Color for picker shown in Card on the screen.
  late Color dialogPickerColor; // Color for picker in dialog using onChanged
  late Color dialogSelectColor; // Color for picker using color select dialog.

  // Define some custom colors for the custom picker segment.
  // The 'guide' color values are from
  // https://material.io/design/color/the-color-system.html#color-theme-creation
  static const Color guidePrimary = Color(0xFF6200EE);
  static const Color guidePrimaryVariant = Color(0xFF3700B3);
  static const Color guideSecondary = Color(0xFF03DAC6);
  static const Color guideSecondaryVariant = Color(0xFF018786);
  static const Color guideError = Color(0xFFB00020);
  static const Color guideErrorDark = Color(0xFFCF6679);
  static const Color blueBlues = Color(0xFF174378);

  // Make a custom ColorSwatch to name map from the above custom colors.
  final Map<ColorSwatch<Object>, String> colorsNameMap =
      <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
    ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
    ColorTools.createPrimarySwatch(guideError): 'Guide Error',
    ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
    ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
  };

  @override
  void initState() {
    screenPickerColor = Colors.blue;
    dialogPickerColor = Colors.red;
    dialogSelectColor = const Color(0xFFA239CA);
    super.initState();
  }

  List<HomeNewListModel> images1 = [
    //   ("id", "imageurl", "discount", "rating", "total_rating", "like", "com_name", "title", "old_price", "new_price")
    HomeNewListModel('0', "assets/images/img_image_20.png", "", 3, "10", "",
        "Sitlly", "Evening Dress", "19", "15"),
    HomeNewListModel('1', "assets/images/img_image2_184x148.png", "", 3.1, "12",
        "", "Dorothy Perkins", "Sport Dress", "15", "12"),
    HomeNewListModel('2', "assets/images/img_image_20.png", "", 2.5, "8", "",
        "Sitlly", "Evening Dress", "20", "18"),
    HomeNewListModel('3', "assets/images/img_image_17.png", "", 2.5, "5", "",
        "Dorothy Perkins", "Sport Dress", "25", "30"),
  ];

  List<String> gridList = ["XS", "S", "M", "L", "XL"];
  int gridChacked = -1;

  bool like = false;
  void liked() {
    setState(() {
      like = !like;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppBar(
        context: context,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomAppContent(
                    isNeedCenterTitle: "Short dress",
                    isNeedLeading: false,
                    isNeedProfile: true,
                    leadingIcon: GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            "assets/icons/back_icon.png",
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    action: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () {
                            ECToast.instance
                                .showError(context, "Comming soon...");
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              "assets/images/img_share.svg",
                              width: 20,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )))),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior: NoGlow(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 413,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset(
                      "assets/images/img_image_413x275.png",
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      "assets/images/img_image_413x276.png",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (() {
                          showModalBottomSheet(
                              backgroundColor: AppColors.backgroundColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.0))),
                              isDismissible: false,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                final MediaQueryData mediaQueryData =
                                    MediaQuery.of(context);

                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Padding(
                                    padding: mediaQueryData.viewInsets,
                                    child: ScrollConfiguration(
                                      behavior: NoGlow(),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                                top: 20,
                                                // bottom: 10
                                              ),
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Select size",
                                                  style: TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 16,
                                                right: 16,
                                                top: 24,
                                              ),
                                              child: Container(
                                                child: GridView.builder(
                                                    itemCount: 5,
                                                    shrinkWrap: true,
                                                    primary: false,
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 3,
                                                            childAspectRatio: 2,
                                                            crossAxisSpacing:
                                                                22,
                                                            mainAxisSpacing:
                                                                12),
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return GestureDetector(
                                                        onTap: (() {
                                                          setState(() {
                                                            gridChacked = index;
                                                          });
                                                        }),
                                                        child: Container(
                                                          height: 40,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color: gridChacked ==
                                                                      index
                                                                  ? AppColors
                                                                      .primaryColor
                                                                  : AppColors
                                                                      .backgroundColor,
                                                              border: Border.all(
                                                                  color: gridChacked ==
                                                                          index
                                                                      ? AppColors
                                                                          .primaryColor
                                                                      : AppColors
                                                                          .white),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Center(
                                                              child: Text(
                                                            "${gridList[index]}",
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .white),
                                                          )),
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            ),
                                            SizedBox(
                                              child: Opacity(
                                                  opacity: 0.4,
                                                  child: Divider(
                                                    thickness: 1,
                                                    color: AppColors.greyColor,
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16, right: 16, top: 10),
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Size info",
                                                        style: TextStyle(
                                                            color:
                                                                AppColors.white,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    Image.asset(
                                                      "assets/icons/right.png",
                                                      color: AppColors.white,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              child: Opacity(
                                                  opacity: 0.4,
                                                  child: Divider(
                                                    thickness: 1,
                                                    color: AppColors.greyColor,
                                                  )),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16,
                                                  left: 16,
                                                  bottom: 20),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 48,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle),
                                                child: TextButton(
                                                    style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            AppColors
                                                                .primaryColor,
                                                        primary:
                                                            AppColors.white,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50))),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("ADD TO CART")),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                              });
                        }),
                        child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    "Size",
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Image.asset(
                                  "assets/icons/arrow_down.png",
                                  color: AppColors.white,
                                  scale: 0.9,
                                )
                              ],
                            ))),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 40,
                            width: 138,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ColorIndicator(
                                width: 138,
                                height: 44,
                                borderRadius: 4,
                                color: dialogPickerColor,
                                onSelectFocus: false,
                                onSelect: () async {
                                  final Color colorBeforeDialog =
                                      dialogPickerColor;
                                  if (!(await colorPickerDialog())) {
                                    setState(() {
                                      dialogPickerColor = colorBeforeDialog;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                          Container(
                              height: 40,
                              child: Center(
                                  child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: GestureDetector(
                                      onTap: () {
                                        colorPickerDialog();
                                      },
                                      child: Text(
                                        "Select Color",
                                        style:
                                            TextStyle(color: AppColors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "assets/icons/arrow_down.png",
                                    color: AppColors.white,
                                    scale: 0.9,
                                  )
                                ],
                              ))),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          color: AppColors.darkColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: GestureDetector(
                        onTap: liked,
                        child: Transform.scale(
                            scale: 0.9,
                            child: like
                                ? SvgPicture.asset(
                                    "assets/images/img_favorite_red_400.svg",
                                  )
                                : SvgPicture.asset(
                                    "assets/images/img_favorite.svg",
                                  )),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 22),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "H&M",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 24),
                        ),
                      ),
                      Text("\$19.99",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 24))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Short black dress",
                        style: TextStyle(
                            color: AppColors.greyColor, fontSize: 11))),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RatingAndReviewScreen()));
                    },
                    child: Row(
                      children: [
                        SmoothStarRating(
                          borderColor: AppColors.blck,
                          allowHalfRating: true,
                          color: AppColors.ratingColor,
                          spacing: 0,
                          isReadOnly: true,
                          rating: 2,
                          size: 18,
                          starCount: 5,
                          // onRated: (value) {
                          //   setState(() {
                          //     rating = value;
                          //   });
                          // },
                        ),
                        Text(
                          "(10)",
                          style: TextStyle(
                              fontSize: 10, color: AppColors.greyColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Container(
                  child: Text(
                    "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
              SizedBox(
                child: Opacity(
                    opacity: 0.4,
                    child: Divider(
                      thickness: 1,
                      color: AppColors.greyColor,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Shipping info",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 16),
                        ),
                      ),
                      Image.asset(
                        "assets/icons/right.png",
                        color: AppColors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Opacity(
                    opacity: 0.4,
                    child: Divider(
                      thickness: 1,
                      color: AppColors.greyColor,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Support",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 16),
                        ),
                      ),
                      Image.asset(
                        "assets/icons/right.png",
                        color: AppColors.white,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: Opacity(
                    opacity: 0.4,
                    child: Divider(
                      thickness: 1,
                      color: AppColors.greyColor,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 42, right: 16, top: 10),
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "You can also like this",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 16),
                        ),
                      ),
                      Text(
                        "12 items",
                        style: TextStyle(color: AppColors.greyColor),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, top: 22),
                child: Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    // physics: AlwaysScrollableScrollPhysics(
                    // ),
                    scrollDirection: Axis.horizontal,
                    itemCount: images1.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => "SpecialsCombosScreen"()),
                            // );
                          },
                          child: GestureDetector(
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProductCardScreen()));
                            }),
                            child: HomeItemsListWidget(
                                homeNewListModel: images1[index]),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 15,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ExpandableNotifier(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 24, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 48,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    primary: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  // globalNavigationKey.currentState?.push(
                  //   SlideRightRoute(
                  //     page: BagCheckoutScreen(),
                  //     settings: RouteSettings(
                  //       name: BagCheckoutScreen.bagCheckoutScreen,
                  //     ),
                  //   ),
                  // );
                  // Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => BagCheckoutScreen()));
                },
                child: Text("ADD TO CART")),
          ),
        ),
      ),
    );
  }

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) =>
          setState(() => dialogPickerColor = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodyMedium,
      colorCodePrefixStyle: Theme.of(context).textTheme.bodySmall,
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      customColorSwatchesAndNames: colorsNameMap,
    ).showPickerDialog(
      context,
      actionsPadding: const EdgeInsets.all(16),
      constraints:
          const BoxConstraints(minHeight: 480, minWidth: 300, maxWidth: 320),
    );
  }
}
