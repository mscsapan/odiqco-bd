import 'package:provider/provider.dart';

import '/presenter/cart_counter.dart';
import '/presenter/cart_provider.dart';
import '/presenter/currency_presenter.dart';
import '/presenter/home_presenter.dart';
import '/presenter/select_address_provider.dart';
import '/presenter/unRead_notification_counter.dart';
import '/providers/blog_provider.dart';
import '/providers/locale_provider.dart';
import '/screens/classified_ads/classified_provider.dart';
import '/single_banner/photo_provider.dart';

class StateProviders {
  static final providers = <ChangeNotifierProvider>[
    ChangeNotifierProvider(create: (_) => LocaleProvider()),
    ChangeNotifierProvider(create: (context) => CartCounter()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context) => SelectAddressProvider()),
    ChangeNotifierProvider(create: (context) => UnReadNotificationCounter()),
    ChangeNotifierProvider(create: (context) => CurrencyPresenter()),

    ///
    //ChangeNotifierProvider(create: (_) => BannerProvider()),
    ChangeNotifierProvider(create: (_) => HomePresenter()),
    ChangeNotifierProvider(create: (_) => BlogProvider()),
    ChangeNotifierProvider(create: (_) => PhotoProvider()),
    ChangeNotifierProvider(create: (_) => MyClassifiedProvider()),
  ];
}
