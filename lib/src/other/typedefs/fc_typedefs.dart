
import 'package:formcraft/src/other/enums/enums.dart' show LoggerType;


typedef ChangedEvent = void Function(int index);

typedef ServerSideEvent<T> = Future<T> Function( );

typedef LogPrinter = Function(Object object, {String? name, LoggerType? level, StackTrace? stackTrace, bool debug});
