// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Manrope.ttf
  String get manrope => 'assets/fonts/Manrope.ttf';

  /// List of all assets
  List<String> get values => [manrope];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/beforeAf.svg
  String get beforeAf => 'assets/icons/beforeAf.svg';

  /// File path: assets/icons/bell.svg
  String get bell => 'assets/icons/bell.svg';

  /// File path: assets/icons/camer.svg
  String get camer => 'assets/icons/camer.svg';

  /// File path: assets/icons/check.svg
  String get check => 'assets/icons/check.svg';

  /// File path: assets/icons/cong.svg
  String get cong => 'assets/icons/cong.svg';

  /// File path: assets/icons/cup.svg
  String get cup => 'assets/icons/cup.svg';

  /// File path: assets/icons/edit.svg
  String get edit => 'assets/icons/edit.svg';

  /// File path: assets/icons/energy.svg
  String get energy => 'assets/icons/energy.svg';

  /// File path: assets/icons/energy2.svg
  String get energy2 => 'assets/icons/energy2.svg';

  /// File path: assets/icons/exit.svg
  String get exit => 'assets/icons/exit.svg';

  /// File path: assets/icons/filter.svg
  String get filter => 'assets/icons/filter.svg';

  /// File path: assets/icons/fire.svg
  String get fire => 'assets/icons/fire.svg';

  /// File path: assets/icons/gym.svg
  String get gym => 'assets/icons/gym.svg';

  /// File path: assets/icons/health.svg
  String get health => 'assets/icons/health.svg';

  /// File path: assets/icons/locator.svg
  String get locator => 'assets/icons/locator.svg';

  /// File path: assets/icons/noInternet.svg
  String get noInternet => 'assets/icons/noInternet.svg';

  /// File path: assets/icons/nodata.svg
  String get nodata => 'assets/icons/nodata.svg';

  /// File path: assets/icons/play.svg
  String get play => 'assets/icons/play.svg';

  /// File path: assets/icons/security.svg
  String get security => 'assets/icons/security.svg';

  /// File path: assets/icons/timer.svg
  String get timer => 'assets/icons/timer.svg';

  /// List of all assets
  List<String> get values => [
    beforeAf,
    bell,
    camer,
    check,
    cong,
    cup,
    edit,
    energy,
    energy2,
    exit,
    filter,
    fire,
    gym,
    health,
    locator,
    noInternet,
    nodata,
    play,
    security,
    timer,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

abstract final class Assets {
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
