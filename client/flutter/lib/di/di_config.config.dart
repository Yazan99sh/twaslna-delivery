// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i91;
import '../module_account/account_module.dart' as _i89;
import '../module_account/manager/account_manager.dart' as _i66;
import '../module_account/repository/account_repository.dart' as _i48;
import '../module_account/service/account_service.dart' as _i67;
import '../module_account/state_manager/account_state_manager.dart' as _i68;
import '../module_account/ui/screen/account_screen.dart' as _i80;
import '../module_account/ui/screen/presonal_data_screen.dart' as _i12;
import '../module_auth/authoriazation_module.dart' as _i69;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i28;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i18;
import '../module_auth/service/auth_service/auth_service.dart' as _i29;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i35;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i38;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i53;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i56;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i70;
import '../module_chat/chat_module.dart' as _i90;
import '../module_chat/manager/chat/chat_manager.dart' as _i49;
import '../module_chat/repository/chat/chat_repository.dart' as _i30;
import '../module_chat/service/chat/char_service.dart' as _i50;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i81;
import '../module_home/home_module.dart' as _i72;
import '../module_home/manager/home_manager.dart' as _i31;
import '../module_home/repository/home_repository.dart' as _i19;
import '../module_home/service/home_service.dart' as _i32;
import '../module_home/state_manager/home_state_manager.dart' as _i33;
import '../module_home/ui/screen/home_screen.dart' as _i52;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i5;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i6;
import '../module_main/main_module.dart' as _i20;
import '../module_main/ui/screen/main_screen.dart' as _i8;
import '../module_my_notifications/manager/my_notifications_manager.dart'
    as _i21;
import '../module_my_notifications/my_notifications_module.dart' as _i22;
import '../module_my_notifications/repository/my_notifications_repository.dart'
    as _i9;
import '../module_my_notifications/service/my_notification_service.dart'
    as _i23;
import '../module_my_notifications/state_manager/my_notifications_state_manager.dart'
    as _i24;
import '../module_my_notifications/ui/screen/my_notifications_screen.dart'
    as _i10;
import '../module_network/http_client/http_client.dart' as _i16;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i11;
import '../module_notifications/repository/notification_repo.dart' as _i37;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i51;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i4;
import '../module_orders/manager/my_orders_manager.dart' as _i54;
import '../module_orders/orders_module.dart' as _i86;
import '../module_orders/repository/orders_repository.dart' as _i36;
import '../module_orders/service/orders_service.dart' as _i55;
import '../module_orders/state_manager/client_order_state_manager.dart' as _i71;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i73;
import '../module_orders/state_manager/order_details_state_manager.dart'
    as _i74;
import '../module_orders/state_manager/order_status_state_manager.dart' as _i75;
import '../module_orders/ui/screen/client_order_screen.dart' as _i82;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i83;
import '../module_orders/ui/screen/order_details_screen.dart' as _i84;
import '../module_orders/ui/screen/order_status_screen.dart' as _i85;
import '../module_our_services/manager/manager.dart' as _i59;
import '../module_our_services/repository/services_repository.dart' as _i40;
import '../module_our_services/service/services_service.dart' as _i60;
import '../module_our_services/services_module.dart' as _i88;
import '../module_our_services/state_manager/private_order_state_manager.dart'
    as _i76;
import '../module_our_services/state_manager/services_state_manager.dart'
    as _i61;
import '../module_our_services/ui/screen/private_order_screen.dart' as _i87;
import '../module_our_services/ui/screen/send_it_screen.dart' as _i77;
import '../module_report/manager/report_manager.dart' as _i57;
import '../module_report/presistance/report_prefs_helper.dart' as _i13;
import '../module_report/repository/report_repository.dart' as _i39;
import '../module_report/service/report_service.dart' as _i58;
import '../module_settings/settings_module.dart' as _i78;
import '../module_settings/ui/settings_page/settings_page.dart' as _i62;
import '../module_splash/splash_module.dart' as _i63;
import '../module_splash/ui/screen/splash_screen.dart' as _i41;
import '../module_stores/manager/store_list_manager.dart' as _i42;
import '../module_stores/manager/store_products.dart' as _i45;
import '../module_stores/repository/store_list_repository.dart' as _i25;
import '../module_stores/repository/store_products_repository.dart' as _i26;
import '../module_stores/service/store_list_service.dart' as _i43;
import '../module_stores/service/store_products_service.dart' as _i46;
import '../module_stores/state_manager/store_list_state_manager.dart' as _i44;
import '../module_stores/state_manager/store_products_state_manager.dart'
    as _i47;
