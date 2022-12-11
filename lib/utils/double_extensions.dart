import 'package:intl/intl.dart';

extension XDouble on double? {
  String toPercentFormat() => NumberFormat('#,##0.00', 'en_US').format(this);
}