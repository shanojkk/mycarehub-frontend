// Package imports:

const String getCategoriesQuery = '''
query listContentCategories{
  listContentCategories{
   id
   name
   iconUrl
  }
}
''';

const String canRecordMoodQuery = r'''
query canRecordMood($clientID: String!){
  canRecordMood(clientID:$clientID )
}
''';

const String getSecurityQuestionsQuery = r'''
query getSecurityQuestions($flavour: Flavour!) {
  getSecurityQuestions(flavour: $flavour) {
    securityQuestionID
    questionStem
    description
    active
    responseType
  }
}
''';

const String getTermsQuery = '''
query getCurrentTerms {
  getCurrentTerms {
    termsID
    text
  }
}
''';

const String getContentQuery = r'''
query getContent($categoryID: Int, $limit: String!){
  getContent(categoryID: $categoryID, limit: $limit) {
    meta{
      totalCount
    }
    items {
      id
      title
      date
      intro
      authorName
      tagNames
      meta{
        contentType
        contentType
        contentHTMLURL
        slug
        showInMenus
        seoTitle
        searchDescription
        firstPublishedAt
        locale
      }
      itemType
      timeEstimateSeconds
      body
      heroImage{
        id
        title
      }
      heroImageRendition{
        url
        width
        height
        alt
      }
      likeCount
      bookmarkCount
      viewCount
      shareCount
      author {
        id
      }
      documents {
        id
        document {
          id
          title
          meta {
            documentDetailUrl
            documentDownloadUrl
          }
        }
      }
      categoryDetails{
        id
        categoryName
        categoryIcon
      }
      featuredMedia{
        id
        url
        title
        type
        duration
        width
        height
        thumbnail
        duration
      }
      galleryImages{
        id
        image{
          id
          title
          meta{
            imageDownloadUrl
          }
        }
      }
    }
  }
}
''';

const String getHealthDiaryQuoteQuery = r'''
query getHealthDiaryQuote($limit: Int!){
  getHealthDiaryQuote(limit: $limit){
    author
    quote
  }
}
''';

const String getHealthDiaryEntriesQuery = r'''
query getHealthDiaryEntries($clientID: String!, $moodType: Mood,$shared: Boolean ){
  getClientHealthDiaryEntries(clientID: $clientID, moodType: $moodType, shared: $shared){
    id
    active
    mood
    note
    entryType
    createdAt
    shareWithHealthWorker
    sharedAt
  }
}
''';
const String checkIfUserHasLikedContentQuery = r'''
query checkIfUserHasLikedContent($clientID: String!, $contentID: Int!){
  checkIfUserHasLikedContent(clientID: $clientID, contentID: $contentID)
}
''';

const String checkIfUserBookmarkedContentQuery = r'''
query checkIfUserBookmarkedContent($clientID: String!, $contentID: Int!) {
  checkIfUserBookmarkedContent(clientID: $clientID, contentID: $contentID)
}
''';

const String checkIfUserBookmarkedContentMutation = r'''
query checkIfUserBookmarkedContent($userID: String!, $contentID: Int!) {
  checkIfUserBookmarkedContent(userID: $userID, contentID: $contentID)
}
''';

const String getUserBookmarkedContentQuery = r'''
query getUserBookmarkedContent($clientID: String!){
  getUserBookmarkedContent(clientID: $clientID){
    items {
      id
      title
      date
      intro
      authorName
      tagNames
      meta{
        contentType
        contentType
        contentHTMLURL
        slug
        showInMenus
        seoTitle
        searchDescription
        firstPublishedAt
        locale
      }
      itemType
      timeEstimateSeconds
      body
      heroImage{
        id
        title
      }
      heroImageRendition{
        url
        width
        height
        alt
      }
      likeCount
      bookmarkCount
      viewCount
      shareCount
      author {
        id
      }
      documents {
        id
        document {
          id
          title
        }
        meta{
          type
          documentDetailUrl
          documentDownloadUrl
        }
      }
      categoryDetails{
        id
        categoryName
        categoryIcon
      }
      featuredMedia{
        id
        url
        title
        type
        duration
        width
        height
        thumbnail
      }
      galleryImages{
        id
        image{
          id
          title
          meta{
            type
            imageDetailUrl
            imageDownloadUrl
          }
        }
      }
    }
  }
}
''';

const String verifyPinQuery = r'''
query verifyPin($userID: String!, $flavour:Flavour!, $pin: String!){
  verifyPIN(userID: $userID, flavour: $flavour, pin: $pin)
}
''';

const String retrieveFacilityQuery = r'''
query retrieveFacility($id: String!, $active: Boolean!){
  retrieveFacility(id: $id, active: $active){
    id
    name
    code
    country
    active
    phone
    description
  }
}
''';

const String listUserInvitedCommunitiesQuery = r'''
query listPendingInvites($memberID: String!, $input: QueryOption){
  listPendingInvites(memberID: $memberID, input: $input){
    id
    name
    memberCount
    gender
    description
  }
}
''';

const String listAppointmentsQuery = r'''
query listAppointments(
  $clientID: ID!
  $paginationInput: PaginationsInput!
  $filters: [FilterParam!]
) {
  fetchClientAppointments(
    clientID: $clientID
    paginationInput: $paginationInput
    filters: $filters
  ) {
    appointments {
      id
      reason
      date
      HasRescheduledAppointment
    }
  }
}
''';

