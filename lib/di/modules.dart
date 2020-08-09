
import 'package:koin/koin.dart';

import '../data/data_provider.dart';
import '../data/filter_provider.dart';

var providersModule = Module()
    ..single((scope) => DataProvider())
    ..single((scope) => FilterProvider());