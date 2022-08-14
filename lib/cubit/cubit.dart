

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfk/cubit/state.dart';

class MFKCubit extends Cubit<MFKStates> {
  MFKCubit() : super(InitialState());

  static MFKCubit get(context) => BlocProvider.of(context);

}