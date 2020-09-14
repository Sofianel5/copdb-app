import 'package:background_location/background_location.dart';
import 'package:copdb/core/errors/failures.dart';
import 'package:copdb/features/copdb/domain/entities/coordinates.dart';
import 'package:copdb/features/copdb/domain/usecases/upload_location_ping.dart';
import 'package:dartz/dartz.dart';

class BackgroundLocationManager {
  UploadLocationPing usecase;
  Either<Failure, bool> start() {
    return BackgroundLocation.getPermissions(
      onGranted: () {
        // Start location service here or do something else
        BackgroundLocation.startLocationService();
        return BackgroundLocation.getLocationUpdates(
          (location) {
            Coordinates coordinates =
                Coordinates(lat: location.latitude, lng: location.longitude);
            usecase(UploadLocationPingParams(coordinates));
            return Right(true);
          },
        );
      },
      onDenied: () {
        // Show a message asking the user to reconsider or do something else
        return Left(PermissionDeniedFailure);
      },
    );
  }
}
