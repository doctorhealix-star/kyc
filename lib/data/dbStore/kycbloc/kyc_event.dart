import 'package:equatable/equatable.dart';
import '/model/kyc_model.dart';

abstract class KycEvent extends Equatable {
  const KycEvent();
  @override
  List<Object?> get props => [];
}

class LoadKycs extends KycEvent {}

class AddKyc extends KycEvent {
  final KycModel kyc;
  const AddKyc(this.kyc);
  @override
  List<Object?> get props => [kyc];
}

class UpdateKyc extends KycEvent {
  final KycModel kyc;
  const UpdateKyc(this.kyc);
  @override
  List<Object?> get props => [kyc];
}

class DeleteKyc extends KycEvent {
  final int id;
  const DeleteKyc(this.id);
  @override
  List<Object?> get props => [id];
}
