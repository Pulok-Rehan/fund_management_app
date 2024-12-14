import 'chartData.dart';

class StaticData {
  static const String userName = 'Pulok Rehan';
  static const String accountNumber = '1011012323930';

  static List<ChartData> depositsData = [
    ChartData('December', 2),
    ChartData('November', 5),
    ChartData('October', 1),
    ChartData('September', 3),
  ];

  static List<ChartData> withdrawalsData = [
    ChartData('December', 5),
    ChartData('November', 1),
    ChartData('October', 3),
    ChartData('September', 1),
  ];

  static List<ChartData> transfersData = [
    ChartData('December', 1),
    ChartData('November', 2),
    ChartData('October', 3),
    ChartData('September', 5),
  ];
}