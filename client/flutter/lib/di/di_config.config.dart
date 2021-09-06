// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i102;
import '../module_account/account_module.dart' as _i101;
import '../module_account/manager/account_manager.dart' as _i70;
import '../module_account/repository/account_repository.dart' as _i45;
import '../module_account/service/account_service.dart' as _i71;
import '../module_account/state_manager/account_state_manager.dart' as _i72;
import '../module_account/state_manager/presonal_data_state_manager.dart'
    as _i82;
import '../module_account/ui/screen/account_screen.dart' as _i88;
import '../module_account/ui/screen/presonal_data_screen.dart' as _i97;
import '../module_auth/authoriazation_module.dart' as _i73;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i23;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i17;
import '../module_auth/service/auth_service/auth_service.dart' as _i24;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i30;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i34;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i51;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i57;
import '../module_chat/chat_module.dart' as _i89;
import '../module_chat/manager/chat/chat_manager.dart' as _i46;
import '../module_chat/presistance/chat_hive_helper.dart' as _i4;
import '../module_chat/repository/chat/chat_repository.dart' as _i25;
import '../module_chat/service/chat/char_service.dart' as _i47;
import '../module_chat/state_manager/chat_state_manager.dart' as _i48;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i74;
import '../module_home/home_module.dart' as _i76;
import '../module_home/manager/home_manager.dart' as _i26;
import '../module_home/repository/home_repository.dart' as _i18;
import '../module_home/service/home_service.dart' as _i27;
import '../module_home/state_manager/home_state_manager.dart' as _i28;
import '../module_home/ui/screen/home_screen.dart' as _i50;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i7;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i8;
import '../module_main/main_module.dart' as _i19;
import '../module_main/ui/screen/main_screen.dart' as _i10;
import '../module_my_notifications/manager/my_notifications_manager.dart'
    as _i52;
import '../module_my_notifications/my_notifications_module.dart' as _i91;
import '../module_my_notifications/repository/my_notifications_repository.dart'
    as _i31;
import '../module_my_notifications/service/my_notification_service.dart'
    as _i53;
import '../module_my_notifications/state_manager/my_notifications_state_manager.dart'
    as _i54;
import '../module_my_notifications/ui/screen/my_notifications_screen.dart'
    as _i77;
import '../module_network/http_client/http_client.dart' as _i15;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i11;
import '../module_notifications/repository/notification_repo.dart' as _i33;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i49;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i6;
import '../module_orders/manager/my_orders_manager.dart' as _i55;
import '../module_orders/orders_module.dart' as _i96;
import '../module_orders/repository/orders_repository.dart' as _i32;
import '../module_orders/service/orders_service.dart' as _i56;
import '../module_orders/state_manager/client_order_state_manager.dart' as _i75;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i78;
import '../module_orders/state_manager/order_details_state_manager.dart'
    as _i79;
import '../module_orders/state_manager/order_logs_state_manager.dart' as _i80;
import '../module_orders/state_manager/order_status_state_manager.dart' as _i81;
import '../module_orders/ui/screen/client_order_screen.dart' as _i90;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i92;
import '../module_orders/ui/screen/order_details_screen.dart' as _i93;
import '../module_orders/ui/screen/order_logs_screen.dart' as _i94;
import '../module_orders/ui/screen/order_status_screen.dart' as _i95;
import '../module_our_services/manager/manager.dart' as _i61;
import '../module_our_services/repository/services_repository.dart' as _i39;
import '../module_our_services/service/services_service.dart' as _i62;
import '../module_our_services/services_module.dart' as _i99;
import '../module_our_services/state_manager/private_order_state_manager.dart'
    as _i83;
import '../module_our_services/state_manager/services_state_manager.dart'
    as _i63;
