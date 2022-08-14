abstract class MFKRegisterStates {}

class MFKRegisterInitialState extends MFKRegisterStates {}

class MFKRegisterLoadingState extends MFKRegisterStates {}

class MFKRegisterSuccesState extends MFKRegisterStates {}

class MFKRegisterErrorState extends MFKRegisterStates {}

class MFKCreateUserLoadingState extends MFKRegisterStates {}

class MFKCreateUserSuccesState extends MFKRegisterStates {}

class MFKCreateUserErrorState extends MFKRegisterStates {}

class MFKRegisterChangePassVisibailty extends MFKRegisterStates {}
