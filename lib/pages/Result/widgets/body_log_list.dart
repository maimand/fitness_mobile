import 'package:fitness_mobile/data/models/exercise.model.dart';
import 'package:fitness_mobile/pages/Result/controllers/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class BodyLogList extends StatelessWidget {
  const BodyLogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ResultController>();
    return GroupedListView<BodyLog, String>(
      elements: controller.bodyLogs,
      groupBy: (element) =>
          DateFormat('dd-MM-yyyy').format(element.time ?? DateTime.now()),
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) => (item1.time ?? DateTime.now())
          .compareTo((item2.time ?? DateTime.now())),
      order: GroupedListOrder.ASC,
      useStickyGroupSeparators: true,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      itemBuilder: (c, log) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat('hh:mm a')
                    .format(log.time?.toLocal() ?? DateTime.now())),
                const SizedBox(height: 12),
                FullScreenWidget(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      log.image ?? '',
                      height: 200,
                    )
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
