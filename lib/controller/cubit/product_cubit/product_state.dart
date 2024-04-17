part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class SuccessAddFavoritesState extends ProductState {}

class ErrorRemoveFavoritesState extends ProductState {}

class SelectedMenProductState extends ProductState {}

class SelectedWomenProductState extends ProductState {}

class SelectedElectronicsProductState extends ProductState {}

class SelectedJeweleryProductState extends ProductState {}

// ----------------------Products State----------------------------
class SuccessSearchProductState extends ProductState {}

class SuccessAddToCartState extends ProductState {}

class SuccessRemoveFromCartState extends ProductState {}

class ErrorAddAllProductsToCartState extends ProductState {}

class LoadingAllProductDataState extends ProductState {}

class SuccessAllProductDataState extends ProductState {}

class ErrorAllProductDataState extends ProductState {}

class LoadingSingleProductDataState extends ProductState {}

class SuccessSingleProductDataState extends ProductState {}

class ErrorSingleProductDataState extends ProductState {}

class LoadingMenDataState extends ProductState {}

class SuccessMenDataState extends ProductState {}

class ErrorMenDataState extends ProductState {}

class LoadingWomenDataState extends ProductState {}

class SuccessWomenDataState extends ProductState {}

class ErrorWomenDataState extends ProductState {}

class LoadingJeweleryDataState extends ProductState {}

class SuccessJeweleryDataState extends ProductState {}

class ErrorJeweleryDataState extends ProductState {}

class LoadingElectronicsDataState extends ProductState {}

class SuccessElectronicsDataState extends ProductState {}

class ErrorElectronicsDataState extends ProductState {}

// ----------------------Favorites State----------------------------

class SuccessAddFavoritesMenState extends ProductState {}

class SuccessRemoveFavoritesMenState extends ProductState {}

class SuccessAddFavoritesWomenState extends ProductState {}

class SuccessRemoveFavoritesWomenState extends ProductState {}

class SuccessAddFavoritesJeweleryState extends ProductState {}

class SuccessRemoveFavoritesJeweleryState extends ProductState {}

class SuccessAddFavoritesElectronicsState extends ProductState {}

class SuccessRemoveFavoritesElectronicsState extends ProductState {}

// ----------------------Cart State----------------------------

class SuccessCartDataState extends ProductState {}

class DecrementQuantityState extends ProductState {}

class IncrementQuantityState extends ProductState {}

class RemoveOneInstanceState extends ProductState {}

class RemoveAllInstancesState extends ProductState {}

class RemoverCartState extends ProductState {}

class IncrementMenProductState extends ProductState {}

class DecrementMenProductState extends ProductState {}

class IncrementWomenProductState extends ProductState {}

class DecrementWomenProductState extends ProductState {}

class IncrementJeweleryProductState extends ProductState {}

class DecrementJeweleryProductState extends ProductState {}

class IncrementElectronicsProductState extends ProductState {}

class DecrementElectronicsProductState extends ProductState {}

class ResetProductState extends ProductState {}
