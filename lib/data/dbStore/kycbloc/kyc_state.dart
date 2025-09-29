import 'package:equatable/equatable.dart';

import '../../../model/kyc_model.dart';

abstract class KycState extends Equatable {
  const KycState();
  @override
  List<Object?> get props => [];
}

class KycLoading extends KycState {}

class KycLoaded extends KycState {
  final List<KycModel> kycs;
  const KycLoaded(this.kycs);

  @override
  List<Object?> get props => [kycs];
}

class KycError extends KycState {
  final String message;
  const KycError(this.message);

  @override
  List<Object?> get props => [message];
}