import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
part 'nav_screen_state.dart';

class NavScreenCubit extends Cubit<NavScreenState> {
  NavScreenCubit(this.navigationShell) : super(NavScreenInitial());
  static NavScreenCubit get(context) => BlocProvider.of(context);
  int selectedIndex = 0;
  final StatefulNavigationShell navigationShell;
  onChangeIndex(int index) {
    selectedIndex = index;
    navigationShell.goBranch(
      selectedIndex,
      initialLocation: index == navigationShell.currentIndex,
    );
    emit(OnChangeNavBarIndexState());
  }
}