import '../module_our_services/ui/screen/private_order_screen.dart' as _i98;
import '../module_our_services/ui/screen/send_it_screen.dart' as _i85;
import '../module_report/manager/report_manager.dart' as _i58;
import '../module_report/presistance/report_prefs_helper.dart' as _i12;
import '../module_report/repository/report_repository.dart' as _i35;
import '../module_report/service/report_service.dart' as _i59;
import '../module_search/manager/search_manager.dart' as _i36;
import '../module_search/repository/search_repository.dart' as _i20;
import '../module_search/search_module.dart' as _i84;
import '../module_search/service/search_service.dart' as _i37;
import '../module_search/state_manager/search_state_manager.dart' as _i38;
import '../module_search/ui/screen/search_screen.dart' as _i60;
import '../module_settings/settings_module.dart' as _i86;
import '../module_settings/ui/settings_page/settings_page.dart' as _i64;
import '../module_splash/splash_module.dart' as _i65;
import '../module_splash/ui/screen/splash_screen.dart' as _i40;
import '../module_stores/manager/store_list_manager.dart' as _i41;
import '../module_stores/manager/store_products.dart' as _i67;
import '../module_stores/repository/store_list_repository.dart' as _i21;
import '../module_stores/repository/store_products_repository.dart' as _i44;
import '../module_stores/service/store_list_service.dart' as _i42;
import '../module_stores/service/store_products_service.dart' as _i68;
import '../module_stores/state_manager/store_list_state_manager.dart' as _i43;
import '../module_stores/state_manager/store_products_state_manager.dart'
    as _i69;
