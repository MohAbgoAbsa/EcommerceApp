import 'package:e_commerce/ui/screens/auth/login/login_screen.dart';
import 'package:e_commerce/ui/screens/auth/register/register_screen.dart';
import 'package:e_commerce/ui/screens/cart/cart_screen.dart';
import 'package:e_commerce/ui/screens/home/home_screen.dart';
import 'package:e_commerce/ui/screens/product_details/product_details_screen.dart';
import 'package:e_commerce/ui/screens/splashscreen/splash.dart';

class MyRoutes {
  // static String? initialRoute = LoginScreen.routeName;
  static String? initialRoute = SplashScreen.routeName;

  static var myRoutes = {
    SplashScreen.routeName: (_) => const SplashScreen(),
    LoginScreen.routeName: (_) => const LoginScreen(),
    RegisterScreen.routeName: (_) => const RegisterScreen(),
    HomeScreen.routeName: (_) => const HomeScreen(),
    ProductDetailsScreen.routeName: (_) => const ProductDetailsScreen(),
    CartScreen.routeName: (_) => const CartScreen()
  };
}