import '../module_stores/store_module.dart' as _i79;
import '../module_stores/ui/screen/store_list_screen.dart' as _i64;
import '../module_stores/ui/screen/store_products_screen.dart' as _i65;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i14;
import '../module_theme/service/theme_service/theme_service.dart' as _i17;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i27;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i15;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i34;
import '../utils/logger/logger.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.LocalNotificationService>(
      () => _i4.LocalNotificationService());
  gh.factory<_i5.LocalizationPreferencesHelper>(
      () => _i5.LocalizationPreferencesHelper());
  gh.factory<_i6.LocalizationService>(
      () => _i6.LocalizationService(get<_i5.LocalizationPreferencesHelper>()));
  gh.factory<_i7.Logger>(() => _i7.Logger());
  gh.factory<_i8.MainScreen>(() => _i8.MainScreen());
  gh.factory<_i9.MyNotificationsRepository>(
      () => _i9.MyNotificationsRepository());
  gh.factory<_i10.MyNotificationsScreen>(() => _i10.MyNotificationsScreen());
  gh.factory<_i11.NotificationsPrefsHelper>(
      () => _i11.NotificationsPrefsHelper());
  gh.factory<_i12.PersonalDataScreen>(() => _i12.PersonalDataScreen());
  gh.factory<_i13.ReportPrefsHelper>(() => _i13.ReportPrefsHelper());
  gh.factory<_i14.ThemePreferencesHelper>(() => _i14.ThemePreferencesHelper());
  gh.factory<_i15.UploadRepository>(() => _i15.UploadRepository());
  gh.factory<_i16.ApiClient>(() => _i16.ApiClient(get<_i7.Logger>()));
  gh.factory<_i17.AppThemeDataService>(
      () => _i17.AppThemeDataService(get<_i14.ThemePreferencesHelper>()));
  gh.factory<_i18.AuthRepository>(
      () => _i18.AuthRepository(get<_i16.ApiClient>(), get<_i7.Logger>()));
  gh.factory<_i19.HomeRepository>(
      () => _i19.HomeRepository(get<_i16.ApiClient>()));
  gh.factory<_i20.MainModule>(() => _i20.MainModule(get<_i8.MainScreen>()));
  gh.factory<_i21.MyNotificationsManager>(
      () => _i21.MyNotificationsManager(get<_i9.MyNotificationsRepository>()));
  gh.factory<_i22.MyNotificationsModule>(
      () => _i22.MyNotificationsModule(get<_i10.MyNotificationsScreen>()));
  gh.factory<_i23.MyNotificationsService>(
      () => _i23.MyNotificationsService(get<_i21.MyNotificationsManager>()));
  gh.factory<_i24.MyNotificationsStateManager>(() =>
      _i24.MyNotificationsStateManager(get<_i23.MyNotificationsService>()));
  gh.factory<_i25.StoreListRepository>(
      () => _i25.StoreListRepository(get<_i16.ApiClient>()));
  gh.factory<_i26.StoreProductsRepository>(
      () => _i26.StoreProductsRepository(get<_i16.ApiClient>()));
  gh.factory<_i27.UploadManager>(
      () => _i27.UploadManager(get<_i15.UploadRepository>()));
  gh.factory<_i28.AuthManager>(
      () => _i28.AuthManager(get<_i18.AuthRepository>()));
  gh.factory<_i29.AuthService>(() =>
      _i29.AuthService(get<_i3.AuthPrefsHelper>(), get<_i28.AuthManager>()));
  gh.factory<_i30.ChatRepository>(() =>
      _i30.ChatRepository(get<_i16.ApiClient>(), get<_i29.AuthService>()));
  gh.factory<_i31.HomeManager>(
      () => _i31.HomeManager(get<_i19.HomeRepository>()));
  gh.factory<_i32.HomeService>(() => _i32.HomeService(get<_i31.HomeManager>()));
  gh.factory<_i33.HomeStateManager>(
      () => _i33.HomeStateManager(get<_i32.HomeService>()));
  gh.factory<_i34.ImageUploadService>(
      () => _i34.ImageUploadService(get<_i27.UploadManager>()));
  gh.factory<_i35.LoginStateManager>(
      () => _i35.LoginStateManager(get<_i29.AuthService>()));
  gh.factory<_i36.MyOrdersRepository>(() =>
      _i36.MyOrdersRepository(get<_i16.ApiClient>(), get<_i29.AuthService>()));
  gh.factory<_i37.NotificationRepo>(() =>
      _i37.NotificationRepo(get<_i16.ApiClient>(), get<_i29.AuthService>()));
  gh.factory<_i38.RegisterStateManager>(
      () => _i38.RegisterStateManager(get<_i29.AuthService>()));
  gh.factory<_i39.ReportRepository>(() => _i39.ReportRepository(
      get<_i16.ApiClient>(),
      get<_i29.AuthService>(),
      get<_i13.ReportPrefsHelper>()));
  gh.factory<_i40.ServicesRepository>(() =>
      _i40.ServicesRepository(get<_i16.ApiClient>(), get<_i29.AuthService>()));
  gh.factory<_i41.SplashScreen>(
      () => _i41.SplashScreen(get<_i29.AuthService>()));
  gh.factory<_i42.StoreListManager>(
      () => _i42.StoreListManager(get<_i25.StoreListRepository>()));
  gh.factory<_i43.StoreListService>(
      () => _i43.StoreListService(get<_i42.StoreListManager>()));
  gh.factory<_i44.StoreListStateManager>(
      () => _i44.StoreListStateManager(get<_i43.StoreListService>()));
  gh.factory<_i45.StoreProductsManager>(
      () => _i45.StoreProductsManager(get<_i26.StoreProductsRepository>()));
  gh.factory<_i46.StoreProductsService>(
      () => _i46.StoreProductsService(get<_i45.StoreProductsManager>()));
  gh.factory<_i47.StoreProductsStateManager>(
      () => _i47.StoreProductsStateManager(get<_i46.StoreProductsService>()));
  gh.factory<_i48.AccountRepository>(() =>
      _i48.AccountRepository(get<_i29.AuthService>(), get<_i16.ApiClient>()));
  gh.factory<_i49.ChatManager>(
      () => _i49.ChatManager(get<_i30.ChatRepository>()));
  gh.factory<_i50.ChatService>(() => _i50.ChatService(get<_i49.ChatManager>()));
  gh.factory<_i51.FireNotificationService>(() => _i51.FireNotificationService(
      get<_i11.NotificationsPrefsHelper>(), get<_i37.NotificationRepo>()));
  gh.factory<_i52.HomeScreen>(
      () => _i52.HomeScreen(get<_i33.HomeStateManager>()));
  gh.factory<_i53.LoginScreen>(
      () => _i53.LoginScreen(get<_i35.LoginStateManager>()));
  gh.factory<_i54.MyOrdersManager>(
      () => _i54.MyOrdersManager(get<_i36.MyOrdersRepository>()));
  gh.factory<_i55.OrdersService>(
      () => _i55.OrdersService(get<_i54.MyOrdersManager>()));
  gh.factory<_i56.RegisterScreen>(
      () => _i56.RegisterScreen(get<_i38.RegisterStateManager>()));
  gh.factory<_i57.ReportManager>(
      () => _i57.ReportManager(get<_i39.ReportRepository>()));
  gh.factory<_i58.ReportService>(
      () => _i58.ReportService(get<_i57.ReportManager>()));
  gh.factory<_i59.ServicesManager>(
      () => _i59.ServicesManager(get<_i40.ServicesRepository>()));
  gh.factory<_i60.ServicesService>(
      () => _i60.ServicesService(get<_i59.ServicesManager>()));
  gh.factory<_i61.ServicesStateManager>(() => _i61.ServicesStateManager(
      get<_i60.ServicesService>(), get<_i29.AuthService>()));
  gh.factory<_i62.SettingsScreen>(() => _i62.SettingsScreen(
      get<_i29.AuthService>(),
      get<_i6.LocalizationService>(),
      get<_i17.AppThemeDataService>(),
      get<_i51.FireNotificationService>()));
  gh.factory<_i63.SplashModule>(
      () => _i63.SplashModule(get<_i41.SplashScreen>()));
  gh.factory<_i64.StoreListScreen>(
      () => _i64.StoreListScreen(get<_i44.StoreListStateManager>()));
  gh.factory<_i65.StoreProductsScreen>(
      () => _i65.StoreProductsScreen(get<_i47.StoreProductsStateManager>()));
  gh.factory<_i66.AccountManager>(
      () => _i66.AccountManager(get<_i48.AccountRepository>()));
  gh.factory<_i67.AccountService>(
      () => _i67.AccountService(get<_i66.AccountManager>()));
  gh.factory<_i68.AccountStateManager>(() => _i68.AccountStateManager(
      get<_i67.AccountService>(), get<_i29.AuthService>()));
  gh.factory<_i69.AuthorizationModule>(() => _i69.AuthorizationModule(
      get<_i53.LoginScreen>(), get<_i56.RegisterScreen>()));
  gh.factory<_i70.ChatPageBloc>(
      () => _i70.ChatPageBloc(get<_i50.ChatService>()));
  gh.factory<_i71.ClientOrderStateManager>(() => _i71.ClientOrderStateManager(
      get<_i55.OrdersService>(), get<_i29.AuthService>()));
  gh.factory<_i72.HomeModule>(() => _i72.HomeModule(get<_i52.HomeScreen>()));
  gh.factory<_i73.MyOrdersStateManager>(() => _i73.MyOrdersStateManager(
      get<_i55.OrdersService>(), get<_i29.AuthService>()));
  gh.factory<_i74.OrderDetailsStateManager>(
      () => _i74.OrderDetailsStateManager(get<_i55.OrdersService>()));
  gh.factory<_i75.OrderStatusStateManager>(
      () => _i75.OrderStatusStateManager(get<_i55.OrdersService>()));
  gh.factory<_i76.PrivateOrderStateManager>(() => _i76.PrivateOrderStateManager(
      get<_i60.ServicesService>(), get<_i29.AuthService>()));
  gh.factory<_i77.SendItScreen>(
      () => _i77.SendItScreen(get<_i61.ServicesStateManager>()));
  gh.factory<_i78.SettingsModule>(
      () => _i78.SettingsModule(get<_i62.SettingsScreen>()));
  gh.factory<_i79.StoreModule>(() => _i79.StoreModule(
      get<_i64.StoreListScreen>(), get<_i65.StoreProductsScreen>()));
  gh.factory<_i80.AccountScreen>(
      () => _i80.AccountScreen(get<_i68.AccountStateManager>()));
  gh.factory<_i81.ChatPage>(() =>
      _i81.ChatPage(get<_i70.ChatPageBloc>(), get<_i34.ImageUploadService>()));
  gh.factory<_i82.ClientOrderScreen>(
      () => _i82.ClientOrderScreen(get<_i71.ClientOrderStateManager>()));
  gh.factory<_i83.MyOrdersScreen>(
      () => _i83.MyOrdersScreen(get<_i73.MyOrdersStateManager>()));
  gh.factory<_i84.OrderDetailsScreen>(
      () => _i84.OrderDetailsScreen(get<_i74.OrderDetailsStateManager>()));
  gh.factory<_i85.OrderStatusScreen>(
      () => _i85.OrderStatusScreen(get<_i75.OrderStatusStateManager>()));
  gh.factory<_i86.OrdersModule>(() => _i86.OrdersModule(
      get<_i83.MyOrdersScreen>(),
      get<_i84.OrderDetailsScreen>(),
      get<_i85.OrderStatusScreen>(),
      get<_i82.ClientOrderScreen>()));
  gh.factory<_i87.PrivateOrderScreen>(
      () => _i87.PrivateOrderScreen(get<_i76.PrivateOrderStateManager>()));
  gh.factory<_i88.ServicesModule>(() => _i88.ServicesModule(
      get<_i77.SendItScreen>(), get<_i87.PrivateOrderScreen>()));
  gh.factory<_i89.AccountModule>(() => _i89.AccountModule(
      get<_i80.AccountScreen>(), get<_i12.PersonalDataScreen>()));
  gh.factory<_i90.ChatModule>(
      () => _i90.ChatModule(get<_i81.ChatPage>(), get<_i29.AuthService>()));
  gh.factory<_i91.MyApp>(() => _i91.MyApp(
      get<_i17.AppThemeDataService>(),
      get<_i6.LocalizationService>(),
      get<_i51.FireNotificationService>(),
      get<_i4.LocalNotificationService>(),
      get<_i63.SplashModule>(),
      get<_i69.AuthorizationModule>(),
      get<_i90.ChatModule>(),
      get<_i78.SettingsModule>(),
      get<_i72.HomeModule>(),
      get<_i20.MainModule>(),
      get<_i79.StoreModule>(),
      get<_i22.MyNotificationsModule>(),
      get<_i89.AccountModule>(),
      get<_i86.OrdersModule>(),
      get<_i88.ServicesModule>()));
  return get;
}
