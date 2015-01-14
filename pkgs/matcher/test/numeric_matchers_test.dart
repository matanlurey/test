// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library matcher.numeric_matchers_test;

import 'package:matcher/matcher.dart';
import 'package:unittest/unittest.dart' show test, group;

import 'test_utils.dart';

void main() {
  initUtils();

  test('greaterThan', () {
    shouldPass(10, greaterThan(9));
    shouldFail(9, greaterThan(10), "Expected: a value greater than <10> "
        "Actual: <9> "
        "Which: is not a value greater than <10>");
  });

  test('greaterThanOrEqualTo', () {
    shouldPass(10, greaterThanOrEqualTo(10));
    shouldFail(9, greaterThanOrEqualTo(10),
        "Expected: a value greater than or equal to <10> "
        "Actual: <9> "
        "Which: is not a value greater than or equal to <10>");
  });

  test('lessThan', () {
    shouldFail(10, lessThan(9), "Expected: a value less than <9> "
        "Actual: <10> "
        "Which: is not a value less than <9>");
    shouldPass(9, lessThan(10));
  });

  test('lessThanOrEqualTo', () {
    shouldPass(10, lessThanOrEqualTo(10));
    shouldFail(11, lessThanOrEqualTo(10),
        "Expected: a value less than or equal to <10> "
        "Actual: <11> "
        "Which: is not a value less than or equal to <10>");
  });

  test('isZero', () {
    shouldPass(0, isZero);
    shouldFail(1, isZero, "Expected: a value equal to <0> "
        "Actual: <1> "
        "Which: is not a value equal to <0>");
  });

  test('isNonZero', () {
    shouldFail(0, isNonZero, "Expected: a value not equal to <0> "
        "Actual: <0> "
        "Which: is not a value not equal to <0>");
    shouldPass(1, isNonZero);
  });

  test('isPositive', () {
    shouldFail(-1, isPositive, "Expected: a positive value "
        "Actual: <-1> "
        "Which: is not a positive value");
    shouldFail(0, isPositive, "Expected: a positive value "
        "Actual: <0> "
        "Which: is not a positive value");
    shouldPass(1, isPositive);
  });

  test('isNegative', () {
    shouldPass(-1, isNegative);
    shouldFail(0, isNegative, "Expected: a negative value "
        "Actual: <0> "
        "Which: is not a negative value");
  });

  test('isNonPositive', () {
    shouldPass(-1, isNonPositive);
    shouldPass(0, isNonPositive);
    shouldFail(1, isNonPositive, "Expected: a non-positive value "
        "Actual: <1> "
        "Which: is not a non-positive value");
  });

  test('isNonNegative', () {
    shouldPass(1, isNonNegative);
    shouldPass(0, isNonNegative);
    shouldFail(-1, isNonNegative, "Expected: a non-negative value "
        "Actual: <-1> "
        "Which: is not a non-negative value");
  });

  test('closeTo', () {
    shouldPass(0, closeTo(0, 1));
    shouldPass(-1, closeTo(0, 1));
    shouldPass(1, closeTo(0, 1));
    shouldFail(1.001, closeTo(0, 1),
        "Expected: a numeric value within <1> of <0> "
        "Actual: <1.001> "
        "Which: differs by <1.001>");
    shouldFail(-1.001, closeTo(0, 1),
        "Expected: a numeric value within <1> of <0> "
        "Actual: <-1.001> "
        "Which: differs by <1.001>");
  });

  test('inInclusiveRange', () {
    shouldFail(-1, inInclusiveRange(0, 2),
        "Expected: be in range from 0 (inclusive) to 2 (inclusive) "
        "Actual: <-1>");
    shouldPass(0, inInclusiveRange(0, 2));
    shouldPass(1, inInclusiveRange(0, 2));
    shouldPass(2, inInclusiveRange(0, 2));
    shouldFail(3, inInclusiveRange(0, 2),
        "Expected: be in range from 0 (inclusive) to 2 (inclusive) "
        "Actual: <3>");
  });

  test('inExclusiveRange', () {
    shouldFail(0, inExclusiveRange(0, 2),
        "Expected: be in range from 0 (exclusive) to 2 (exclusive) "
        "Actual: <0>");
    shouldPass(1, inExclusiveRange(0, 2));
    shouldFail(2, inExclusiveRange(0, 2),
        "Expected: be in range from 0 (exclusive) to 2 (exclusive) "
        "Actual: <2>");
  });

  test('inOpenClosedRange', () {
    shouldFail(0, inOpenClosedRange(0, 2),
        "Expected: be in range from 0 (exclusive) to 2 (inclusive) "
        "Actual: <0>");
    shouldPass(1, inOpenClosedRange(0, 2));
    shouldPass(2, inOpenClosedRange(0, 2));
  });

  test('inClosedOpenRange', () {
    shouldPass(0, inClosedOpenRange(0, 2));
    shouldPass(1, inClosedOpenRange(0, 2));
    shouldFail(2, inClosedOpenRange(0, 2),
        "Expected: be in range from 0 (inclusive) to 2 (exclusive) "
        "Actual: <2>");
  });
}
