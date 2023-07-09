abstract class GuidesState {}

class InitialGuidesState extends GuidesState {}

class ChangeFlagsSearchState extends GuidesState {}
class GetProviderLoadingState extends GuidesState {}
class GetProviderSuccessState extends GuidesState {}
class GetProviderErrorState extends GuidesState {
  final String error;
  GetProviderErrorState({required this.error});
}
