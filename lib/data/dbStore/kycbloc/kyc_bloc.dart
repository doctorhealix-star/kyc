import 'package:flutter_bloc/flutter_bloc.dart';
import 'kyc_event.dart';
import 'kyc_state.dart';
import 'database_helper.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  final KycDbHelper dbHelper = KycDbHelper();

  KycBloc() : super(KycLoading()) {
    on<LoadKycs>((event, emit) async {
      emit(KycLoading());
      try {
        final kycs = await dbHelper.getAllKycs();
        emit(KycLoaded(kycs));
      } catch (e) {
        emit(KycError(e.toString()));
      }
    });

    on<AddKyc>((event, emit) async {
      await dbHelper.insertKyc(event.kyc);
      add(LoadKycs());
    });

    on<UpdateKyc>((event, emit) async {
      await dbHelper.updateKyc(event.kyc);
      add(LoadKycs());
    });

    on<DeleteKyc>((event, emit) async {
      await dbHelper.deleteKyc(event.id);
      add(LoadKycs());
    });
  }
}