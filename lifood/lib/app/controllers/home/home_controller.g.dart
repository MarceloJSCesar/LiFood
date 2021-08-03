// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeControllerBase, Store {
  final _$drawerValueAtom = Atom(name: 'HomeControllerBase.drawerValue');

  @override
  double get drawerValue {
    _$drawerValueAtom.reportRead();
    return super.drawerValue;
  }

  @override
  set drawerValue(double value) {
    _$drawerValueAtom.reportWrite(value, super.drawerValue, () {
      super.drawerValue = value;
    });
  }

  final _$detailsStepsValueAtom =
      Atom(name: 'HomeControllerBase.detailsStepsValue');

  @override
  double get detailsStepsValue {
    _$detailsStepsValueAtom.reportRead();
    return super.detailsStepsValue;
  }

  @override
  set detailsStepsValue(double value) {
    _$detailsStepsValueAtom.reportWrite(value, super.detailsStepsValue, () {
      super.detailsStepsValue = value;
    });
  }

  final _$detailsStepsIndexAtom =
      Atom(name: 'HomeControllerBase.detailsStepsIndex');

  @override
  int get detailsStepsIndex {
    _$detailsStepsIndexAtom.reportRead();
    return super.detailsStepsIndex;
  }

  @override
  set detailsStepsIndex(int value) {
    _$detailsStepsIndexAtom.reportWrite(value, super.detailsStepsIndex, () {
      super.detailsStepsIndex = value;
    });
  }

  final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase');

  @override
  void changeDrawerValue() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.changeDrawerValue');
    try {
      return super.changeDrawerValue();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseDetailsStepsValue() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.increaseDetailsStepsValue');
    try {
      return super.increaseDetailsStepsValue();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseDetailsStepsValue() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.decreaseDetailsStepsValue');
    try {
      return super.decreaseDetailsStepsValue();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseDetailsStepsIndex() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.increaseDetailsStepsIndex');
    try {
      return super.increaseDetailsStepsIndex();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseDetailsStepsIndex() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.decreaseDetailsStepsIndex');
    try {
      return super.decreaseDetailsStepsIndex();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
drawerValue: ${drawerValue},
detailsStepsValue: ${detailsStepsValue},
detailsStepsIndex: ${detailsStepsIndex}
    ''';
  }
}
