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

  final _$isRecipeFavorireAtom =
      Atom(name: 'HomeControllerBase.isRecipeFavorire');

  @override
  bool get isRecipeFavorire {
    _$isRecipeFavorireAtom.reportRead();
    return super.isRecipeFavorire;
  }

  @override
  set isRecipeFavorire(bool value) {
    _$isRecipeFavorireAtom.reportWrite(value, super.isRecipeFavorire, () {
      super.isRecipeFavorire = value;
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
  void increaseDetailsStepsIndexAndValue() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.increaseDetailsStepsIndexAndValue');
    try {
      return super.increaseDetailsStepsIndexAndValue();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseDetailsStepsIndexAndValue() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.decreaseDetailsStepsIndexAndValue');
    try {
      return super.decreaseDetailsStepsIndexAndValue();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRecipeToFavorite() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setRecipeToFavorite');
    try {
      return super.setRecipeToFavorite();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRecipeToUnFavorite() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setRecipeToUnFavorite');
    try {
      return super.setRecipeToUnFavorite();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
drawerValue: ${drawerValue},
detailsStepsValue: ${detailsStepsValue},
detailsStepsIndex: ${detailsStepsIndex},
isRecipeFavorire: ${isRecipeFavorire}
    ''';
  }
}
