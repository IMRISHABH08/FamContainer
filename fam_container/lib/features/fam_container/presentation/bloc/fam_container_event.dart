part of 'fam_container_bloc.dart';

sealed class FamContainerEvent {}

final class OnFetchUiConfig extends FamContainerEvent {}

final class OnRemindLater extends FamContainerEvent {}

final class OnBannerDismiss extends FamContainerEvent {}
