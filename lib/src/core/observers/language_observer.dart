import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:colibreria/src/features/shared/presentation/bloc/blocs.dart';

class LanguageObserver extends StatefulWidget {
  final Widget child;

  const LanguageObserver({super.key, required this.child});

  @override
  LanguageObserverState createState() => LanguageObserverState();
}

class LanguageObserverState extends State<LanguageObserver>
    with WidgetsBindingObserver {
  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);

    if (locales != null && locales.isNotEmpty) {
      context.read<LanguageBloc>().updateLanguage(locales.first);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LanguageBloc>().updateLanguage(
        WidgetsBinding.instance.platformDispatcher.locale,
      );
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
