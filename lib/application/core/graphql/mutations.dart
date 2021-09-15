import 'package:intl/intl.dart';
import 'package:user_feed/user_feed.dart';

const String setCommSettingsMutation = r'''
mutation SetUserCommunicationsSettings($allowWhatsApp: Boolean, $allowTextSMS: Boolean, $allowPush: Boolean, $allowEmail: Boolean) {
  setUserCommunicationsSettings(allowWhatsApp: $allowWhatsApp, allowTextSMS: $allowTextSMS, allowPush: $allowPush, allowEmail: $allowEmail){
    allowWhatsApp
    allowPush
    allowEmail
    allowTextSMS
  }
}
 ''';

const String completeSignUpMutation = r'''
mutation completeSignup($flavour: Flavour!){
  completeSignup(flavour: $flavour)
}
''';

const String confirmEmail = r'''
mutation ConfirmEmail($input: String!){
  confirmEmail(email: $input){
    emails
  }
}
 ''';

Map<String, dynamic> confirmEmailVariables(String email) {
  return <String, dynamic>{'input': email};
}

const String updateUserProfileMutation = r'''
mutation updateUserProfile($input: UserProfileInput!) {
  updateUserProfile(input: $input) {
    userBioData {
      firstName
      lastName
      gender
      dateOfBirth
    }
  }
}
''';

Map<String, dynamic> updateUserProfileMutationVariables(
    Map<String, dynamic> userProfileVariables) {
  return <String, dynamic>{'input': userProfileVariables};
}

const String setLanguagePreference = r'''
mutation SetLanguagePreference($language: Language!) {
  setLanguagePreference(language: $language)
}
''';

const String addCustomerAccount = r'''
 mutation AddCustomer($input: String!){
  addCustomer(name: $input){
    customerId
  }
}
  ''';

const String verifyEmailOTPQuery = r'''
  mutation VerifyEmailOTP($email: String!, $otp: String!){
  verifyEmailOTP(email: $email, otp: $otp)
}
   ''';

const String setPrimaryEmail = r'''
mutation SetPrimaryEmailAddress($email: String! $otp: String!){
  setPrimaryEmailAddress(email: $email, otp: $otp)
}
''';

const String authorizeVisitByOTP = r'''
mutation AuthorizeByOTP(
  $msisdn: String!,
  $otp: String!,
  $branchProfileID: String!,
  $payerSladeCode: Int!,
  $memberNumber: String!,
  $benefitCode: String!,
  $benefitType: String!,
  $selfieBase64: String!,
  $selfieContentType: ContentType!
) {
  authorizeByOTP(
    msisdn: $msisdn,
    otp: $otp,
    branchProfileID: $branchProfileID,
    payerSladeCode: $payerSladeCode,
    memberNumber: $memberNumber,
    benefitCode: $benefitCode,
    benefitType: $benefitType,
    selfieBase64: $selfieBase64,
    selfieContentType: $selfieContentType
  ) {
    authorization {
      id
      guid
      strongAuthentication
      providerName
      authCode
      expiry
      isOpen
      isComplete
      label
      authorizationType
      token
      status
      dateAuthorized
    }
  }
}
''';

const String registerDeviceTokenQuery = r'''
mutation RegisterPushToken($token: String!) {
  registerPushToken(token: $token)
}
''';

Map<String, dynamic> deviceTokenVariables(String token) {
  return <String, dynamic>{'token': token};
}

const String resolveFeedItemMutation = r'''
    mutation ResolveFeedItem($flavour: Flavour!, $itemID: String!) {
  resolveFeedItem(flavour: $flavour, itemID: $itemID){
    id
  }
}
''';

const String pinFeedItemMutation = r'''
    mutation PinFeedItem($flavour: Flavour!, $itemID: String!) {
  pinFeedItem(flavour: $flavour, itemID: $itemID){
    id
  }
}
''';

const String hideFeedItemMutation = r'''
    mutation HideFeedItem($flavour: Flavour!, $itemID: String!) {
      hideFeedItem(flavour: $flavour, itemID: $itemID){
    id
  }
}''';

const String createMemberProfileRequest = r'''
mutation createMemberProfileRequest($input: CreateMemberProfileRequestInput!){
  createMemberProfileRequest(input: $input){
    state
  }
}
''';

const String uploadPhotoMutation = r'''
mutation Upload($uploadInput: UploadInput!){
  upload(input: $uploadInput){
    id
  }
}
''';

const String updateUserPinMutation = r'''
mutation UpdateUserPin($phone: String!, $pin: String!) {
  updateUserPIN(phone: $phone, pin: $pin)
}
 ''';

/// [postMessage] mutation
/// the mutation is used to post a message for a feed item thread replying to specific item
const String postMessageMutation = r'''
mutation postMessage($flavour: Flavour!, $message: MsgInput!, $itemID: String!) {
  postMessage(
    flavour: $flavour,
    itemID: $itemID,
    message: $message,
  ) {
    id
    sequenceNumber
    text
    replyTo
    postedByUID
    postedByName
    timestamp
  }
}
''';

/// [postMessage] variables
/// this are the variables required to post a reply to a thread
Map<String, dynamic> postMessageVariables(
  String replyTo,
  String itemID,
  int sequenceNumber,
  String replyMessage,
  String postedByName,
  String postedByUID,
  String replyTimeStamp,
) {
  return <String, dynamic>{
    'flavour': Flavour.CONSUMER.name,
    'itemID': itemID,
    'message': <String, dynamic>{
      'replyTo': replyTo,
      'postedByName': postedByName,
      'postedByUID': postedByUID,
      'id': '',
      'sequenceNumber': sequenceNumber,
      'text': replyMessage,
      'timestamp': replyTimeStamp
    }
  };
}

const String updateBioDataMutation = r'''
    mutation UpdateBiodata($input: BiodataInput!) {
  updateBiodata(input: $input) {
    dateOfBirth
    gender
    isApproved
    termsAccepted
    msisdns
  }
}''';

Map<String, dynamic> updateBioDataMutationVariables(
    DateTime selectedServerDate, String selectedGender) {
  return <String, dynamic>{
    'input': <String, dynamic>{
      'dateOfBirth':
          DateFormat('yyyy-MM-dd').format(selectedServerDate).toString(),
      'gender': selectedGender.toLowerCase(),
    }
  };
}
