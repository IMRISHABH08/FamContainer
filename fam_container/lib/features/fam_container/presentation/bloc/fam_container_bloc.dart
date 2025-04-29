import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/debug_log/log.dart';
import '../../../../core/local_storage_service/local_cache.dart';
import '../../../../core/local_storage_service/storage_keys.dart';
import '../../domain/entity/ui_config.dart';
import '../../domain/usecase/fam_usecase.dart';

part 'fam_container_event.dart';
part 'fam_container_state.dart';

class FamContainerBloc extends Bloc<FamContainerEvent, FamContainerState> {
  FamContainerBloc({required FamUsecase usecase})
      : _usecase = usecase,
        super(FetchUiConfig(uiConfig: null)) {
    on<OnFetchUiConfig>(_fetchUiConfig);
    on<OnRemindLater>(_onHc3RemindLater);
    on<OnBannerDismiss>(_onHc3DismissBanner);
    onInit();
  }

  // VARIABLES
  final FamUsecase _usecase;

  // GETTERS
  LocalCache get localStorage => GetIt.I.get();

  void onInit() {
    add(OnFetchUiConfig());
  }

  void _fetchUiConfig(
    OnFetchUiConfig event,
    Emitter<FamContainerState> emit,
  ) async {
    try {
      final uiConfig = await _usecase.fetchDynamicUIConfig();
      if (state is FetchUiConfig && uiConfig != null) {
        final isHc3Dismissed = await checkIsBannerDismiss();
        emit((state as FetchUiConfig)
            .copyWith(uiConfig: uiConfig, isHc3Dismissed: isHc3Dismissed));
      }
    } catch (e) {
      logError(e.toString());
      emit(FetchUiConfig(uiConfig: null));
    }
  }

  Future<bool> checkIsBannerDismiss() async {
    final isHc3Dismissed =
        await localStorage.getValue<bool>(LocalCacheKeys.isHc3Dismissed) ??
            false;
    return isHc3Dismissed;
  }

  Future<void> updateHc3BannerStatus(bool value) async {
    unawaited(
      localStorage.setValue<bool>(LocalCacheKeys.isHc3Dismissed, value),
    );
  }

  void _onHc3RemindLater(
    OnRemindLater event,
    Emitter<FamContainerState> emit,
  ) {
    if (state is FetchUiConfig) {
      emit((state as FetchUiConfig).copyWith(isHc3AskedToRemindLater: true));
    }
  }

  void _onHc3DismissBanner(
    OnBannerDismiss event,
    Emitter<FamContainerState> emit,
  ) {
    if (state is FetchUiConfig) {
      updateHc3BannerStatus(true);
      emit((state as FetchUiConfig).copyWith(isHc3Dismissed: true));
    }
  }
}
