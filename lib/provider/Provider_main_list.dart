import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'feed_back_value.dart';

providerMainList() {
  List<SingleChildWidget> providerMainList = [
    ChangeNotifierProvider(create: (context) => FeedBackValue()),
  ];
  return providerMainList;
}
