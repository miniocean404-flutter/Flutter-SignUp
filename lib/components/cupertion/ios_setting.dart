// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoNavigationBarDemo extends StatelessWidget {
  const CupertinoNavigationBarDemo({Key? key}) : super(key: key);

  static const String homeRoute = '/home';
  static const String secondPageRoute = '/home/item';

  @override
  Widget build(BuildContext context) {
    return Navigator(
      restorationScopeId: 'navigator',
      initialRoute: CupertinoNavigationBarDemo.homeRoute,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CupertinoNavigationBarDemo.homeRoute:
            return _NoAnimationCupertinoPageRoute<void>(
              title: 'title',
              settings: settings,
              builder: (context) => _FirstPage(),
            );

          case CupertinoNavigationBarDemo.secondPageRoute:
            final arguments = settings.arguments as Map<dynamic, dynamic>;
            final title = arguments['pageTitle'] as String;
            return CupertinoPageRoute<void>(
              title: title,
              settings: settings,
              builder: (context) => _SecondPage(),
            );
        }
        return null;
      },
    );
  }
}

class _FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            largeTitle: Text('标题1'),
            automaticallyImplyLeading: false,
          ),
          const CupertinoSliverRefreshControl(
              // onRefresh: () {
              //   return 1;
              // },
              ),
          SliverPadding(
            padding: MediaQuery.of(context).removePadding(removeTop: true).padding,
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  const title = 'title2';
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).restorablePushNamed<void>(
                        CupertinoNavigationBarDemo.secondPageRoute,
                        arguments: {'pageTitle': title},
                      );
                    },
                    title: const Text(title),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: Container(),
    );
  }
}

/// A CupertinoPageRoute without any transition animations.
class _NoAnimationCupertinoPageRoute<T> extends CupertinoPageRoute<T> {
  _NoAnimationCupertinoPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    required String title,
  }) : super(
          builder: builder,
          settings: settings,
          title: title,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
