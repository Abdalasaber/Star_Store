import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:star_store/utils/style/app_colors.dart';
import '../../remote_db/dio_helper.dart';
import '../../remote_db/const.dart';

import '../../../model/product_model/product_model.dart';
import '../../../model/product_model/products_single.dart';
import '../../../model/men_clothing_model/men_clothing_model.dart';
import '../../../model/women_clothing_model/women_clothing_model.dart';
import '../../../model/electronics_model/electronics_model.dart';
import '../../../model/jewelery_model/jewelery_model.dart';

part 'product_state.dart';

class CartItem {
  final ProductsModel? product;
  final MenClothingModel? menProduct;
  final WomenClothingModel? womenProduct;
  final JeweleryModel? jeweleryProduct;
  final ElectronicsModel? electronicsProduct;
  int quantity;

  CartItem(
      {this.product,
      this.menProduct,
      this.womenProduct,
      this.jeweleryProduct,
      this.electronicsProduct,
      required this.quantity});
}

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);

  List<String> lab = [
    '',
    '',
  ];

  List<IconData> listIcon = [
    Icons.ballot,
    Icons.dashboard_customize,
  ];

  int quantityCount = 0;

  void incrementMenProduct() {
    quantityCount++;
    emit(IncrementMenProductState());
  }

  void decrementMenProduct() {
    if (quantityCount > 0) {
      quantityCount--;
      emit(DecrementMenProductState());
    }
  }

  void incrementWomenProduct() {
    quantityCount++;
    emit(IncrementWomenProductState());
  }

  void decrementWomenProduct() {
    if (quantityCount > 0) {
      quantityCount--;
      emit(DecrementWomenProductState());
    }
  }

  void incrementJeweleryProduct() {
    quantityCount++;
    emit(IncrementJeweleryProductState());
  }

  void decrementJeweleryProduct() {
    if (quantityCount > 0) {
      quantityCount--;
      emit(DecrementJeweleryProductState());
    }
  }

  void incrementElectronicsProduct() {
    quantityCount++;
    emit(IncrementElectronicsProductState());
  }

  void decrementElectronicsProduct() {
    if (quantityCount > 0) {
      quantityCount--;
      emit(DecrementElectronicsProductState());
    }
  }

  void resetQuantityCount() {
    quantityCount = 0;
    emit(ResetProductState());
  }

  final ValueNotifier<int> tabMenIndexBasicToggle = ValueNotifier(0);
  final ValueNotifier<int> tabWomenIndexBasicToggle = ValueNotifier(0);
  final ValueNotifier<int> tabJeweleryIndexBasicToggle = ValueNotifier(0);
  final ValueNotifier<int> tabElectronicsIndexBasicToggle = ValueNotifier(0);

  tabMenToggleSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabMenIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIcon,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  AppTheme.basieColor,
                ],
                unSelectedBackgroundColors: const [AppTheme.white],
                selectedTextStyle: const TextStyle(
                  color: AppTheme.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: AppTheme.grey,
                  fontSize: 12,
                ),
                labels: lab,
                selectedLabelIndex: (index) {
                  tabMenIndexBasicToggle.value = index;
                  emit(SelectedMenProductState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );
  tabWomenToggleSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabWomenIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIcon,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  AppTheme.basieColor,
                ],
                unSelectedBackgroundColors: const [AppTheme.white],
                selectedTextStyle: const TextStyle(
                  color: AppTheme.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: AppTheme.grey,
                  fontSize: 12,
                ),
                labels: lab,
                selectedLabelIndex: (index) {
                  tabWomenIndexBasicToggle.value = index;
                  emit(SelectedWomenProductState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );
  tabJeweleryToggleSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabJeweleryIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIcon,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  AppTheme.basieColor,
                ],
                unSelectedBackgroundColors: const [AppTheme.white],
                selectedTextStyle: const TextStyle(
                  color: AppTheme.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: AppTheme.grey,
                  fontSize: 12,
                ),
                labels: lab,
                selectedLabelIndex: (index) {
                  tabJeweleryIndexBasicToggle.value = index;
                  emit(SelectedJeweleryProductState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );
  tabElectronicsToggleSwitch() => Column(
        children: [
          ValueListenableBuilder(
            valueListenable: tabElectronicsIndexBasicToggle,
            builder: (context, currentIndex, _) {
              return FlutterToggleTab(
                icons: listIcon,
                width: 25,
                borderRadius: 20,
                height: 28,
                selectedIndex: currentIndex,
                selectedBackgroundColors: const [
                  AppTheme.basieColor,
                ],
                unSelectedBackgroundColors: const [AppTheme.white],
                selectedTextStyle: const TextStyle(
                  color: AppTheme.white,
                  fontSize: 12,
                ),
                unSelectedTextStyle: const TextStyle(
                  color: AppTheme.grey,
                  fontSize: 12,
                ),
                labels: lab,
                selectedLabelIndex: (index) {
                  tabElectronicsIndexBasicToggle.value = index;
                  emit(SelectedElectronicsProductState());
                },
                isScroll: false,
              );
            },
          ),
        ],
      );

  ProductsModel productsModel = ProductsModel();
  MenClothingModel menClothingModel = MenClothingModel();
  WomenClothingModel womenClothingModel = WomenClothingModel();
  ElectronicsModel electronicsModel = ElectronicsModel();
  JeweleryModel jeweleryModel = JeweleryModel();
  // CartModel cartModel = CartModel();

  List<ProductsModel> proList = [];
  List<ProductsSingle> productsSingleList = [];
  List<MenClothingModel> menList = [];
  List<WomenClothingModel> womenList = [];
  List<ElectronicsModel> electronicsList = [];
  List<JeweleryModel> jeweleryList = [];

  List<CartItem> cartList =
      []; // Update to store CartItem instead of ProductsModel

  void addToCart(
      {ProductsModel? product,
      MenClothingModel? menItem,
      WomenClothingModel? womenItem,
      JeweleryModel? jeweleryItem,
      ElectronicsModel? electronicsItem,
      required int quantity}) {
    bool alreadyInCart = false;
    // Check if either menItem or womenItem is provided
    if (menItem == null &&
        womenItem == null &&
        jeweleryItem == null &&
        electronicsItem == null) {
      // Throw an error or handle the case where both items are null
      return;
    }
    // Check if the product is already in the cart
    for (int i = 0; i < cartList.length; i++) {
      if (menItem != null &&
          cartList[i].menProduct != null &&
          cartList[i].menProduct!.id == menItem.id) {
        alreadyInCart = true;
        cartList[i].quantity += quantity;
        break;
      } else if (womenItem != null &&
          cartList[i].menProduct != null &&
          cartList[i].menProduct!.id == womenItem.id) {
        alreadyInCart = true;
        cartList[i].quantity += quantity;
        break;
      } else if (electronicsItem != null &&
          cartList[i].menProduct != null &&
          cartList[i].menProduct!.id == electronicsItem.id) {
        alreadyInCart = true;
        cartList[i].quantity += quantity;
        break;
      } else if (jeweleryItem != null &&
          cartList[i].menProduct != null &&
          cartList[i].menProduct!.id == jeweleryItem.id) {
        alreadyInCart = true;
        cartList[i].quantity += quantity;
        break;
      }
    }
    // If not already in the cart, add the item
    if (!alreadyInCart) {
      if (product != null) {
        cartList.add(CartItem(product: product, quantity: quantity));
      } else if (menItem != null) {
        cartList.add(CartItem(menProduct: menItem, quantity: quantity));
      } else if (womenItem != null) {
        cartList.add(CartItem(womenProduct: womenItem, quantity: quantity));
      } else if (electronicsItem != null) {
        cartList.add(
            CartItem(electronicsProduct: electronicsItem, quantity: quantity));
      } else if (jeweleryItem != null) {
        cartList
            .add(CartItem(jeweleryProduct: jeweleryItem, quantity: quantity));
      }
    }
    emit(SuccessCartDataState());
    // ignore: avoid_print
    print("Cart Items: $cartList");
  }

  void removeFromCart(CartItem cartItem) {
    // Find the index of the cartItem to remove
    int index = cartList
        .indexWhere((item) => item.menProduct!.id == cartItem.menProduct!.id);
    if (index != -1) {
      // Remove the cartItem if found
      cartList.removeAt(index);
      emit(SuccessRemoveFromCartState());
    }
  }

  void decrementQuantity(CartItem cartItem) {
    int index = cartList.indexOf(cartItem);
    if (index != -1 && cartItem.quantity > 1) {
      // Create a new CartItem with the updated quantity
      CartItem updatedCartItem = CartItem(
        product: cartItem.product,
        menProduct: cartItem.menProduct,
        womenProduct: cartItem.womenProduct,
        jeweleryProduct: cartItem.jeweleryProduct,
        electronicsProduct: cartItem.electronicsProduct,
        quantity: cartItem.quantity - 1,
      );
      // Replace the existing CartItem with the updated one
      cartList[index] = updatedCartItem;
      emit(DecrementQuantityState());
    }
  }

  void incrementQuantity(CartItem cartItem) {
    int index = cartList.indexOf(cartItem);
    if (index != -1) {
      // Create a new CartItem with the updated quantity
      CartItem updatedCartItem = CartItem(
        product: cartItem.product,
        menProduct: cartItem.menProduct,
        womenProduct: cartItem.womenProduct,
        jeweleryProduct: cartItem.jeweleryProduct,
        electronicsProduct: cartItem.electronicsProduct,
        quantity: cartItem.quantity + 1,
      );
      // Replace the existing CartItem with the updated one
      cartList[index] = updatedCartItem;
      emit(IncrementQuantityState());
    }
  }

  void removeOneInstance(CartItem cartItem) {
    int index = cartList.indexOf(cartItem);
    if (index != -1) {
      cartList.removeAt(index);
      emit(RemoveOneInstanceState());
    }
  }

  void removeAllInstances(CartItem cartItem) {
    cartList.remove(cartItem);
    emit(RemoveAllInstancesState());
  }

  List<ProductsModel> searchProducts = [];

  void searchProduct({required String input}) {
    searchProducts = proList
        .where((element) =>
            element.title!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(SuccessSearchProductState());
  }

  List<ProductsModel> favoritesProList = [];
  List<MenClothingModel> favoritesMenList = [];
  List<WomenClothingModel> favoritesWomenList = [];
  List<ElectronicsModel> favoritesElectronicsList = [];
  List<JeweleryModel> favoritesJeweleryList = [];

  void favoritesPro(ProductsModel item) {
    if (favoritesProList.contains(item)) {
      favoritesProList.remove(item);
      emit(SuccessAddFavoritesState());
    } else {
      favoritesProList.add(item);
      emit(ErrorRemoveFavoritesState());
    }
  }

  void favoritesMen(MenClothingModel item) {
    if (favoritesMenList.contains(item)) {
      favoritesMenList.remove(item);
      emit(SuccessAddFavoritesMenState());
    } else {
      favoritesMenList.add(item);
      emit(SuccessRemoveFavoritesMenState());
    }
  }

  void favoritesWomen(WomenClothingModel item) {
    if (favoritesWomenList.contains(item)) {
      favoritesWomenList.remove(item);
      emit(SuccessAddFavoritesWomenState());
    } else {
      favoritesWomenList.add(item);
      emit(SuccessRemoveFavoritesWomenState());
    }
  }

  void favoritesElectronics(ElectronicsModel item) {
    if (favoritesElectronicsList.contains(item)) {
      favoritesElectronicsList.remove(item);
      emit(SuccessRemoveFavoritesElectronicsState());
    } else {
      favoritesElectronicsList.add(item);
      emit(SuccessAddFavoritesElectronicsState());
    }
  }

  void favoritesJewelery(JeweleryModel item) {
    if (favoritesJeweleryList.contains(item)) {
      favoritesJeweleryList.remove(item);
      emit(SuccessRemoveFavoritesJeweleryState());
    } else {
      favoritesJeweleryList.add(item);
      emit(SuccessAddFavoritesJeweleryState());
    }
  }

  getAllProduct() {
    proList.clear();
    emit(LoadingAllProductDataState());
    DioHelper.getData(url: endPoint).then((value) {
      if (value.data is List) {
        List<dynamic> responseData = value.data;
        for (var item in responseData) {
          productsModel = ProductsModel.fromJson(item);
          proList.add(productsModel);
        }
      } else if (value.data is Map<String, dynamic>) {
        productsModel = ProductsModel.fromJson(value.data);
        proList.add(productsModel);
      }
      emit(SuccessAllProductDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorAllProductDataState());
    });
  }

  getMenProducts() {
    menList.clear();
    emit(LoadingMenDataState());
    DioHelper.getData(url: menClothingPoint, queryParameters: {}).then((value) {
      // news.add(Articles.fromJson(value.data));
      if (value.data is List) {
        // Handle array response
        List<dynamic> responseData = value.data;
        for (var item in responseData) {
          menClothingModel = MenClothingModel.fromJson(item);
          menList.add(menClothingModel);
        }
      } else if (value.data is Map<String, dynamic>) {
        // Handle single object response
        menClothingModel = MenClothingModel.fromJson(value.data);
        menList.add(menClothingModel);
      }
      emit(SuccessMenDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorMenDataState());
    });
  }

  getWomenProducts() {
    womenList.clear();
    emit(LoadingWomenDataState());
    DioHelper.getData(url: womenClothingPoint).then((value) {
      if (value.data is List) {
        List<dynamic> responseData = value.data;
        for (var item in responseData) {
          womenClothingModel = WomenClothingModel.fromJson(item);
          womenList.add(womenClothingModel);
        }
      } else if (value.data is Map<String, dynamic>) {
        womenClothingModel = WomenClothingModel.fromJson(value.data);
        womenList.add(womenClothingModel);
      }
      emit(SuccessWomenDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorWomenDataState());
    });
  }

  getElectronicsProducts() {
    electronicsList.clear();
    emit(LoadingElectronicsDataState());
    DioHelper.getData(url: electronicsEndPoint).then((value) {
      if (value.data is List) {
        List<dynamic> responseData = value.data;
        for (var item in responseData) {
          electronicsModel = ElectronicsModel.fromJson(item);
          electronicsList.add(electronicsModel);
        }
      } else if (value.data is Map<String, dynamic>) {
        electronicsModel = ElectronicsModel.fromJson(value.data);
        electronicsList.add(electronicsModel);
      }
      // electronicsModel = ElectronicsModel.fromJson(value.data);
      // electronicsList.add(ElectronicsModel.fromJson(value.data));
      // news= articlesModel.articles!;
      emit(SuccessElectronicsDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorElectronicsDataState());
    });
  }

  getJeweleryProducts() {
    jeweleryList.clear();
    emit(LoadingJeweleryDataState());
    DioHelper.getData(url: jeweleryEndPoint).then((value) {
      if (value.data is List) {
        List<dynamic> responseData = value.data;
        for (var item in responseData) {
          jeweleryModel = JeweleryModel.fromJson(item);
          jeweleryList.add(jeweleryModel);
        }
      } else if (value.data is Map<String, dynamic>) {
        jeweleryModel = JeweleryModel.fromJson(value.data);
        jeweleryList.add(jeweleryModel);
      }
      emit(LoadingJeweleryDataState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error);
      emit(ErrorJeweleryDataState());
    });
  }
}
