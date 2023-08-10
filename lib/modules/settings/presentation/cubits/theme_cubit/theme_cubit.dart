import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/theme/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<AppThemeState> {
  ThemeCubit() : super(AppThemeState(appTheme: AppTheme(), isDarkMode: false));

  void onChangeBrightnessMode() {
    emit(state.copywith(
      appTheme: AppTheme(isDarkMode: !state.isDarkMode),
      isDarkMode: !state.isDarkMode
    ));
  }
}
