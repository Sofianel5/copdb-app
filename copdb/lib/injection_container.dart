import 'package:copdb/core/network/http_override.dart';
import 'package:copdb/features/copdb/domain/usecases/get_local_contacts.dart';
import 'package:copdb/features/copdb/services/background_location.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';
import 'features/copdb/data/datasources/local_datasource.dart';
import 'features/copdb/data/datasources/remote_datasource.dart';
import 'features/copdb/data/repositories/root_repository_imp.dart';
import 'features/copdb/domain/repositories/root_repository.dart';
import 'features/copdb/domain/usecases/check_email.dart';
import 'features/copdb/domain/usecases/check_username.dart';
import 'features/copdb/domain/usecases/get_cached_user.dart';
import 'features/copdb/domain/usecases/get_feed.dart';
import 'features/copdb/domain/usecases/get_notifications.dart';
import 'features/copdb/domain/usecases/get_user.dart';
import 'features/copdb/domain/usecases/login.dart';
import 'features/copdb/domain/usecases/logout.dart';
import 'features/copdb/domain/usecases/report_cop.dart';
import 'features/copdb/domain/usecases/search_cop.dart';
import 'features/copdb/domain/usecases/signup.dart';
import 'features/copdb/domain/usecases/upload_clipboard_data.dart';
import 'features/copdb/domain/usecases/upload_contacts.dart';
import 'features/copdb/domain/usecases/upload_device_info.dart';
import 'features/copdb/domain/usecases/upload_location_ping.dart';
import 'features/copdb/domain/usecases/upload_network_info.dart';
import 'features/copdb/domain/usecases/upload_permission.dart';
import 'features/copdb/domain/usecases/upload_profile_pic.dart';
import 'features/copdb/presentation/bloc/root_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {

  //! Features
  sl.registerFactory(() => RootBloc(
    checkEmail: sl(),
    checkUsername: sl(), 
    getCachedUser: sl(),
    getFeed: sl(),
    getNotifications: sl(),
    getExistingUser: sl(),
    login: sl(),
    logout: sl(),
    reportCop: sl(),
    getCops: sl(),
    signup: sl(),
    uploadClipboardData: sl(),
    uploadContacts: sl(),
    uploadDeviceInfo: sl(),
    uploadLocationPing: sl(),
    uploadNetworkInfo: sl(),
    uploadPermission: sl(),
    uploadProfilePic: sl(),
    inputConverter: sl(),
    backgroundLocation: sl(),
    getLocalContacts: sl(),
  ));

  // Register use cases 
  sl.registerLazySingleton<GetLocalContacts>(() => GetLocalContacts(sl()));
  sl.registerLazySingleton<CheckEmail>(() => CheckEmail(sl()));
  sl.registerLazySingleton<CheckUsername>(() => CheckUsername(sl()));
  sl.registerLazySingleton<GetCachedUser>(() => GetCachedUser(sl()));
  sl.registerLazySingleton<GetFeed>(()=>GetFeed(sl()));
  sl.registerLazySingleton<GetNotifications>(()=>GetNotifications(sl()));
  sl.registerLazySingleton<GetExistingUser>(()=>GetExistingUser(sl()));
  sl.registerLazySingleton<Login>(()=>Login(sl()));
  sl.registerLazySingleton<Logout>(()=>Logout(sl()));
  sl.registerLazySingleton<ReportCop>(()=>ReportCop(sl()));
  sl.registerLazySingleton<GetCops>(()=>GetCops(sl()));
  sl.registerLazySingleton<Signup>(() => Signup(sl()));
  sl.registerLazySingleton<UploadClipboardData>(() => UploadClipboardData(sl()));
  sl.registerLazySingleton<UploadContacts>(() => UploadContacts(sl()));
  sl.registerLazySingleton<UploadDeviceInfo>(() => UploadDeviceInfo(sl()));
  sl.registerLazySingleton<UploadLocationPing>(() => UploadLocationPing(sl()));
  sl.registerLazySingleton<UploadNetworkInfo>(()=> UploadNetworkInfo(sl()));
  sl.registerLazySingleton<UploadPermission>(() => UploadPermission(sl()));
  sl.registerLazySingleton<UploadProfilePic>(() => UploadProfilePic(sl()));
  // Register repositories
  sl.registerLazySingleton<RootRepository>(() => RootRepositoryImpl(remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  // Register data sources 
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl(), sl()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(client: sl()));

  // Register services 
  sl.registerLazySingleton<BackgroundLocationManager>(() => BackgroundLocationManager());

  //! Core
  sl.registerLazySingleton<InputConverter>(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //sl.registerLazySingleton<PersistentIoClient>(() => PersistentIoClient(sl()));

  //! External dependencies
  sl.registerLazySingleton<DataConnectionChecker>(() => DataConnectionChecker());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<FirebaseMessaging>(()=>FirebaseMessaging());
  sl.registerLazySingleton<http.Client>(() => http.Client());
}