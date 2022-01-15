import 'package:portfolio/model/data.dart';

class DummyData {
  static Data getData(int index) {
    return [
      Data("Since yesterday", "50k", "127", "375", "\$9745"),
      Data("Since last week", "300k", "537", "1217", "20k"),
      Data("Since last month", "1.2M", "8.54k", "17k", "100k"),
      Data("Since first quarter", "5M", "21k", "41k", "287k"),
      Data("Since second quarter", "11.5M", "40k", "67k", "517k"),
      Data("Since last quarter", "16.5M", "57k", "91k", "745k"),
      Data("Since last year", "20M", "75k", "121k", "1M")
    ][index];
  }
}
