abstract class AppStates {}

class InitialState extends AppStates {}

class OpenDrawerState extends AppStates {}

class CheckWeightState extends AppStates {}

class CheckHeightState extends AppStates {}

class FillWeightState extends AppStates {}

class FillHeightState extends AppStates {}

class ChangeWeightState extends AppStates {}

class ChangeHeightState extends AppStates {}

class GetAllDoctorsLoadingState extends AppStates {}

class GetAllDoctorsSuccessState extends AppStates {}

class GetAllDoctorsErrorState extends AppStates {}

class GetAllParentsLoadingState extends AppStates {}

class GetAllParentsSuccessState extends AppStates {}

class GetAllParentsErrorState extends AppStates {}

class GetMessagesLoadingState extends AppStates {}

class GetMessagesSuccessState extends AppStates {}

class GetMessagesErrorState extends AppStates {}

class SendMessagesLoadingState extends AppStates {}

class SendMessagesSuccessState extends AppStates {}

class SendMessagesErrorState extends AppStates {}

class DoctorRateLoadingState extends AppStates {}

class DoctorRateSuccessState extends AppStates {}

class DoctorRateErrorState extends AppStates {}

class RefreshMessagesState extends AppStates {}
