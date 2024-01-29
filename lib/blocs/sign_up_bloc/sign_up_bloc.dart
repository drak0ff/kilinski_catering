import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>(
      (event, emit) async {
        try {
        emit(SignUpProcess());
        await _userRepository.setUserData(
            await _userRepository.signUp(event.user, event.password));
        emit(SignUpSuccess());
        }
        catch(e) { emit(SignUpFailure()); }
      },
    );
  }
}
