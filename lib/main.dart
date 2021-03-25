import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/navigation.dart';
import 'widgets/contact_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return BlocProvider<NavigationBloc>(
      lazy: false,
      create: (context) => NavigationBloc(
        NavigationState(
          List<Page>.unmodifiable(<Page>[
            CupertinoPage(name: "/", child: ContactListView()),
          ]),
        ),
      ),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (BuildContext context, NavigationState state) {
          debugPrint("rendering App with state ${state.pages}");
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark().copyWith(),
            home: SafeArea(
              child: WillPopScope(
                onWillPop: () async {
                  BlocProvider.of<NavigationBloc>(context)
                    .add(NavigationEvent.pop());
                  // this prevents the app to pop on its own ensuring the app
                  // stays open and only triggers the event
                  return false;
                },
                child: Navigator(
                  pages: state.pages,
                  onPopPage: (Route route, result) {
                    BlocProvider.of<NavigationBloc>(context)
                        .add(NavigationEvent.pop());
                    return route.didPop(result);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
