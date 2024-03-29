import 'package:copdb/core/errors/failures.dart';
import 'package:copdb/core/localizations/messages.dart';
import 'package:dartz/dartz.dart';
import 'package:validators/sanitizers.dart';
import 'package:validators/validators.dart';

class InputConverter {
  Either<Failure, String> parseName(String input) {
    if (isNull(input)) {
      return Left(InvalidInputFailure(message: Messages.NULL_NAME_INPUT));
    }
    if (isAlpha(input)) {
      if (isLength(input, 2, 99)) {
        return Right(trim(input));
      } else {
        return Left(InvalidInputFailure(message: Messages.INVALID_LENGTH_NAME_INPUT));
      }
    } else {
      final shortened = whitelist(
          input, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ");
      if (isLength(shortened, 2, 99)) {
        return Right(shortened);
      } else {
        return Left(InvalidInputFailure(message: Messages.INVALID_NAME_INPUT));
      }
    }
  }

  Either<Failure, String> parseEmail(String input) {
    if (isNull(input)) {
      return Left(InvalidInputFailure(message: Messages.NULL_EMAIL_INPUT));
    }
    var email = trim(input);
    if (isEmail(email)) {
      if (isLength(email, 5, 149)) {
        return Right(normalizeEmail(email));
      } else {
        return Left(InvalidInputFailure(message: Messages.INVALID_LENGTH_EMAIL));
      }
    } else {
      return Left(InvalidInputFailure(message: Messages.INVALID_EMAIL_INPUT));
    }
  }

  Either<Failure, String> parseUsername(String input) {
    if (isNull(input)) {
      return Left(InvalidInputFailure(message: Messages.NULL_USERNAME_INPUT));
    }
    Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(input))
      return Left(InvalidInputFailure(message: Messages.INVALID_USERNAME_INPUT));
    else
      return Right(input);
  }

  Either<Failure, String> parsePassword(String input) {
    if (isNull(input)) {
      return Left(InvalidInputFailure(message: Messages.NULL_PASSWORD_INPUT));
    }
    if (isLength(input, 8, 150)) {
      return Right(input);
    }
    return Left(InvalidInputFailure(message: Messages.INVALID_LENGTH_PASSWORD_INPUT));
  }

  Map<String, String> validateLoginForm(String username, String password) {
    final usernameMessage = parseUsername(username);
    final passwordMessage = parsePassword(password);
    final Map<String, String> messages = Map<String, String>.from({});
    usernameMessage.fold((failure) => {
      messages["username"] = failure.message
    }, (r) => {});
    passwordMessage.fold((failure) => {
      messages["password"] = failure.message
    }, (r) => {});
    return messages;
  }
  Either<Failure, String> validateSearchQuery(String query) {
    if (isNull(query)) {
      return Left(InvalidInputFailure(message: Messages.EMPTY_SEARCH_Q));
    } else {
      return Right(query);
    }
  }
  Either<Failure, String> validateUsername(String query) {
    if (isAlphanumeric(query)) {
      return Right(query);
    } else {
      return Left(InvalidInputFailure(message: Messages.INVALID_USERNAME));
    }
  }
  Either<Failure, Map<String, String>> extractParamters(String query) {
    List<String> words = query.split(" ");
    Map<String, String> queryParameters;
    if (words.length == 3) {
      for (var word in words) { 
        if (!(isNumeric(word))) {
          // If the word is a name
          
        }
      }
    }
  }
}