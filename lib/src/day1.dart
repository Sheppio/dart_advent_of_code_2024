import 'dart:async';
import 'dart:io';

Future<void> day1() async {
  // https://adventofcode.com/2023/day/1/input
  var input = await File('assets/day1_input.txt').readAsString();
  print(input);
  final l1 = <int>[];
  final l2 = <int>[];
  for (var line in input.split('\n')) {
    final tokens = line.split('  ');
    l1.add(int.parse(tokens[0]));
    l2.add(int.parse(tokens[1]));
  }
  l1.sort();
  l2.sort();
  var totalDiff = 0;
  for (var i = 0; i < l1.length; i++) {
    final diff = (l1[i] - l2[i]).abs();
    print(diff);
    totalDiff += diff;
  }
  print(totalDiff);
}