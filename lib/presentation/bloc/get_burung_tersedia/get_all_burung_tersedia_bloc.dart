import 'package:bloc/bloc.dart';
import 'package:canary/data/model/response/burung_semua_tersedia_model.dart';
import 'package:canary/data/repository/get_all_burung_tersedia_repository.dart';
import 'package:meta/meta.dart';

part 'get_all_burung_tersedia_event.dart';
part 'get_all_burung_tersedia_state.dart';

class GetBurungTersediaBloc
    extends Bloc<GetAllBurungTersediaEvent, GetAllBurungTersediaState> {
  final GetAllBurungTersediaRepository getAllBurungTersediaRepository;

  GetBurungTersediaBloc(this.getAllBurungTersediaRepository)
    : super(GetAllBurungTersediaInitial()) {
    on<GetAllBurungTersediaEvent>(_getAllBurungTersedia);
  }

  Future<void> _getAllBurungTersedia(
    GetAllBurungTersediaEvent event,
    Emitter<GetAllBurungTersediaState> emit,
  ) async {
    emit(GetAllBurungTersediaLoading());
    final result = await getAllBurungTersediaRepository.getAllBurungTersedia();
    result.fold(
      (error) => emit(GetBurungTersediaError(message: error)),
      (burungTersedia) =>
          emit(GetBurungTersediaLoaded(burungTersedia: burungTersedia)),
    );
  }
}
