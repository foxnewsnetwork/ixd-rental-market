library reducers;
import 'package:redux/redux.dart';
import './data.dart';

abstract class AppAction {
  
}

final Reducer<AppState> appReduce = combineTypedReducers([
  new ReducerBinding((AppState state, action) => state)
]);

