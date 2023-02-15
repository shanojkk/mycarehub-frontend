const String completeSignUpMutation = r'''
mutation completeSignup($flavour: Flavour!){
  completeSignup(flavour: $flavour)
}
''';

const String registerDeviceTokenQuery = r'''
mutation RegisterPushToken($token: String!) {
  registerPushToken(token: $token)
}
''';

const String updateUserPinMutation = r'''
mutation UpdateUserPin($phone: String!, $pin: String!) {
  updateUserPIN(phone: $phone, pin: $pin)
}
 ''';

const String acceptTermsAndConditionsMutation = r'''
mutation acceptTerms($userID: String!, $termsID: Int!){
  acceptTerms(userID: $userID, termsID: $termsID)
}
 ''';

const String createHealthDiaryEntryMutation = r'''
mutation createHealthDiaryEntry($clientID: String!, $note: String,$mood:String!, $reportToStaff: Boolean!){
  createHealthDiaryEntry(clientID: $clientID, note: $note,mood: $mood,reportToStaff: $reportToStaff) 
}
 ''';

Map<String, dynamic> getTermsVariables({
  required String userId,
  required int termsId,
}) {
  return <String, dynamic>{
    'userID': userId,
    'termsID': termsId,
  };
}

const String setUserPINMutation = r'''
mutation setUserPin($input: PINInput!){
  setUserPIN(input: $input)
}
 ''';

Map<String, dynamic> setUserPINMutationVariables(
  Map<String, dynamic> setUserPINVariables,
) {
  return <String, dynamic>{'input': setUserPINVariables};
}

const String setNickNameMutation = r'''
mutation setNickName($userID: String!, $nickname: String!) {
  setNickName(userID: $userID, nickname: $nickname)
}
 ''';

const String completeOnboardingTourMutation = r'''
mutation completeOnboardingTour($userID: String!, $flavour: Flavour!){
  completeOnboardingTour(userID: $userID, flavour: $flavour)
}
 ''';

const String recordSecurityQuestionResponsesMutation = r'''
mutation recordSecurityQuestionResponses($input: [SecurityQuestionResponseInput!]!){
  recordSecurityQuestionResponses(input: $input){
    securityQuestionID,
    isCorrect
  }
}
 ''';

const String unlikeContentMutation = r'''
 mutation unlikeContent($clientID: String!, $contentID: Int!){
  unlikeContent(clientID: $clientID, contentID: $contentID)
}
''';

const String likeContentMutation = r'''
 mutation likeContent($clientID: String!, $contentID: Int!){
  likeContent(clientID: $clientID, contentID: $contentID)
}
''';

const String shareContentMutation = r'''
mutation shareContent($input: ShareContentInput!) {
  shareContent(input: $input)
}
''';

Map<String, dynamic> shareContentMutationVariables(
  Map<String, dynamic> shareContentVariables,
) {
  return <String, dynamic>{'input': shareContentVariables};
}

const String bookmarkContentMutation = r'''
mutation bookmarkContent($clientID: String!, $contentItemID: Int!){
  bookmarkContent(clientID: $clientID, contentItemID: $contentItemID)
}
''';

const String unbookmarkContentMutation = r'''
mutation unbookmarkContent($clientID: String!, $contentItemID: Int!){
  UnBookmarkContent(clientID: $clientID, contentItemID: $contentItemID)
}
''';

const String updateClientCaregiverMutation = r'''
mutation createOrUpdateClientCaregiver($caregiverInput: CaregiverInput){
  createOrUpdateClientCaregiver(caregiverInput: $caregiverInput)
}
''';

const String sendFeedbackMutation = r'''
mutation sendFeedback($input: FeedbackResponseInput!) {
  sendFeedback(input: $input)
}
''';

const String optOutMutation = r'''
mutation optOut($phoneNumber: String!, $flavour: Flavour!) {
  optOut(phoneNumber: $phoneNumber, flavour: $flavour)
}
''';

const String answerScreeningToolQuestionMutation = r'''
mutation answerScreeningToolQuestion($screeningToolResponses: [ScreeningToolQuestionResponseInput!]!){
  answerScreeningToolQuestion(screeningToolResponses: $screeningToolResponses)
}
''';

const String rescheduleAppointmentMutation = r'''
mutation rescheduleAppointment($appointmentID: String!, $date: Date!) {
  rescheduleAppointment(
    appointmentID: $appointmentID,
    date: $date,
  )
}
''';

const String shareHealthDiaryEntryMutation = r'''
mutation shareHealthDiaryEntry($healthDiaryEntryID: String!, $shareHealthDiaryEntry: Boolean!){
  shareHealthDiaryEntry(healthDiaryEntryID: $healthDiaryEntryID, shareEntireHealthDiary: $shareHealthDiaryEntry)
}
''';

const String setPushTokenMutation = r'''
mutation setPushToken($token: String!){
  setPushToken(token: $token)
}
''';

const String readNotificationsMutation = r'''
mutation readNotifications($ids: [ID!]!){
  readNotifications(ids: $ids)
}
''';

const String verifySurveySubmissionMutation = r'''
mutation verifySurveySubmission($input: VerifySurveySubmissionInput!){
  verifySurveySubmission(input: $input)
}
''';

const String deleteCommunityMessageMutation = r'''
mutation deleteCommunityMessage($messageID: String!){
  deleteCommunityMessage(messageID: $messageID)
}
''';

const String viewContentMutation = r'''
mutation viewContent($userID: String!, $contentID: Int!){
  viewContent(userID: $userID, contentID: $contentID)
}
''';

const String setClientDefaultFacilityMutation = r'''
mutation setClientDefaultFacility(
  $clientID: ID!
  $facilityID: ID!
){
  setClientDefaultFacility(
    clientID: $clientID
    facilityID: $facilityID
  ){
   	id
    name
    phone
    active
    country
    description
    fhirOrganisationID
    workStationDetails {
      notifications
      surveys
      articles
      messages
      serviceRequests
    }
  }
}
''';

const String setClientProgramMutation = r'''
mutation setClientProgram($programID: ID!) {
  setClientProgram(programID: $programID) {
    clientProfile {
      id
      user {
        id
        username
        name
        gender
        active
        contacts{
          id
          contactType
          contactValue
          active
          optedIn
        }
        dateOfBirth
        currentProgramID
        currentOrganizationID
      }
      active
      clientTypes
      treatmentEnrollmentDate
      fhirPatientID
      healthRecordID
      treatmentBuddy
      clientCounselled
      defaultFacility {
        id
        name
        phone
        active
        country
        description
        fhirOrganisationID
      }
      chvUserID
      chvUserName
      caregiverID
      cccNumber
    }
    roles {
      authorityRoleID
      name
      active
    }
    permissions {
      permissionID
      active
    }
    communityToken
  }
}
''';
