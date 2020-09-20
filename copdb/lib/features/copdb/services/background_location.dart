import 'package:copdb/core/network/urls.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;
import 'package:meta/meta.dart';

class BackgroundLocationManager {
  bg.Location location;
  BackgroundLocationManager();
    
  void start({@required userId,@required authToken}) async {
    bg.BackgroundGeolocation.ready(bg.Config(
        desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
        distanceFilter: 10.0,
        stopOnTerminate: false,
        reset: true,
        url: Urls.UPLOAD_LOCATION,
        method: 'POST',
        params: {
          "user": userId,
          "timestamp": DateTime.now().toIso8601String()
        },
        disableMotionActivityUpdates: true,
        headers: {
          "Authorization": "Token $authToken"
        },
        autoSync: true,
        startOnBoot: true,
        debug: true, //! Mark false when deploying
        preventSuspend: true,
        heartbeatInterval: 60,
        schedule: [
          '1-7 7:00-10:00',
          '1-7 11:00-12:00',
          '1-7 13:00-14:00',
          '1-7 15:00-16:00',
          '1-7 17:00-18:00',
          '1,6,7 20:00-00:00'
        ],
        logLevel: bg.Config.LOG_LEVEL_VERBOSE
    )).then((bg.State state) {
      if (!state.enabled) {
        bg.BackgroundGeolocation.start();
        bg.BackgroundGeolocation.startSchedule();
      }
    });
  }
}
