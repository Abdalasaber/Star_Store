import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';
import 'package:star_store/controller/cubit/product_cubit/product_cubit.dart';
import '../../../../utils/style/app_colors.dart';
import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_text.dart';
import '../payment/payment_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ProductCubit cubit;

  @override
  void initState() {
    cubit = ProductCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        // Retrieve the list of cart items from the cube
        List<CartItem> cartItems = cubit.cartList;
        // Calculate total quantity
        int totalQuantity =
            cartItems.fold(0, (sum, item) => sum + item.quantity);
        // Calculate total price
        double totalPrice = 0;
        for (var item in cartItems) {
          if (item.product != null) {
            totalPrice += (item.product!.price ?? 0) * item.quantity;
          } else if (item.menProduct != null) {
            totalPrice += (item.menProduct!.price ?? 0) * item.quantity;
          } else if (item.womenProduct != null) {
            totalPrice += (item.womenProduct!.price ?? 0) * item.quantity;
          } else if (item.jeweleryProduct != null) {
            // Check if the item is an ElectronicsModel
            totalPrice += (item.jeweleryProduct!.price ?? 0) * item.quantity;
          } else if (item.electronicsProduct != null) {
            // Check if the item is an ElectronicsModel
            totalPrice += (item.electronicsProduct!.price ?? 0) * item.quantity;
          }
        }

        return Scaffold(
            backgroundColor: AppTheme.white,
            appBar: AppBar(
              backgroundColor: AppTheme.basieColor,
              elevation: 0.0,
              title: Center(
                child: DefaultText(
                  text: '$totalQuantity Products in Cart ',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.white,
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: SingleChildScrollView(
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        cubit.cartList.isEmpty
                            ? Stack(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/empty.svg',
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 60.h, left: 5.w),
                                    child: DefaultText(
                                      text: 'Oops, No thing here!',
                                      fontSize: 25.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.textColor,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(
                                height: 80.h,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 3.h,
                                  ),
                                  itemCount: cartItems.length,
                                  itemBuilder: (context, index) {
                                    final CartItem cartItem = cartItems[index];
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.w),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppTheme.red,
                                        ),
                                        child: Dismissible(
                                          background: Padding(
                                            padding:
                                                EdgeInsets.only(left: 75.0.w),
                                            child: Icon(
                                              Icons.delete,
                                              color: AppTheme.white,
                                              size: 5.h,
                                            ),
                                          ),
                                          key: UniqueKey(),
                                          direction:
                                              DismissDirection.endToStart,
                                          onDismissed: (dismissed) async {
                                            cubit.removeAllInstances(cartItem);
                                            IconSnackBar.show(context,
                                                snackBarType:
                                                    SnackBarType.success,
                                                label: 'Product Deleted');
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0.w),
                                            child: Container(
                                              height: 20.5.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppTheme.black12),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: AppTheme.white),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 3.w,
                                                    vertical: 1.h),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 16.h,
                                                      width: 20.w,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: AppTheme
                                                                  .black12),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                            cartItem.menProduct !=
                                                                    null
                                                                ? cartItem
                                                                        .menProduct!
                                                                        .image ??
                                                                    'Product Image'
                                                                : cartItem.womenProduct !=
                                                                        null
                                                                    ? cartItem
                                                                            .womenProduct!
                                                                            .image ??
                                                                        'Product Image'
                                                                    : cartItem.jeweleryProduct !=
                                                                            null
                                                                        ? cartItem.jeweleryProduct!.image ??
                                                                            'Product Image'
                                                                        : cartItem.electronicsProduct !=
                                                                                null
                                                                            ? cartItem.electronicsProduct!.image ??
                                                                                'Product Image'
                                                                            : 'Product Image',
                                                          )),
                                                          color: Colors.white),
                                                    ),
                                                    Expanded(
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 2.w),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              DefaultText(
                                                                text: cartItem
                                                                            .product !=
                                                                        null
                                                                    ? cartItem
                                                                            .product!
                                                                            .title ??
                                                                        'Product Title'
                                                                    : cartItem.menProduct !=
                                                                            null
                                                                        ? cartItem.menProduct!.title ??
                                                                            'Product Title'
                                                                        : cartItem.womenProduct !=
                                                                                null
                                                                            ? cartItem.womenProduct!.title ??
                                                                                'Product Title'
                                                                            : cartItem.jeweleryProduct != null
                                                                                ? cartItem.jeweleryProduct!.title ?? 'Product Title'
                                                                                : cartItem.electronicsProduct != null
                                                                                    ? cartItem.electronicsProduct!.title ?? 'Product Title'
                                                                                    : 'Product Title',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 2,
                                                                fontSize: 12.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              SizedBox(
                                                                height: 1.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      cubit.decrementQuantity(
                                                                          cartItem);
                                                                    },
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .remove),
                                                                  ),
                                                                  Container(
                                                                      height:
                                                                          5.h,
                                                                      width:
                                                                          8.w,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                AppTheme.black12),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            DefaultText(
                                                                          text:
                                                                              '${cartItem.quantity}',
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      )),
                                                                  IconButton(
                                                                    onPressed:
                                                                        () {
                                                                      if (cartItem
                                                                              .quantity !=
                                                                          cubit
                                                                              .menList[index]
                                                                              .rating!
                                                                              .count!) {
                                                                        cubit.incrementQuantity(
                                                                            cartItem);
                                                                      } else {
                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            barrierDismissible:
                                                                                false,
                                                                            builder: (context) =>
                                                                                AlertDialog(
                                                                                  content: DefaultText(text: 'You cant add mor cuz This item it just has ${cubit.menList[index].rating!.count!} Pieces'),
                                                                                  actions: [
                                                                                    IconButton(
                                                                                      onPressed: () {
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      icon: const Icon(Icons.done),
                                                                                    )
                                                                                  ],
                                                                                ));
                                                                      }
                                                                    },
                                                                    icon: const Icon(
                                                                        Icons
                                                                            .add),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 20.w,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        DefaultText(
                                                                      text:
                                                                          '\$${((cartItem.menProduct != null ? cartItem.menProduct!.price : cartItem.womenProduct != null ? cartItem.womenProduct!.price : cartItem.jeweleryProduct != null ? cartItem.jeweleryProduct!.price : cartItem.electronicsProduct != null ? cartItem.electronicsProduct!.price : 0)! * cartItem.quantity)}',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            floatingActionButton: Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText(
                            text: 'In total', fontWeight: FontWeight.bold),
                        DefaultText(
                          text: '\$${totalPrice.toStringAsFixed(2)}',
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  DefaultElevatedButtonBlue(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const PaymentScreen(),
                              type: PageTransitionType.fade,
                              alignment: Alignment.bottomCenter,
                              duration: const Duration(seconds: 1)));
                    },
                    text: 'Checkout',
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(AppTheme.basieColor)),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
