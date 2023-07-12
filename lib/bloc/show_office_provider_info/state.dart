abstract class ShowOfficesAndProviderInfoState{}
class InitialShowDataState extends ShowOfficesAndProviderInfoState{}
class ChangeTabBarState extends ShowOfficesAndProviderInfoState{}
class GetAllOfficesDataSuccessState extends ShowOfficesAndProviderInfoState{}
class GetAllOfficesDataLoadingState extends ShowOfficesAndProviderInfoState{}
class GetAllOfficesDataErrorState extends ShowOfficesAndProviderInfoState{
  final String error;
  GetAllOfficesDataErrorState({required this.error});
}

class FullMarkListState extends ShowOfficesAndProviderInfoState{}
class ChangeTabbedMarkerState extends ShowOfficesAndProviderInfoState{}