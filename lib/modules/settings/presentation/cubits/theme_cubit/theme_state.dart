part of 'theme_cubit.dart';

class AppThemeState extends Equatable {
  final AppTheme appTheme;
  final bool isDarkMode;

  const AppThemeState({
    required this.appTheme,
    required this.isDarkMode,
  });

  copywith({AppTheme? appTheme, bool? isDarkMode}) => AppThemeState(
        appTheme: appTheme ?? this.appTheme,
        isDarkMode: isDarkMode ?? this.isDarkMode
      );

  @override
  List<Object> get props => [appTheme, isDarkMode];
}
