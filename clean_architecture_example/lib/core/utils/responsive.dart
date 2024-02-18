import 'package:flutter/material.dart';

import '../constants/constants.export.dart';


///Ex ===> width : fullWi(),
double fullWi() {
  return MediaQuery.of(navKey.currentContext!).size.width;
}

///Ex ===> height : fullHi(),
double fullHi() {
  return MediaQuery.of(navKey.currentContext!)
      .size
      .height;
}

///Ex ===> height : hi(0.2)
double hi(size) {
  final hi =
      MediaQuery.of(navKey.currentContext!).size.height;
  final wi =
      MediaQuery.of(navKey.currentContext!).size.width;
  if (wi > 450) {
    return (hi * size) / 10;
    /// Tablet
  } else {
    if (hi > 732) {
      return (hi * size) / 12;
      /// Normal device
    } else {
      return (hi * size) / 10;
      /// Small device
    }
  }
}

///Ex ===> width : wi(0.2),
double wi(size) {
  final wi =
      MediaQuery.of(navKey.currentContext!).size.width;
  return (wi * size) / 12;
  /// All device
}

///Ex ===> fontSize: font(0.4)
///value : 0.4 ===> fontSize: 18 , pixel on normal device
double font(size) {
  final wi =
      MediaQuery.of(navKey.currentContext!).size.width;
  final hi =
      MediaQuery.of(navKey.currentContext!).size.height;
  if (wi > 450) {
    return (wi * size) / 13;
    /// Tablet
  } else {
    if (hi > 732) {
      return (wi * size) / 8;
      /// Normal device
    } else {
      return (wi * size) / 8.5;
      /// Small device
    }
  }
}

///Ex ===> height : sized16()
///value : 16 pixel on normal device
double sized16() {
  final wi =
      MediaQuery.of(navKey.currentContext!).size.width;
  if (wi > 450) {
    return (wi * 0.33) / 12;
    /// Tablet
  } else {
    return (wi * 0.33) / 8;
    /// Normal device
  }
}