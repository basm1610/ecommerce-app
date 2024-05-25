class AppLink {
  static const String linkServiceName = "http://192.168.137.1/ecommerce";
  static const String linkTest = '$linkServiceName/test.php';

  ////////////////////////////Images////////////////////////////////////
  static const String imageStatic = '$linkServiceName/upload';
  static const String imageCategories = '$imageStatic/categories';
  static const String imageItems = '$imageStatic/items';

  ////////////////////////////Auth////////////////////////////////////
  static const String linkSignUp = '$linkServiceName/auth/signup.php';
  static const String linkLogin = '$linkServiceName/auth/login.php';
  static const String verifyCode = '$linkServiceName/auth/verfiycode.php';

  ////////////////////////////ForgetPassword////////////////////////////////////
  static const String forgetPassword = '$linkServiceName/forgetpassword/checkemail.php';
  static const String rePassword = '$linkServiceName/forgetpassword/resetpassword.php';
  static const String verifyCodePassword = '$linkServiceName/forgetpassword/verfiycodepassword.php';

  ////////////////////////////Home////////////////////////////////////
  static const String homePage = '$linkServiceName/home.php';
  static const String items = '$linkServiceName/items/items.php';
  static const String search = '$linkServiceName/items/search.php';

////////////////////////////Favorite////////////////////////////////////
  static const String addFavorite = '$linkServiceName/favorite/add.php';
  static const String deleteFavorite = '$linkServiceName/favorite/delete.php';
  static const String myFavorite = '$linkServiceName/favorite/myfavorite.php';
  static const String deleteMyFavorite = '$linkServiceName/favorite/deletemyfavorite.php';

  ////////////////////////////Favorite////////////////////////////////////
  static const String viewCart = '$linkServiceName/cart/view.php';
  static const String addCart = '$linkServiceName/cart/add.php';
  static const String deleteCart = '$linkServiceName/cart/delete.php';
  static const String countItems = '$linkServiceName/cart/count_items.php';


  static const String checkCoupon = '$linkServiceName/coupon/checkCoupon.php';

  static const String checkout = '$linkServiceName/orders/checkout.php';

  static const String ordersPending = '$linkServiceName/orders/orders.php';
  static const String ordersDetails = '$linkServiceName/orders/details.php';
  static const String ordersDelete = '$linkServiceName/orders/delete.php';
  static const String ordersArchived = '$linkServiceName/orders/archived.php';

  static const String offers = '$linkServiceName/offers.php';








}