abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginUserLoadingState extends LoginStates {}

class LoginParentSuccessState extends LoginStates {}

class LoginParentErrorState extends LoginStates {}

class LoginDoctorSuccessState extends LoginStates {}

class LoginDoctorErrorState extends LoginStates {}

class LoginUserErrorState extends LoginStates {}

class LoginChangeTypeOfUserState extends LoginStates {}
