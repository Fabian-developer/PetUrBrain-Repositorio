import 'package:appbrain/model/User.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

import '../bloc/Home.dart';

ModelUser cUser;

final BlocHome blocHome = BlocProvider.getBloc<BlocHome>();
