part of 'get_all_burung_tersedia_bloc.dart';

sealed class GetAllBurungTersediaState {}

final class GetAllBurungTersediaInitial extends GetAllBurungTersediaState {}

final class GetAllBurungTersediaLoading extends GetAllBurungTersediaState {}

final class GetBurungTersediaLoaded extends GetAllBurungTersediaState {
  final BurungSemuaTersediaModel burungTersedia;
  GetBurungTersediaLoaded({required this.burungTersedia});
}

final class GetBurungTersediaError extends GetAllBurungTersediaState {
  final String message;
  GetBurungTersediaError({required this.message});
}