const String getScreeningToolsQuestionsQuery = r'''
query getScreeningToolByID($id :ID!) {
  getScreeningToolByID(
    id: $id
  ) {
   	id
    active
    questionnaireID
    threshold
    questionnaire {
      id
      active
      name
      description
      questions {
        id
        active
        text
        questionType
        responseValueType
        required
        selectMultiple
        sequence
        choices{
          id
          active
          questionID
          choice
          value
          score
        }
      }
    }
  }
}
''';

const String patientTimelineQuery = r'''
query patientTimeline($input: HealthTimelineInput!) {
  patientHealthTimeline(input: $input) {
    totalCount
    timeline
  }
}
''';

const String medicalDataQuery = r'''
query medicalData($patientID: String!) {
  getMedicalData(patientID: $patientID) {
    regimen {
      Category{
        Text
      }
      MedicationCodeableConcept{
        Text
      }
    }
    allergies {
      Code{
        Text
      }
    }
    weight{
      ValueString
    }
    viralLoad {
      ValueString
    }
    bmi {
      ValueString
    }
    cd4Count {
      ValueString
    }
  }
}
''';

const String searchObservationsQuery = r'''
query SearchObservations($params: Map!) {
  searchFHIRObservation(params: $params) {
    edges {
      node {
        ID
        Status
        Code {
          Text
          Coding {
            Display
            Code
            System
            UserSelected
          }
        }
        ValueString
        EffectiveInstant
      }
    }
  }
}
''';

const String getAvailableScreeningToolQuery = '''
query getAvailableScreeningTools (){
  getAvailableScreeningTools() {
   	id
    questionnaireID
    threshold
    questionnaire {
      id
      active
      name
      description
    }
  }
}
''';

const String nextRefillQuery = r'''
query nextRefill ($clientID: ID!){
  nextRefill(clientID: $clientID)
}
''';
const String listClientCaregiverQuery = r'''
query listClientsCaregivers($clientID: String!, $paginationInput: PaginationsInput!){
  listClientsCaregivers(clientID: $clientID, paginationInput: $paginationInput){
    caregivers{
      id
      user{
        id
        username
        name
        contacts{
          contactType
          contactValue
        }
      }
      caregiverNumber
      isClient
      consent{
        consentStatus
      }
      currentClient
      currentFacility
    }
  }
}
''';

const String listNotificationsQuery = r'''
query listNotifications(
  $flavour: Flavour!
  $userID: ID!
  $paginationInput: PaginationsInput!
   $filters: NotificationFilters
) {
  fetchNotifications(
    flavour: $flavour
    userID: $userID
    paginationInput: $paginationInput
    filters: $filters
  ) {
    notifications {
      id
      title
      body
      type
      isRead
      createdAt
    }
  }
}
''';

const String getUserSurveyFormsQuery = r'''
query getUserSurveyForms($userID: String!) {
  getUserSurveyForms(userID: $userID) {
    id,
    link,
    title,
    description,
    projectID,
    linkID,
    formID,
  }
}
''';

const String getFAQsQuery = r'''
query getFAQs($flavour: Flavour!){
  getFAQs(flavour: $flavour){
    items {
      id
      title
      date
      intro
      authorName
      tagNames
      meta{
        contentType
        slug
        showInMenus
        seoTitle
        searchDescription
        firstPublishedAt
        locale
      }
      itemType
      timeEstimateSeconds
      body
      heroImageRendition{
        url
        width
        height
        alt
      }
      documents {
        id
        document {
          id
          title
          meta {
            documentDetailUrl
            documentDownloadUrl
          }
        }
      }
      featuredMedia{
        id
        url
        title
        type
        duration
        width
        height
        thumbnail
        duration
      }
      galleryImages{
        id
        image{
          id
          title
          meta{
            imageDownloadUrl
          }
        }
      }
    }
  }
}
''';

const String fetchNotificationFiltersQuery = r'''
query fetchNotificationTypeFilters($flavour: Flavour!) {
  fetchNotificationTypeFilters(flavour: $flavour) {
  name,
  enum  
  }
}
''';

const String getClientFacilitiesQuery = r'''
query getClientFacilities($clientID: ID!, $paginationInput: PaginationsInput!){
  getClientFacilities(clientID: $clientID, paginationInput: $paginationInput){
    facilities{
      id
      name
      phone
      active
      country
      description
      fhirOrganisationID
      workStationDetails{
        notifications
        surveys
        articles
        messages
        serviceRequests
      }
    }
    pagination{
      limit
      currentPage
      count
      totalPages
      nextPage
      previousPage
    }
  }
}
''';

const String getCaregiverManagedClientsQuery = r'''
query getCaregiverManagedClients(
  $caregiverID: ID!, 
  $paginationInput: PaginationsInput!
){
  getCaregiverManagedClients(
    caregiverID: $caregiverID
    paginationInput: $paginationInput
  ){
    ManagedClients{
      caregiverConsent
			clientConsent
      clientProfile{
        id
        user{
          id
          username
          name
          contacts{
            id
            contactType
            contactValue
          }
          dateOfBirth
        }
      }
      workStationDetails{
        notifications
        surveys
      }
    }
  }
}
''';

const String listUserProgramsQuery = r'''
query listUserPrograms($userID: ID!, $flavour: Flavour!) {
  listUserPrograms(userID: $userID, flavour: $flavour) {
    count
    programs{
      id
      name
      active
      organisation{
        id
        name
        description
      }
    }
  }
}
''';
