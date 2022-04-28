abstract class AppStates {}

class InitialState extends AppStates {}

class OpenDrawerState extends AppStates {}

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

class RefreshMessagesState extends AppStates {}
