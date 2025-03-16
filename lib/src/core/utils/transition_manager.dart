import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class TransitionManager {
  static final TransitionManager _instance = TransitionManager._internal();

  TransitionManager._internal();

  factory TransitionManager() {
    return _instance;
  }

  Page<T> slideVerticalTransitionPage<T>({
    required Widget child,
    required GoRouterState state,
  }) {
    return _platformPage(
      state: state,
      child: child,
      transition: (context, animation, secondaryAnimation, child) {
        var offsetAnimation = animation.drive(
          Tween(
            begin: const Offset(0.0, 1.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut)),
        );
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  Page<T> fadeTransitionPage<T>({
    required Widget child,
    required GoRouterState state,
  }) {
    return _platformPage(
      state: state,
      child: child,
      transition: (context, animation, secondaryAnimation, child) {
        var fadeAnimation = animation.drive(
          Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeIn)),
        );
        return FadeTransition(opacity: fadeAnimation, child: child);
      },
    );
  }

  Page<T> scaleTransitionPage<T>({
    required Widget child,
    required GoRouterState state,
  }) {
    return _platformPage(
      state: state,
      child: child,
      transition: (context, animation, secondaryAnimation, child) {
        var scaleAnimation = animation.drive(
          Tween(
            begin: 0.8,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.easeOutBack)),
        );
        return ScaleTransition(scale: scaleAnimation, child: child);
      },
    );
  }

  Page<T> rotateTransitionPage<T>({
    required Widget child,
    required GoRouterState state,
  }) {
    return _platformPage(
      state: state,
      child: child,
      transition: (context, animation, secondaryAnimation, child) {
        var rotationAnimation = animation.drive(
          Tween(
            begin: 0.0,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.easeInOut)),
        );
        return RotationTransition(turns: rotationAnimation, child: child);
      },
    );
  }

  Page<T> scaleFadeTransitionPage<T>({
    required Widget child,
    required GoRouterState state,
  }) {
    return _platformPage(
      state: state,
      child: child,
      transition: (context, animation, secondaryAnimation, child) {
        var scaleAnimation = animation.drive(
          Tween(
            begin: 0.8,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.easeInOut)),
        );
        var fadeAnimation = animation.drive(
          Tween(
            begin: 0.0,
            end: 1.0,
          ).chain(CurveTween(curve: Curves.easeInOut)),
        );
        return FadeTransition(
          opacity: fadeAnimation,
          child: ScaleTransition(scale: scaleAnimation, child: child),
        );
      },
    );
  }

  Page<T> slideTransition<T>({
    required Widget child,
    required GoRouterState state,
  }) {
    return _platformPage(
      state: state,
      child: child,
      transition: (context, animation, secondaryAnimation, child) {
        var offsetAnimation = animation.drive(
          Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut)),
        );
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  Page<T> _platformPage<T>({
    required GoRouterState state,
    required Widget child,
    required Widget Function(
      BuildContext,
      Animation<double>,
      Animation<double>,
      Widget,
    )?
    transition,
  }) {
    return (Platform.isIOS)
        ? CupertinoPage<T>(key: state.pageKey, child: child)
        : CustomTransitionPage<T>(
          key: state.pageKey,
          child: child,
          transitionsBuilder:
              transition ??
              (context, animation, secondaryAnimation, child) => child,
        );
  }
}
