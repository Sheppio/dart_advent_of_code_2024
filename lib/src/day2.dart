import 'dart:async';
import 'dart:io';

Future<void> day2() async {
  // https://adventofcode.com/2023/day/1/input
//   var input = '''7 6 4 2 1
// 1 2 7 8 9
// 9 7 6 2 1
// 1 3 2 4 5
// 8 6 4 4 1
// 1 3 6 7 9''';
  var input = await File('assets/day2_input.txt').readAsString();
  //print(input);
  final reports = <List<int>>[];
  for (var line in input.split('\n')) {
    final tokens = line.split(' ');
    final report = <int>[];
    for (var token in tokens) {
      report.add(int.parse(token));
    }
    reports.add(report);
  }

  // for (var report in reports) {
  //   print('${report.toString()} --> ${reportIsSafe(report)}');
  // }

  final safeCount = reports
      .map((r) => reportIsSafe(r))
      .toList()
      .where((test) => test == true)
      .length;

  print('Day 2, part 1: ${safeCount.toString()}');

  //Part 2

  //print('Part 2: ${similarityScore.toString()}');
}

bool reportIsSafe(List<int> report) {
  final initialDiff = report[1] - report[0];
  if (initialDiff == 0) return false;
  bool isIncreasing = false;
  //print('$report --> isIncreasing: $isIncreasing');
  if (initialDiff > 0) isIncreasing = true;
  for (var i = 0; i < report.length - 1; i++) {
    final a = report[i];
    final b = report[i + 1];
    final diff = b - a;
    if (isIncreasing && (diff < 1 || diff > 3)) return false;
    if (!isIncreasing && (diff > -1 || diff < -3)) return false;
  }
  return true;
}