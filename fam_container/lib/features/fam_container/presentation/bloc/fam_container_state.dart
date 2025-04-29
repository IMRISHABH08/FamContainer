part of 'fam_container_bloc.dart';

sealed class FamContainerState {}

final class FetchUiConfig extends FamContainerState {
  FetchUiConfig({
    required this.uiConfig,
    this.fetchNewConfig = false,
    this.isHc3Dismissed = false,
    this.isHc3AskedToRemindLater = false,
  });

  final UiConfig? uiConfig;
  final bool isHc3Dismissed;
  final bool fetchNewConfig;
  final bool isHc3AskedToRemindLater;

  FetchUiConfig copyWith({
    UiConfig? uiConfig,
    bool? fetchNewConfig,
    bool? isHc3Dismissed,
    bool? isHc3AskedToRemindLater,
  }) {
    return FetchUiConfig(
      uiConfig: uiConfig ?? this.uiConfig,
      fetchNewConfig: fetchNewConfig ?? this.fetchNewConfig,
      isHc3Dismissed: isHc3Dismissed ?? this.isHc3Dismissed,
      isHc3AskedToRemindLater:
          isHc3AskedToRemindLater ?? this.isHc3AskedToRemindLater,
    );
  }

  bool get isConfigAvailable => uiConfig != null;

  bool get hideHc3Card => (isHc3AskedToRemindLater || isHc3Dismissed);
}
