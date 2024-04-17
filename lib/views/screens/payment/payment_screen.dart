import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:sizer/sizer.dart';
import 'package:star_store/app_route/app_route.dart';
import 'package:star_store/utils/style/app_colors.dart';

import '../../widget/default_elevated_button_blue.dart';
import '../../widget/default_text.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppTheme.basieColor,
          elevation: 0.0,
          title: Padding(
            padding: EdgeInsets.only(left: 17.w),
            child: DefaultText(
              text: 'Payment Step',
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: AppTheme.white,
            ),
          ),
        ),
        body: Column(children: [
          CreditCardWidget(
            cardBgColor: AppTheme.bankKsaBlack,
            enableFloatingCard: true,
            glassmorphismConfig: _getGlassmorphismConfig(),
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            bankName: 'Payment Bank',
            showBackView: isCvvFocused,
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            isSwipeGestureEnabled: true,
            onCreditCardWidgetChange: (CreditCardBrand brand) {},
          ),
          // CreditCardWidget(
          //   enableFloatingCard: true,
          //
          //   cardBgColor: AppTheme.greenColor,
          //   cardNumber: cardNumber,
          //   expiryDate: expiryDate,
          //   cardHolderName: cardHolderName,
          //   cvvCode: cvvCode,
          //   isHolderNameVisible: true,
          //
          //   showBackView:
          //       isCvvFocused,
          //   onCreditCardWidgetChange: (CreditCardBrand
          //       brand) {},
          // ),
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              CreditCardForm(
                formKey: formKey,
                obscureCvv: true,
                obscureNumber: true,
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                cardHolderName: cardHolderName,
                isHolderNameVisible: true,
                isCardNumberVisible: true,
                isExpiryDateVisible: true,
                expiryDate: expiryDate,
                inputConfiguration: InputConfiguration(
                  cardNumberDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Number',
                    hintText: 'XXXX XXXX XXXX XXXX',
                  ),
                  expiryDateDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Expired Date',
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Card Holder',
                    hintText: 'XXXXXXXXXX',
                  ),
                ),
                onCreditCardModelChange: onCreditCardModelChange,
              ),
              const SizedBox(height: 20),
            ],
          )))
        ]),
        floatingActionButton: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              DefaultElevatedButtonBlue(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.rightSlide,
                    title: 'Confirm the payment process',
                    desc: 'Are you sure of all the data entered?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      Navigator.pushNamedAndRemoveUntil(context,
                          AppRouters.layoutPageRoute, (route) => false);
                    },
                  ).show();
                },
                text: 'Pay',
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(AppTheme.basieColor)),
              ),
            ])));
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Glassmorphism? _getGlassmorphismConfig() {
    if (!useGlassMorphism) {
      return null;
    }

    final LinearGradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
      stops: const <double>[0.3, 0],
    );

    return isLightTheme
        ? Glassmorphism(blurX: 8.0, blurY: 16.0, gradient: gradient)
        : Glassmorphism.defaultConfig();
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
