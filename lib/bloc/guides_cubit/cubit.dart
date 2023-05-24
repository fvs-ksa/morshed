import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morshed/bloc/guides_cubit/state.dart';

class GuidesCubit extends Cubit<GuidesState> {
  GuidesCubit() : super(InitialGuidesState());

  static GuidesCubit get(context) => BlocProvider.of(context);
  String? flag;
  List<Map<String, dynamic>> flags = [
    {
      "id": 1,
      "flag": 'assets/images/saudia.png',
    },
    {
      "id": 2,
      "flag": 'assets/images/India.png',
    }
  ];

  onChangeFlagsSearch(onChange) {
    flag = onChange;
    emit(ChangeFlagsSearchState());
  }
}