import '../module_stores/store_module.dart' as _i100;
import '../module_stores/ui/screen/store_list_screen.dart' as _i66;
import '../module_stores/ui/screen/store_products_screen.dart' as _i87;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i13;
import '../module_theme/service/theme_service/theme_service.dart' as _i16;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i22;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i14;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i29;
import '../utils/helpers/fire_store_helper.dart' as _i5;
import '../utils/logger/logger.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.ChatHiveHelper>(() => _i4.ChatHiveHelper());
  gh.factory<_i5.FireStoreHelper>(() => _i5.FireStoreHelper());
  gh.factory<_i6.LocalNotificationService>(
      () => _i6.LocalNotificationService());
  gh.factory<_i7.LocalizationPreferencesHelper>(
      () => _i7.LocalizationPreferencesHelper());
  gh.factory<_i8.LocalizationService>(
      () => _i8.LocalizationService(get<_i7.LocalizationPreferencesHelper>()));
  gh.factory<_i9.Logger>(() => _i9.Logger());
  gh.factory<_i10.MainScreen>(() => _i10.MainScreen());
  gh.factory<_i11.NotificationsPrefsHelper>(
      () => _i11.NotificationsPrefsHelper());
  gh.factory<_i12.ReportPrefsHelper>(() => _i12.ReportPrefsHelper());
  gh.factory<_i13.ThemePreferencesHelper>(() => _i13.ThemePreferencesHelper());
  gh.factory<_i14.UploadRepository>(() => _i14.UploadRepository());
  gh.factory<_i15.ApiClient>(() => _i15.ApiClient(get<_i9.Logger>()));
  gh.factory<_i16.AppThemeDataService>(
      () => _i16.AppThemeDataService(get<_i13.ThemePreferencesHelper>()));
  gh.factory<_i17.AuthRepository>(
      () => _i17.AuthRepository(get<_i15.ApiClient>(), get<_i9.Logger>()));
  gh.factory<_i18.HomeRepository>(
      () => _i18.HomeRepository(get<_i15.ApiClient>()));
  gh.factory<_i19.MainModule>(() => _i19.MainModule(get<_i10.MainScreen>()));
  gh.factory<_i20.SearchRepository>(
      () => _i20.SearchRepository(get<_i15.ApiClient>()));
  gh.factory<_i21.StoreListRepository>(
      () => _i21.StoreListRepository(get<_i15.ApiClient>()));
  gh.factory<_i22.UploadManager>(
      () => _i22.UploadManager(get<_i14.UploadRepository>()));
  gh.factory<_i23.AuthManager>(
      () => _i23.AuthManager(get<_i17.AuthRepository>()));
  gh.factory<_i24.AuthService>(() =>
      _i24.AuthService(get<_i3.AuthPrefsHelper>(), get<_i23.AuthManager>()));
  gh.factory<_i25.ChatRepository>(() =>
      _i25.ChatRepository(get<_i15.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i26.HomeManager>(
      () => _i26.HomeManager(get<_i18.HomeRepository>()));
  gh.factory<_i27.HomeService>(() => _i27.HomeService(get<_i26.HomeManager>()));
  gh.factory<_i28.HomeStateManager>(
      () => _i28.HomeStateManager(get<_i27.HomeService>()));
  gh.factory<_i29.ImageUploadService>(
      () => _i29.ImageUploadService(get<_i22.UploadManager>()));
  gh.factory<_i30.LoginStateManager>(
      () => _i30.LoginStateManager(get<_i24.AuthService>()));
  gh.factory<_i31.MyNotificationsRepository>(() =>
      _i31.MyNotificationsRepository(
          get<_i15.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i32.MyOrdersRepository>(() =>
      _i32.MyOrdersRepository(get<_i15.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i33.NotificationRepo>(() =>
      _i33.NotificationRepo(get<_i15.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i34.RegisterStateManager>(
      () => _i34.RegisterStateManager(get<_i24.AuthService>()));
  gh.factory<_i35.ReportRepository>(() => _i35.ReportRepository(
      get<_i15.ApiClient>(),
      get<_i24.AuthService>(),
      get<_i12.ReportPrefsHelper>()));
  gh.factory<_i36.SearchManager>(
      () => _i36.SearchManager(get<_i20.SearchRepository>()));
  gh.factory<_i37.SearchService>(
      () => _i37.SearchService(get<_i36.SearchManager>()));
  gh.factory<_i38.SearchStateManager>(
      () => _i38.SearchStateManager(get<_i37.SearchService>()));
  gh.factory<_i39.ServicesRepository>(() =>
      _i39.ServicesRepository(get<_i15.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i40.SplashScreen>(
      () => _i40.SplashScreen(get<_i24.AuthService>()));
  gh.factory<_i41.StoreListManager>(
      () => _i41.StoreListManager(get<_i21.StoreListRepository>()));
  gh.factory<_i42.StoreListService>(
      () => _i42.StoreListService(get<_i41.StoreListManager>()));
  gh.factory<_i43.StoreListStateManager>(
      () => _i43.StoreListStateManager(get<_i42.StoreListService>()));
  gh.factory<_i44.StoreProductsRepository>(() => _i44.StoreProductsRepository(
      get<_i15.ApiClient>(), get<_i24.AuthService>()));
  gh.factory<_i45.AccountRepository>(() =>
      _i45.AccountRepository(get<_i24.AuthService>(), get<_i15.ApiClient>()));
  gh.factory<_i46.ChatManager>(
      () => _i46.ChatManager(get<_i25.ChatRepository>()));
  gh.factory<_i47.ChatService>(() => _i47.ChatService(get<_i46.ChatManager>()));
  gh.factory<_i48.ChatStateManager>(
      () => _i48.ChatStateManager(get<_i47.ChatService>()));
  gh.factory<_i49.FireNotificationService>(() => _i49.FireNotificationService(
      get<_i11.NotificationsPrefsHelper>(), get<_i33.NotificationRepo>()));
  gh.factory<_i50.HomeScreen>(
      () => _i50.HomeScreen(get<_i28.HomeStateManager>()));
  gh.factory<_i51.LoginScreen>(
      () => _i51.LoginScreen(get<_i30.LoginStateManager>()));
  gh.factory<_i52.MyNotificationsManager>(
      () => _i52.MyNotificationsManager(get<_i31.MyNotificationsRepository>()));
  gh.factory<_i53.MyNotificationsService>(
      () => _i53.MyNotificationsService(get<_i52.MyNotificationsManager>()));
  gh.factory<_i54.MyNotificationsStateManager>(() =>
      _i54.MyNotificationsStateManager(
          get<_i53.MyNotificationsService>(), get<_i24.AuthService>()));
  gh.factory<_i55.MyOrdersManager>(
      () => _i55.MyOrdersManager(get<_i32.MyOrdersRepository>()));
  gh.factory<_i56.OrdersService>(() => _i56.OrdersService(
      get<_i55.MyOrdersManager>(), get<_i5.FireStoreHelper>()));
  gh.factory<_i57.RegisterScreen>(
      () => _i57.RegisterScreen(get<_i34.RegisterStateManager>()));
  gh.factory<_i58.ReportManager>(
      () => _i58.ReportManager(get<_i35.ReportRepository>()));
  gh.factory<_i59.ReportService>(
      () => _i59.ReportService(get<_i58.ReportManager>()));
  gh.factory<_i60.SearchScreen>(
      () => _i60.SearchScreen(get<_i38.SearchStateManager>()));
  gh.factory<_i61.ServicesManager>(
      () => _i61.ServicesManager(get<_i39.ServicesRepository>()));
  gh.factory<_i62.ServicesService>(() => _i62.ServicesService(
      get<_i61.ServicesManager>(), get<_i5.FireStoreHelper>()));
  gh.factory<_i63.ServicesStateManager>(() => _i63.ServicesStateManager(
      get<_i62.ServicesService>(), get<_i24.AuthService>()));
  gh.factory<_i64.SettingsScreen>(() => _i64.SettingsScreen(
      get<_i24.AuthService>(),
      get<_i8.LocalizationService>(),
      get<_i16.AppThemeDataService>(),
      get<_i49.FireNotificationService>()));
  gh.factory<_i65.SplashModule>(
      () => _i65.SplashModule(get<_i40.SplashScreen>()));
  gh.factory<_i66.StoreListScreen>(
      () => _i66.StoreListScreen(get<_i43.StoreListStateManager>()));
  gh.factory<_i67.StoreProductsManager>(
      () => _i67.StoreProductsManager(get<_i44.StoreProductsRepository>()));
  gh.factory<_i68.StoreProductsService>(
      () => _i68.StoreProductsService(get<_i67.StoreProductsManager>()));
  gh.factory<_i69.StoreProductsStateManager>(
      () => _i69.StoreProductsStateManager(get<_i68.StoreProductsService>()));
  gh.factory<_i70.AccountManager>(
      () => _i70.AccountManager(get<_i45.AccountRepository>()));
  gh.factory<_i71.AccountService>(
      () => _i71.AccountService(get<_i70.AccountManager>()));
  gh.factory<_i72.AccountStateManager>(() => _i72.AccountStateManager(
      get<_i71.AccountService>(), get<_i24.AuthService>()));
  gh.factory<_i73.AuthorizationModule>(() => _i73.AuthorizationModule(
      get<_i51.LoginScreen>(), get<_i57.RegisterScreen>()));
  gh.factory<_i74.ChatPage>(() => _i74.ChatPage(
      get<_i48.ChatStateManager>(),
      get<_i29.ImageUploadService>(),
      get<_i24.AuthService>(),
      get<_i4.ChatHiveHelper>()));
  gh.factory<_i75.ClientOrderStateManager>(() => _i75.ClientOrderStateManager(
      get<_i56.OrdersService>(), get<_i24.AuthService>()));
  gh.factory<_i76.HomeModule>(() => _i76.HomeModule(get<_i50.HomeScreen>()));
  gh.factory<_i77.MyNotificationsScreen>(() =>
      _i77.MyNotificationsScreen(get<_i54.MyNotificationsStateManager>()));
  gh.factory<_i78.MyOrdersStateManager>(() => _i78.MyOrdersStateManager(
      get<_i56.OrdersService>(),
      get<_i24.AuthService>(),
      get<_i5.FireStoreHelper>()));
  gh.factory<_i79.OrderDetailsStateManager>(() => _i79.OrderDetailsStateManager(
      get<_i56.OrdersService>(), get<_i5.FireStoreHelper>()));
  gh.factory<_i80.OrderLogsStateManager>(
      () => _i80.OrderLogsStateManager(get<_i56.OrdersService>()));
  gh.factory<_i81.OrderStatusStateManager>(() => _i81.OrderStatusStateManager(
      get<_i56.OrdersService>(), get<_i5.FireStoreHelper>()));
  gh.factory<_i82.PersonalDataStateManager>(() => _i82.PersonalDataStateManager(
      get<_i71.AccountService>(), get<_i29.ImageUploadService>()));
  gh.factory<_i83.PrivateOrderStateManager>(() => _i83.PrivateOrderStateManager(
      get<_i62.ServicesService>(), get<_i24.AuthService>()));
  gh.factory<_i84.SearchModule>(
      () => _i84.SearchModule(get<_i60.SearchScreen>()));
  gh.factory<_i85.SendItScreen>(
      () => _i85.SendItScreen(get<_i63.ServicesStateManager>()));
  gh.factory<_i86.SettingsModule>(
      () => _i86.SettingsModule(get<_i64.SettingsScreen>()));
  gh.factory<_i87.StoreProductsScreen>(() => _i87.StoreProductsScreen(
      get<_i69.StoreProductsStateManager>(), get<_i24.AuthService>()));
  gh.factory<_i88.AccountScreen>(
      () => _i88.AccountScreen(get<_i72.AccountStateManager>()));
  gh.factory<_i89.ChatModule>(
      () => _i89.ChatModule(get<_i74.ChatPage>(), get<_i24.AuthService>()));
  gh.factory<_i90.ClientOrderScreen>(
      () => _i90.ClientOrderScreen(get<_i75.ClientOrderStateManager>()));
  gh.factory<_i91.MyNotificationsModule>(
      () => _i91.MyNotificationsModule(get<_i77.MyNotificationsScreen>()));
  gh.factory<_i92.MyOrdersScreen>(
      () => _i92.MyOrdersScreen(get<_i78.MyOrdersStateManager>()));
  gh.factory<_i93.OrderDetailsScreen>(
      () => _i93.OrderDetailsScreen(get<_i79.OrderDetailsStateManager>()));
  gh.factory<_i94.OrderLogsScreen>(
      () => _i94.OrderLogsScreen(get<_i80.OrderLogsStateManager>()));
  gh.factory<_i95.OrderStatusScreen>(
      () => _i95.OrderStatusScreen(get<_i81.OrderStatusStateManager>()));
  gh.factory<_i96.OrdersModule>(() => _i96.OrdersModule(
      get<_i92.MyOrdersScreen>(),
      get<_i93.OrderDetailsScreen>(),
      get<_i95.OrderStatusScreen>(),
      get<_i90.ClientOrderScreen>(),
      get<_i94.OrderLogsScreen>()));
  gh.factory<_i97.PersonalDataScreen>(
      () => _i97.PersonalDataScreen(get<_i82.PersonalDataStateManager>()));
  gh.factory<_i98.PrivateOrderScreen>(
      () => _i98.PrivateOrderScreen(get<_i83.PrivateOrderStateManager>()));
  gh.factory<_i99.ServicesModule>(() => _i99.ServicesModule(
      get<_i85.SendItScreen>(), get<_i98.PrivateOrderScreen>()));
  gh.factory<_i100.StoreModule>(() => _i100.StoreModule(
      get<_i66.StoreListScreen>(), get<_i87.StoreProductsScreen>()));
  gh.factory<_i101.AccountModule>(() => _i101.AccountModule(
      get<_i88.AccountScreen>(), get<_i97.PersonalDataScreen>()));
  gh.factory<_i102.MyApp>(() => _i102.MyApp(
      get<_i16.AppThemeDataService>(),
      get<_i8.LocalizationService>(),
      get<_i49.FireNotificationService>(),
      get<_i6.LocalNotificationService>(),
      get<_i65.SplashModule>(),
      get<_i73.AuthorizationModule>(),
      get<_i89.ChatModule>(),
      get<_i86.SettingsModule>(),
      get<_i76.HomeModule>(),
      get<_i19.MainModule>(),
      get<_i100.StoreModule>(),
      get<_i91.MyNotificationsModule>(),
      get<_i101.AccountModule>(),
      get<_i96.OrdersModule>(),
      get<_i99.ServicesModule>(),
      get<_i84.SearchModule>()));
  return get;
}
