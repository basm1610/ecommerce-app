import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/middelware.dart';
import 'package:ecommerce_app/view/address/view.dart';
import 'package:ecommerce_app/view/screen/cart_screen.dart';
import 'package:ecommerce_app/view/screen/checkout_screen.dart';
import 'package:ecommerce_app/view/screen/main_home.dart';
import 'package:ecommerce_app/view/screen/Language.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/forgetpassword_screen.dart';
import 'package:ecommerce_app/view/screen/auth/forgetpassword/verification_screen.dart';
import 'package:ecommerce_app/view/screen/items_screen.dart';
import 'package:ecommerce_app/view/screen/onboarding_screen.dart';
import 'package:ecommerce_app/view/screen/auth/signup_screen.dart';
import 'package:ecommerce_app/view/screen/auth/success_signup_screen.dart';
import 'package:ecommerce_app/view/screen/auth/verfication_screen_signup.dart';
import 'package:ecommerce_app/view/screen/orders/archive.dart';
import 'package:ecommerce_app/view/screen/orders/order_details.dart';
import 'package:ecommerce_app/view/screen/orders/pending_orders.dart';
import 'package:ecommerce_app/view/screen/product_details.dart';
import 'package:ecommerce_app/view/screen/search_screen.dart';
import 'package:get/get.dart';
import 'view/screen/auth/Login.dart';
import 'view/screen/auth/forgetpassword/reset_password_screen.dart';
import 'view/screen/auth/forgetpassword/success_resetpassword_screen.dart';
import 'view/screen/favorite_screen.dart';

List<GetPage<dynamic>>? routs=[
  GetPage(name: "/", page: ()=> const LanguageScreen(),middlewares: [MyMiddleWare()]),

  // GetPage(name: "/", page: ()=> const TestView()),
  GetPage(name: AppRouts.login, page: ()=> const Login()),
  GetPage(name: AppRouts.signUp, page: ()=> const SignUpScreen ()),
  GetPage(name: AppRouts.forgetPassword, page: ()=> const ForgetPassword()),
  GetPage(name: AppRouts.verifyCodeSignUp, page: ()=> const VerificationScreen()),
  GetPage(name: AppRouts.resetPassword, page: ()=> const ResetPasswordScreen()),
  GetPage(name: AppRouts.verifyCode, page: ()=> const VerificationScreenRePassword()),
  GetPage(name: AppRouts.successResetPassword, page: ()=> const SuccessResetPasswordScreen()),
  GetPage(name: AppRouts.successSignUp, page: ()=> const SuccessSignUpScreen()),
  GetPage(name: AppRouts.onBoarding, page: ()=> const OnBoardingScreen()),
  GetPage(name: AppRouts.home, page: ()=> const MainHome()),
  GetPage(name: AppRouts.items, page: ()=> const ItemsScreen()),
  GetPage(name: AppRouts.productDetails, page: ()=> const ProductDetails()),
  GetPage(name: AppRouts.myFavorite, page: ()=> const FavoriteScreen()),
  GetPage(name: AppRouts.myCart, page: ()=> const CartScreen()),
  GetPage(name: AppRouts.search, page: ()=> const SearchScreen()),
  GetPage(name: AppRouts.viewAddress, page: ()=> const ViewAddress()),
  GetPage(name: AppRouts.checkout, page: ()=> const CheckoutScreen()),
  GetPage(name: AppRouts.orders, page: ()=> const PendingScreen()),
  GetPage(name: AppRouts.orderDetails, page: ()=> const OrderDetails()),
  GetPage(name: AppRouts.orderArchived, page: ()=> const ArchivedScreen()),

];

