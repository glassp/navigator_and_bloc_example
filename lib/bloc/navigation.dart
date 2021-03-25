import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc(NavigationState initialState) : super(initialState);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    debugPrint("NavigationEvent with page ${event.page} triggered");
    if (event.page == null) {
      if (state.pages.length == 1) {
        // if we're on the root page we stay there.

        yield state;
      } else {
        // copy the stack of pages without the last (current displayed)
        var newState =
            List<Page>.unmodifiable(<Page>[...state.pages]..removeLast());
        yield NavigationState(newState);
      }
    } else {
      // copy the stack of pages and add the new one (we want to display)
      var newState =
          List<Page>.unmodifiable(<Page>[...state.pages, event.page!]);
      yield NavigationState(newState);
    }
  }
}

class NavigationEvent {
  final Page? page;

  NavigationEvent(this.page);

  /// this is not strictly needed but more intuitive that NavigationEvent(null)
  factory NavigationEvent.pop() => NavigationEvent(null);
}

/// The NavigationState is just wrapper around the page stack of the [Navigator]
class NavigationState {
  final List<Page> pages;

  NavigationState(this.pages);
}
