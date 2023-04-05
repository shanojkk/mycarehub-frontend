import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pro_health_360/domain/core/entities/terms_and_conditions/terms_and_conditions.dart';
import 'package:pro_health_360/domain/core/value_objects/asset_strings.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart' as core;

final String dir = Directory.current.path;

final Map<String, dynamic> clientProgramDataMock = <String, dynamic>{
  'data': <String, dynamic>{
    'setClientProgram': <String, dynamic>{
      'clientProfile': <String, dynamic>{
        'id': 'some-id',
        'user': <String, dynamic>{
          'id': 'some-id',
          'username': 'jr_jr',
          'name': 'JR jr JR',
          'gender': 'MALE',
          'active': true,
          'contacts': <String, dynamic>{
            'id': '',
            'contactType': '',
            'contactValue': '',
            'active': false,
            'optedIn': false
          }
        },
        'active': true,
        'clientTypes': <dynamic>['PMTCT', 'OVC', 'OTZ'],
        'treatmentEnrollmentDate': '2000-02-20T00:00:00Z',
        'FHIRPatientID': null,
        'healthRecordID': null,
        'treatmentBuddy': '',
        'clientCounselled': true,
        'defaultFacility': <String, dynamic>{
          'id': '5ec816ea-aa7f-40fc-af0d-5cdb87295f1e',
          'name': 'Kerugoya CRH',
          'phone': '+254712345678',
          'active': true,
          'county': 'County',
          'description': 'Opens from Monday to Friday from 8:00 to 17:00',
          'fhirOrganisationID': ''
        },
        'chvUserID': null,
        'chvUserName': '',
        'caregiverID': null,
        'identifiers': <dynamic>[
          <String, dynamic>{
            'id': 'some-id',
            'type': 'CCC',
            'value': '712345678'
          }
        ],
      },
      'roles': <dynamic>[],
      'permissions': <dynamic>[],
      'communityToken': 'token'
    }
  }
};

final Map<String, dynamic> userProgramsMock = <String, dynamic>{
  'data': <String, dynamic>{
    'listUserPrograms': <String, dynamic>{
      'count': 1,
      'programs': <dynamic>[
        <String, dynamic>{
          'id': 'some-id',
          'name': 'Mycarehub',
          'active': true,
          'organisation': <String, dynamic>{'id': 'some-id', 'description': ''}
        }
      ]
    }
  }
};

final Map<String, dynamic> clientFacilitiesMock = <String, dynamic>{
  'data': <String, dynamic>{
    'getClientFacilities': <String, dynamic>{
      'facilities': <dynamic>[
        <String, dynamic>{
          'id': 'some-id',
          'name': 'Some Facility',
          'phone': '+254712345678',
          'active': true,
          'county': 'Nairobi',
          'description': 'Opens from Monday to Friday from 8:00 to 17:00',
          'fhirOrganisationID': '',
          'workStationDetails': <String, dynamic>{
            'notifications': 1,
            'surveys': 1,
            'articles': 1,
            'messages': 1
          }
        },
        <String, dynamic>{
          'id': 'some-id-2',
          'name': 'Some Facility B',
          'phone': '+254712345678',
          'active': true,
          'county': 'Nairobi',
          'description': 'Opens from Monday to Friday from 8:00 to 17:00',
          'fhirOrganisationID': '',
          'workStationDetails': <String, dynamic>{
            'notifications': 0,
            'surveys': 0,
            'articles': 0,
            'messages': 0,
            'serviceRequests': 0
          }
        }
      ],
      'pagination': <String, dynamic>{
        'limit': 20,
        'currentPage': 1,
        'count': 2,
        'totalPages': 1,
        'nextPage': null,
        'previousPage': null
      }
    }
  }
};

final Map<String, dynamic> caregiverManagedClientsMock = <String, dynamic>{
  'data': <String, dynamic>{
    'getCaregiverManagedClients': <String, dynamic>{
      'Pagination': <String, dynamic>{
        'limit': 20,
        'currentPage': 1,
        'count': 2,
        'totalPages': 1,
        'nextPage': null,
        'previousPage': null
      },
      'managedClients': <dynamic>[
        <String, dynamic>{
          'caregiverConsent': true,
          'clientConsent': true,
          'workStationDetails': <String, dynamic>{
            'notifications': 1,
            'surveys': 1,
            'articles': 1,
            'messages': 1
          },
          'clientProfile': <String, dynamic>{
            'id': '0some-id',
            'username': 'testUserName',
            'active': true,
            'termsAccepted': true,
            'identifiers': <dynamic>[
              <String, dynamic>{
                'id': 'some-id',
                'type': 'CCC',
                'value': '712345678'
              }
            ],
          }
        },
        <String, dynamic>{
          'caregiverConsent': true,
          'clientConsent': true,
          'workStationDetails': <String, dynamic>{
            'notifications': 0,
            'surveys': 0,
            'articles': 0,
            'messages': 0
          },
          'clientProfile': <String, dynamic>{
            'id': '0some-id',
            'username': 'testUserName',
            'active': true,
            'termsAccepted': true,
            'identifiers': <dynamic>[
              <String, dynamic>{
                'id': 'some-id',
                'type': 'CCC',
                'value': '712345678'
              }
            ],
            'contacts': <String, dynamic>{
              'id': '',
              'contactType': '',
              'contactValue': '',
              'active': false,
              'optedIn': false
            }
          }
        }
      ]
    }
  }
};

List<Map<String, dynamic>> mockFilterItems = <Map<String, dynamic>>[
  <String, dynamic>{
    'filterIcon': Icons.grid_view_sharp,
    'filterText': 'All',
  },
  <String, dynamic>{
    'filterIcon': Icons.lightbulb_rounded,
    'filterText': 'Recommended',
  },
  <String, dynamic>{
    'filterIcon': Icons.grid_view_sharp,
    'filterText': 'Exercise',
  },
  <String, dynamic>{
    'filterIcon': Icons.fastfood_outlined,
    'filterText': 'diet',
  },
];

List<Map<String, dynamic>> mockSuggestions = <Map<String, dynamic>>[
  <String, dynamic>{
    'avatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'members': '20',
    'name': 'Ruaraka'
  },
  <String, dynamic>{
    'avatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'members': '50',
    'name': 'Mental health'
  },
];

Map<String, dynamic> mockIconDetails = <String, dynamic>{
  'url': shieldIconImgUrl
};

Map<String, dynamic> mockNotificationActions = <String, dynamic>{
  'name': 'Calendar',
  'route': ' ',
  'icon': mockIconDetails
};
Map<String, dynamic> mockNotification = <String, dynamic>{
  'description':
      'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
  'createdAt': '2022-04-28T07:00:20Z',
  'body': 'Your Teleconsult with Dr Tibu',
  'type': 'APPOINTMENT',
  'actions': <dynamic>[mockNotificationActions],
  'status': 'Missed',
  'id': 'some-id',
  'title': 'title',
};

Map<String, dynamic> mockNotificationsResponse = <String, dynamic>{
  'fetchNotifications': <String, dynamic>{
    'notifications': <dynamic>[
      mockNotification,
      <String, dynamic>{
        'id': 'some-id',
        'title': 'title',
        'type': 'SERVICE_REQUEST',
        'description': 'Your Teleconsult ',
        'body':
            'Your Teleconsult with Dr Tibu for 11am has been set. Click this link to join ',
        'isRead': false,
        'createdAt': '2022-04-28T07:00:20Z',
        'actions': <dynamic>[mockNotificationActions],
        'status': 'Missed'
      },
    ]
  }
};

final Map<String, dynamic> mockNotificationFiltersResponse = <String, dynamic>{
  'fetchNotificationTypeFilters': <dynamic>[
    <String, dynamic>{'name': 'Communities', 'enum': 'COMMUNITIES'},
    <String, dynamic>{'name': 'Moderator Demotion', 'enum': 'DEMOTE_MODERATOR'},
  ]
};

final List<dynamic> mockAppointments = <dynamic>[
  <String, dynamic>{
    'id': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': false
  },
  <String, dynamic>{
    'id': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': true
  },
  <String, dynamic>{
    'id': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': false
  },
  <String, dynamic>{
    'id': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': true
  },
  <String, dynamic>{
    'id': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': false
  },
  <String, dynamic>{
    'id': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': true
  },
  <String, dynamic>{
    'id': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': false
  },
  <String, dynamic>{
    'id': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': true
  },
  <String, dynamic>{
    'id': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': false
  },
  <String, dynamic>{
    'id': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': true
  },
  <String, dynamic>{
    'id': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': false
  },
  <String, dynamic>{
    'id': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': true
  },
  <String, dynamic>{
    'id': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': false
  },
  <String, dynamic>{
    'id': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': true
  },
  <String, dynamic>{
    'id': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': false
  },
  <String, dynamic>{
    'id': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': true
  },
  <String, dynamic>{
    'id': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': false
  },
  <String, dynamic>{
    'id': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': true
  },
  <String, dynamic>{
    'id': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': false
  },
  <String, dynamic>{
    'id': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': true
  },
  <String, dynamic>{
    'id': '1234',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': false
  },
  <String, dynamic>{
    'id': '56789',
    'type': 'DENTAL',
    'reason': 'test',
    'status': 'SCHEDULED',
    'date': '2022-01-04',
    'start': 'test',
    'end': 'test',
    'hasRescheduledAppointment': true
  },
];

Map<String, dynamic> mockBottomNavigationState = <String, dynamic>{
  'currentBottomNavIndex': 0,
};

Map<String, dynamic> mockSecurityQuestion = <String, dynamic>{
  'securityQuestionID': 'id',
  'questionStem': 'question_stem',
  'description': 'description',
  'responseType': core.SecurityQuestionResponseType.UNKNOWN.name,
  'active': true,
};

final List<dynamic> securityQuestionsMock = <dynamic>[
  <String, dynamic>{
    'securityQuestionID': 'id1',
    'questionStem': 'What are the last 4 digits of your CCC number?',
    'description': 'Please provide the last 4 digits of your clinic number',
    'responseType': core.SecurityQuestionResponseType.UNKNOWN.name,
    'active': true,
  },
  <String, dynamic>{
    'securityQuestionID': 'id2',
    'questionStem': 'Which month did you start your treatment?',
    'description': 'Enter the month you started your treatment',
    'responseType': core.SecurityQuestionResponseType.DATE.name,
    'active': true,
  },
  <String, dynamic>{
    'securityQuestionID': 'id3',
    'questionStem': 'Which county is your clinic located?',
    'description': 'enter the name of the county in small letters',
    'responseType': core.SecurityQuestionResponseType.UNKNOWN.name,
    'active': true,
  },
  <String, dynamic>{
    'securityQuestionID': 'id4',
    'questionStem': 'When did you join the platform?',
    'description': 'enter answer in numbers',
    'responseType': core.SecurityQuestionResponseType.NUMBER.name,
    'active': true,
  },
];

Map<String, dynamic> mockSecurityQuestionsData = <String, dynamic>{
  'getSecurityQuestions': securityQuestionsMock
};

final List<dynamic> recordSecurityQuestionResponseMock = <dynamic>[
  <String, dynamic>{'securityQuestionID': 'id1', 'isCorrect': true},
  <String, dynamic>{'SecurityQuestionID': 'id2', 'isCorrect': true},
  <String, dynamic>{'SecurityQuestionID': 'id3', 'isCorrect': true},
];

Map<String, dynamic> mockRecordSecurityQuestionResponseData = <String, dynamic>{
  'recordSecurityQuestionResponses': recordSecurityQuestionResponseMock
};

Map<String, dynamic> mockSecurityQuestionResponse = <String, dynamic>{
  'userID': 'userId',
  'securityQuestionID': 'securityQuestionId',
  'response': 'response',
};

Map<String, dynamic> mockFAQContentResponse = <String, dynamic>{
  'getFAQContent': <dynamic>[
    mockFAQContent,
  ]
};

Map<String, dynamic> mockFAQContent = <String, dynamic>{
  'ID': 'id',
  'Active': true,
  'Title': 'title',
  'Body': 'body',
  'Description': 'description',
  'Flavour': core.Flavour.consumer.name,
};

final Map<String, dynamic> termsMock = <String, dynamic>{
  'termsID': 0,
  'text': 'Terms will be available here soon'
};

final Map<String, dynamic> mockLoginResponse = <String, dynamic>{
  'code': 0,
  'message': 'success',
  'response': <String, dynamic>{
    'credentials': <String, dynamic>{
      'expiresIn': '3600',
      'idToken': 'some id token',
      'refreshToken': 'some-refresh-token'
    },
    'userProfile': <String, dynamic>{
      'id': 'some_id',
      'name': 'John Doe',
      'username': 'j_doe',
      'active': true,
      'pinChangeRequired': true,
      'hasSetPin': true,
      'hasSetSecurityQuestions': true,
      'isPhoneVerified': true,
      'termsAccepted': true,
      'suspended': false,
      'pinUpdateRequired': false,
      'hasSetNickname': false
    },
    'clientProfile': <String, dynamic>{
      'active': true,
      'identifiers': <dynamic>[
        <String, dynamic>{'id': 'some-id', 'type': 'CCC', 'value': '712345678'}
      ],
      'addresses': <Map<String, dynamic>>[
        <String, dynamic>{
          'active': true,
          'addressType': 'POSTAL',
          'country': 'Kenya',
          'county': null,
          'postalCode': '00300',
          'text': 'One Padmore'
        }
      ],
      'clientCounselled': true,
      'clientType': 'PMTCT',
      'facilityID': 'some-facility-id',
      'relatedPersons': <Map<String, dynamic>>[
        <String, dynamic>{
          'active': true,
          'dateOfBirth': '21 Nov 2002',
          'firstName': 'Juha',
          'gender': 'MALE',
          'lastName': 'Kalulu',
          'otherName': null,
          'relatedTo': 'some-user-id',
          'relationshipType': 'NEXT_OF_KIN',
          'addresses': <Map<String, dynamic>>[
            <String, dynamic>{
              'active': true,
              'addressType': 'POSTAL',
              'country': 'Kenya',
              'county': null,
              'postalCode': '00300',
              'text': 'One Padmore'
            }
          ],
          'contacts': <String, dynamic>{
            'active': true,
            'contact': '+254717356476',
            'contactType': 'PHONE',
            'optedIn': true
          },
          'secondaryContacts': <Map<String, dynamic>>[
            <String, dynamic>{
              'active': true,
              'contact': '+254717356476',
              'contactType': 'PHONE',
              'optedIn': true
            }
          ]
        }
      ],
      'treatmentBuddy': null,
      'treatmentEnrollmentDate': '21 Nov 2021',
      'user': <String, dynamic>{
        'active': true,
        'name': 'Juha Kalulu',
        'firstName': 'Juha',
        'gender': 'MALE',
        'languages': <String>['en', 'sw'],
        'suspended': false,
        'avatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
        'primaryContact': <String, dynamic>{
          'active': true,
          'contact': '+254717356476',
          'contactType': 'PHONE',
          'optedIn': true
        },
        'secondaryContacts': <Map<String, dynamic>>[
          <String, dynamic>{
            'active': true,
            'contact': '+254717356476',
            'contactType': 'PHONE',
            'optedIn': true
          }
        ],
        'lastName': 'Kalulu',
        'pinChangeRequired': false,
        'termsAccepted': false,
        'userID': 'some-user-id',
        'userName': 'Kowalski',
        'userType': 'CLIENT',
        'dateOfBirth': '21 Nov 2002',
      },
    },
    'getStreamToken': 'some-test-token',
  }
};

final core.Content mockVideoContent =
    core.Content.fromJson(videoContentMock.first);

final Map<String, dynamic> mockAudioContent = <String, dynamic>{
  'ID': 11,
  'title': 'Tips on how to keep yourself healthy',
  'date': '2021-08-23T06:42:05.085216Z',
  'intro': 'Keep yourself healthy',
  'authorName': 'Abiud Orina',
  'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
  'author': <String, dynamic>{'ID': 'some-id'},
  'itemType': 'AUDIO_VIDEO',
  'timeEstimateSeconds': 180,
  'featuredMedia': <dynamic>[
    <String, dynamic>{
      'ID': 1,
      'title': 'Test Document',
      'date': '2022-01-13',
      'intro': 'This is a test document',
      'authorName': 'Test',
      'tagNames': <String>['test'],
      'url': 'test.mp3',
      'type': 'audio',
      'thumbnail':
          'https://storage.googleapis.com/mycarehub-test/media/media_thumbnails/vitalii-pavlyshynets-kcRFW-Hje8Y-unsplash_1.jpg',
    }
  ],
  'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
  'meta': <String, dynamic>{
    'contentHTMLURL': 'https://mycarehub.co.ke/',
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
  },
};

final Map<String, dynamic> documentContentMock = <String, dynamic>{
  'id': 16,
  'title': 'Test Document',
  'date': '2022-01-13',
  'intro': 'This is a test document',
  'authorName': 'Test',
  'tagNames': <String>['test'],
  'meta': <String, dynamic>{
    'contentType': 'content.ContentItem',
    'contentHTMLURL': 'http://test-document/',
    'slug': 'test-document',
    'showInMenus': false,
    'seoTitle': '',
    'searchDescription': '',
    'firstPublishedAt': '2022-01-13T11:36:56.749531+03:00',
    'locale': 'en'
  },
  'itemType': 'PDF_DOCUMENT',
  'timeEstimateSeconds': 10,
  'body': '''
<p data-block-key="sg8u8">Test document</p>''',
  'heroImage': <String, dynamic>{'ID': 14, 'title': 'document'},
  'heroImageRendition': <String, dynamic>{
    'url': 'https://test.jpg',
    'width': 720,
    'height': 1080,
    'alt': 'document'
  },
  'likeCount': 0,
  'bookmarkCount': 0,
  'viewCount': 0,
  'shareCount': 0,
  'author': <String, dynamic>{'ID': 'test-id-001'},
  'documents': <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 10001,
      'document': <String, dynamic>{
        'id': 10001,
        'title': 'UoNAfyaApp360 Requirements',
        'meta': <String, dynamic>{
          'documentDetailUrl':
              'http://www.africau.edu/images/default/sample.pdf',
          'documentDownloadUrl':
              'http://www.africau.edu/images/default/sample.pdf'
        }
      }
    }
  ],
  'categoryDetails': <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 6,
      'categoryName': 'recommended',
      'categoryIcon': 'https://test.png'
    }
  ],
};
final Map<String, dynamic> contentEngagementMock = <String, dynamic>{
  'contentId': 1,
  'contentOpenedAt': '2021-01-01'
};

final Map<String, dynamic> mockGalleryImage = <String, dynamic>{
  'id': 2,
  'image': <String, dynamic>{
    'title': 'mockImage',
    'meta': <String, String>{'imageDownloadUrl': 'testImage'}
  }
};
final core.Content mockContent = core.Content.fromJson(contentMock.first);

final Map<String, dynamic> loginResponseMock = <String, dynamic>{
  'user_id': '@abiudrn:chat.savannahghi.org',
  'device_id': 'some-device-id',
  'display_name': 'Abiud Orina',
  'access_token': 'some-sample-token',
  'avatar_url': 'some-avatar-url',
  'isSignedIn': true,
};

final Map<String, dynamic> syncResponseMock = <String, dynamic>{
  'next_batch': 'sample-next-batch',
  'presence': <String, dynamic>{
    'events': <Map<String, dynamic>>[
      <String, dynamic>{
        'type': 'm.presence',
        'sender': '@abiudrn:chat.savannahghi.org',
        'content': <String, dynamic>{
          'presence': 'online',
          'last_active_ago': 56,
          'currently_active': true
        }
      }
    ],
  },
  'rooms': <String, dynamic>{
    'join': <String, dynamic>{
      '!testRoom:chat.savannahghi.org': <String, dynamic>{
        'room_id': '!testRoom:chat.savannahghi.org',
        'name': 'Test join room',
        'timeline': <String, dynamic>{
          'events': <Map<String, dynamic>>[
            <String, dynamic>{
              'type': 'm.room.message',
              'sender': '@test:chat.savannahghi.org',
              'content': <String, dynamic>{
                'org.matrix.msc1767.text': 'ala!',
                'body': 'ala!',
                'msgtype': 'm.text'
              },
              'event_id': 'test:chat.savannahghi.org',
              'origin_server_ts': 1668966101714,
            },
          ],
        },
        'state': <String, dynamic>{
          'events': <Map<String, dynamic>>[
            <String, dynamic>{
              'type': 'm.room.name',
              'sender': '@test:chat.savannahghi.org',
              'content': <String, dynamic>{'name': 'The Grand Gaming Squad'},
              'state_key': '',
              'event_id': 'test-event-id:chat.savannahghi.org',
              'origin_server_ts': 1668712693930,
              'unsigned': <String, dynamic>{'age': 5737421747}
            },
          ],
        },
        'unread_notifications': <String, dynamic>{
          'notification_count': 0,
          'highlight_count': 0
        },
        'summary': <String, dynamic>{
          'm.joined_member_count': 3,
          'm.invited_member_count': 0
        },
      }
    },
    'invite': <String, dynamic>{
      '!NvYSqaASzlfRpFCMtr:chat.savannahghi.org': <String, dynamic>{
        'room_id': '!NvYSqaASzlfRpFCMtr:chat.savannahghi.org',
        'name': 'Test invite room',
        'invite_state': <String, dynamic>{
          'events': <Map<String, dynamic>>[
            <String, dynamic>{
              'type': 'm.room.topic',
              'state_key': '',
              'content': <String, dynamic>{
                'topic':
                    "A group about Arsenal's thrashing of Manchester United (3-2)"
              },
              'sender': '@test:chat.savannahghi.org'
            },
          ],
        }
      }
    },
    'knock': <String, dynamic>{},
    'leave': <String, dynamic>{},
  }
};

final Map<String, dynamic> roomMock = <String, dynamic>{
  'room_id': '!testRoom:chat.savannahghi.org',
  'topic': 'test topic',
  'timeline': <String, dynamic>{
    'events': <Map<String, dynamic>>[
      <String, dynamic>{
        'type': 'm.room.message',
        'sender': '@test:chat.savannahghi.org',
        'content': <String, dynamic>{
          'org.matrix.msc1767.text': 'ala!',
          'body': 'ala!',
          'msgtype': 'm.text'
        },
        'event_id': 'test:chat.savannahghi.org',
        'origin_server_ts': 1668966101714,
      },
    ],
  },
  'state': <String, dynamic>{
    'events': <Map<String, dynamic>>[
      <String, dynamic>{
        'type': 'm.room.name',
        'sender': '@test:chat.savannahghi.org',
        'content': <String, dynamic>{'name': 'The Grand Gaming Squad'},
        'state_key': '',
        'event_id': 'test-event-id:chat.savannahghi.org',
        'origin_server_ts': 1668712693930,
        'unsigned': <String, dynamic>{'age': 5737421747}
      },
    ],
  },
  'unread_notifications': <String, dynamic>{
    'notification_count': 0,
    'highlight_count': 0
  },
  'summary': <String, dynamic>{
    'm.joined_member_count': 3,
    'm.invited_member_count': 0
  },
};

final Map<String, dynamic> roomMockWithoutTopic = <String, dynamic>{
  'room_id': '!testRoom:chat.savannahghi.org',
  'topic': 'test topic',
  'ephemeral': <String, dynamic>{
    'events': <dynamic>[
      <String, dynamic>{
        'type': 'm.typing',
        'content': <String, dynamic>{'user_ids': <dynamic>[]}
      },
      <String, dynamic>{
        'type': 'm.receipt',
        'content': <String, dynamic>{
          'test1:chat.savannahghi.org': <String, dynamic>{
            'm.read': <String, dynamic>{
              '@test:chat.savannahghi.org': <String, dynamic>{
                'ts': 1674112298765
              }
            },
            'm.read.private': <String, dynamic>{
              '@test:chat.savannahghi.org': <String, dynamic>{
                'ts': 1674112298734
              }
            }
          },
          'test2:chat.savannahghi.org': <String, dynamic>{
            'm.read': <String, dynamic>{
              '@test2:chat.savannahghi.org': <String, dynamic>{
                'ts': 1674116805862
              }
            }
          },
          'test3:chat.savannahghi.org': <String, dynamic>{
            'm.read': <String, dynamic>{
              '@test3:chat.savannahghi.org': <String, dynamic>{
                'ts': 1674133111678
              }
            }
          }
        }
      }
    ]
  },
  'state': <String, dynamic>{
    'events': <Map<String, dynamic>>[
      <String, dynamic>{
        'type': 'm.room.name',
        'sender': '@test:chat.savannahghi.org',
        'content': <String, dynamic>{'name': 'The Grand Gaming Squad'},
        'state_key': '',
        'event_id': 'test-event-id:chat.savannahghi.org',
        'origin_server_ts': 1668712693930,
        'unsigned': <String, dynamic>{'age': 5737421747}
      },
    ],
  },
  'summary': <String, dynamic>{
    'm.joined_member_count': 3,
    'm.invited_member_count': 0
  },
};

final Map<String, dynamic> screeningQuestionsMock = <String, dynamic>{
  'data': <String, dynamic>{
    'getScreeningToolByID': <String, dynamic>{
      'id': 'some-id',
      'active': true,
      'questionnaireID': 'another-id',
      'threshold': 3,
      'clientTypes': <dynamic>['PMTCT'],
      'genders': <dynamic>['male', 'female', 'other'],
      'ageRange': <String, dynamic>{'lowerBound': 14, 'upperBound': 25},
      'questionnaire': <String, dynamic>{
        'id': 'random-id',
        'active': true,
        'name': 'Violence Assessment',
        'description': 'TB assessment screening',
        'questions': <dynamic>[
          <String, dynamic>{
            'id': 'another-id',
            'active': true,
            'questionnaireID': 'testing-id',
            'text': 'Have you experienced a cough for any duration?',
            'questionType': 'CLOSE_ENDED',
            'responseValueType': 'STRING',
            'required': true,
            'selectMultiple': false,
            'sequence': 1,
            'choices': <dynamic>[
              <String, dynamic>{
                'id': 'test-id',
                'active': true,
                'questionID': 'another-id',
                'choice': '0',
                'value': 'Yes',
                'score': 1
              },
              <String, dynamic>{
                'id': 'random-id',
                'active': true,
                'questionID': 'another-id',
                'choice': '1',
                'value': 'No',
                'score': 0
              }
            ]
          },
        ]
      }
    }
  }
};

final Map<String, dynamic> availableScreeningToolsMock = <String, dynamic>{
  'data': <String, dynamic>{
    'getAvailableScreeningTools': <dynamic>[
      <String, dynamic>{
        'id': 'tool-id',
        'active': true,
        'questionnaireID': 'questionnaire-id',
        'threshold': 3,
        'clientTypes': <dynamic>['PMTCT'],
        'genders': <dynamic>['male'],
        'ageRange': <String, dynamic>{'lowerBound': 14, 'upperBound': 25},
        'questionnaire': <String, dynamic>{
          'id': 'questionnaire-id',
          'active': true,
          'name': 'Violence Assessment',
          'description': 'Violence Assessment DESCRIPTION',
          'questions': <dynamic>[]
        }
      },
    ]
  }
};
final Map<String, dynamic> tbMock = <String, dynamic>{
  'data': <String, dynamic>{
    'respondToScreeningTool': true,
    'getScreeningToolByID': <String, dynamic>{
      'id': 'some-id',
      'questionnaireID': 'some-other-id',
      'questionnaire': <String, dynamic>{
        'id': 'some-other-id',
        'name': 'TB Assessment',
        'description': 'TB assessment screening',
        'clientTypes': <dynamic>['DREAMS'],
        'questions': <dynamic>[
          <String, dynamic>{
            'id': 'another-id',
            'questionnaireID': 'some-other-id',
            'text': 'Have you experienced a cough for any duration?',
            'questionType': 'CLOSE_ENDED',
            'responseValueType': 'STRING',
            'sequence': 1,
            'choices': <dynamic>[
              <String, dynamic>{
                'id': 'id',
                'questionID': 'another-id',
                'choice': '0',
                'value': 'Yes',
                'score': 1
              },
              <String, dynamic>{
                'id': 'random-id',
                'questionID': 'another-id',
                'choice': '1',
                'value': 'No',
                'score': 0
              }
            ]
          },
        ]
      }
    },
    'getAvailableScreeningTools': <dynamic>[
      <String, dynamic>{
        'id': 'tool-id',
        'active': true,
        'questionnaireID': 'questionnaire-id',
        'threshold': 3,
        'clientTypes': <dynamic>['PMTCT'],
        'genders': <dynamic>['male'],
        'ageRange': <String, dynamic>{'lowerBound': 14, 'upperBound': 25},
        'questionnaire': <String, dynamic>{
          'id': 'questionnaire-id',
          'active': true,
          'name': 'TB Assessment',
          'description': 'TB Assessment DESCRIPTION',
          'questions': <dynamic>[]
        }
      },
    ]
  },
};

final Map<String, dynamic> alcoholMock = <String, dynamic>{
  'data': <String, dynamic>{
    'respondToScreeningTool': true,
    'getScreeningToolByID': <String, dynamic>{
      'id': 'some-id',
      'questionnaireID': 'some-other-id',
      'questionnaire': <String, dynamic>{
        'id': 'some-other-id',
        'name': 'Alcohol and Substance Assessment',
        'description': 'Alcohol and Substance Assessment screening',
        'clientTypes': <dynamic>['DREAMS'],
        'questions': <dynamic>[
          <String, dynamic>{
            'id': 'another-id',
            'questionnaireID': 'some-other-id',
            'text': 'Have you experienced a cough for any duration?',
            'questionType': 'CLOSE_ENDED',
            'responseValueType': 'STRING',
            'sequence': 1,
            'choices': <dynamic>[
              <String, dynamic>{
                'id': 'id',
                'questionID': 'another-id',
                'choice': '0',
                'value': 'Yes',
                'score': 1
              },
              <String, dynamic>{
                'id': 'random-id',
                'questionID': 'another-id',
                'choice': '1',
                'value': 'No',
                'score': 0
              }
            ]
          },
        ]
      }
    },
    'getAvailableScreeningTools': <dynamic>[
      <String, dynamic>{
        'id': 'tool-id',
        'active': true,
        'questionnaireID': 'questionnaire-id',
        'threshold': 3,
        'clientTypes': <dynamic>['PMTCT'],
        'genders': <dynamic>['male'],
        'ageRange': <String, dynamic>{'lowerBound': 14, 'upperBound': 25},
        'questionnaire': <String, dynamic>{
          'id': 'questionnaire-id',
          'active': true,
          'name': 'Alcohol and Substance Assessment',
          'description': 'Alcohol and Substance Assessment DESCRIPTION',
          'questions': <dynamic>[]
        }
      },
    ]
  },
};

final Map<String, dynamic> contraceptivesMock = <String, dynamic>{
  'data': <String, dynamic>{
    'respondToScreeningTool': true,
    'getScreeningToolByID': <String, dynamic>{
      'id': 'some-id',
      'questionnaireID': 'some-other-id',
      'questionnaire': <String, dynamic>{
        'id': 'some-other-id',
        'name': 'Contraceptives Assessment',
        'description': 'Contraceptives Assessment screening',
        'clientTypes': <dynamic>['DREAMS'],
        'questions': <dynamic>[
          <String, dynamic>{
            'id': 'another-id',
            'questionnaireID': 'some-other-id',
            'text': 'Have you experienced a cough for any duration?',
            'questionType': 'CLOSE_ENDED',
            'responseValueType': 'STRING',
            'sequence': 1,
            'choices': <dynamic>[
              <String, dynamic>{
                'id': 'id',
                'questionID': 'another-id',
                'choice': '0',
                'value': 'Yes',
                'score': 1
              },
              <String, dynamic>{
                'id': 'random-id',
                'questionID': 'another-id',
                'choice': '1',
                'value': 'No',
                'score': 0
              }
            ]
          },
        ]
      }
    },
    'getAvailableScreeningTools': <dynamic>[
      <String, dynamic>{
        'id': 'tool-id',
        'active': true,
        'questionnaireID': 'questionnaire-id',
        'threshold': 3,
        'clientTypes': <dynamic>['PMTCT'],
        'genders': <dynamic>['male'],
        'ageRange': <String, dynamic>{'lowerBound': 14, 'upperBound': 25},
        'questionnaire': <String, dynamic>{
          'id': 'questionnaire-id',
          'active': true,
          'name': 'Contraceptives Assessment',
          'description': 'Contraceptives Assessment DESCRIPTION',
          'questions': <dynamic>[]
        }
      },
    ]
  },
};

final Map<String, dynamic> powerLevelsResponseMock = <String, dynamic>{
  'users': <String, dynamic>{
    '@abiudrn:chat.savannahghi.org': 100,
    '@salaton:chat.savannahghi.org': 100,
    '@kowalski:chat.savannahghi.org': 0,
  }
};

final Map<String, dynamic> joinedMembersResponseMock = <String, dynamic>{
  'joined': <String, dynamic>{
    '@abiudrn:chat.savannahghi.org': loginResponseMock,
  }
};

final Map<String, dynamic> redactionEventMock = <String, dynamic>{
  'type': 'm.room.redaction',
  'sender': '!testRoom:chat.savannahghi.org',
  'room_id': '!testRoom:chat.savannahghi.org',
  'content': <String, dynamic>{},
  'redacts': 'test:chat.savannahghi.org',
  'event_id': 'test:chat.savannahghi.org',
  'origin_server_ts': 1674118003585,
};

final Map<String, dynamic> memberEventMock = <String, dynamic>{
  'type': 'm.room.member',
  'sender': '@abiudrn:chat.savannahghi.org',
  'content': <String, dynamic>{'membership': 'join', 'displayname': 'abiudrn'},
  'state_key': '@salaton:chat.savannahghi.org',
  'event_id': '16687126931TgVrw:chat.savannahghi.org',
  'origin_server_ts': 1668712693799,
};

final Map<String, dynamic> topicEventMock = <String, dynamic>{
  'type': 'm.room.topic',
  'sender': '@salaton:chat.savannahghi.org',
  'content': <String, dynamic>{'topic': 'All about gaming'},
  'state_key': '',
  'event_id': '16687126937jDnoh:chat.savannahghi.org',
  'origin_server_ts': 1668712693976,
};

final Map<String, dynamic> createEventMock = <String, dynamic>{
  'type': 'm.room.create',
  'sender': '@abiudrn:chat.savannahghi.org',
  'content': <String, dynamic>{
    'room_version': '1',
    'creator': '@abiudrn:chat.savannahghi.org'
  },
  'state_key': '',
  'event_id': '16687126930gHYFh:chat.savannahghi.org',
  'origin_server_ts': 1668712693753,
};

final Map<String, dynamic> messageEventMock = <String, dynamic>{
  'type': 'm.room.message',
  'sender': '@abiudrn:chat.savannahghi.org',
  'content': <String, dynamic>{
    'org.matrix.msc1767.text': 'ala!',
    'body': 'ala!',
    'msgtype': 'm.text'
  },
  'event_id': '166896610153WDxHa:chat.savannahghi.org',
  'origin_server_ts': 1668966101714,
  'unsigned': <String, dynamic>{'age': 5484013963}
};

final Map<String, dynamic> bannedUserResponseMock = <String, dynamic>{
  'chunk': <Map<String, dynamic>>[
    <String, dynamic>{
      'type': 'm.room.member',
      'room_id': '!test:prohealth360.org',
      'sender': '@prohealth360:prohealth360.org',
      'content': <String, dynamic>{
        'reason': 'Inappropriate content',
        'membership': 'ban'
      },
      'state_key': '@abiudrn:prohealth360.org',
      'origin_server_ts': 1680552333276,
      'event_id': 'test-event-id',
      'user_id': '@prohealth360:prohealth360.org',
      'age': 10064,
    }
  ]
};

final Map<String, dynamic> imageEventMock = <String, dynamic>{
  'type': 'm.room.message',
  'sender': '@salaton:chat.savannahghi.org',
  'content': <String, dynamic>{
    'body': '8machine-_-sdX0TRf4UoI-unsplash.jpg',
    'info': <String, dynamic>{
      'size': 939641,
      'mimetype': 'image/jpeg',
      'thumbnail_info': <String, dynamic>{
        'w': 480,
        'h': 600,
        'mimetype': 'image/jpeg',
        'size': 274206
      },
      'w': 2160,
      'h': 2700,
      'thumbnail_url': '$dir/test/tests_resources/test_file.png'
    },
    'msgtype': 'm.image',
    'url': '$dir/test/tests_resources/test_file.png'
  },
  'origin_server_ts': 1674203101433,
  'unsigned': <String, dynamic>{'age': 247014244},
  'event_id': 'VEubbMfa--WcUuA4SD1J-n0aGEj_nKO-4R3q1lnJWEQ'
};

final List<Map<String, dynamic>> contentMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'id': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'id': 'some-id'},
    'itemType': 'ARTICLE',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 7,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music.aac',
        'title': 'Background',
        'type': 'audio',
        'width': 0,
        'duration': 6,
        'height': 0,
        'thumbnail': ''
      }
    ]
  },
  <String, dynamic>{
    'id': 12,
    'title': 'Test article',
    'date': '2022-01-06',
    'intro': 'This is a test article',
    'authorName': 'John Ngugi',
    'tagNames': <String>['test'],
    'meta': <String, dynamic>{
      'contentType': 'content.ContentItem',
      'contentHTMLURL':
          'http://mycarehub-stage.savannahghi.org/health-education/test-article/',
      'slug': 'test-article',
      'showInMenus': false,
      'seoTitle': '',
      'searchDescription': '',
      'firstPublishedAt': '2022-01-06T09:18:42.024393+03:00',
      'locale': 'en'
    },
    'itemType': 'AUDIO_VIDEO',
    'timeEstimateSeconds': 6,
    'body': '<p data-block-key="9gd2w">Test article</p>',
    'heroImage': <String, dynamic>{'ID': 10, 'title': 'sunbeds3'},
    'heroImageRendition': <String, dynamic>{
      'url':
          'https://storage.googleapis.com/mycarehub-test/media/images/sunbeds3_VNXQPgI.2e16d0ba.fill-800x1200.jpegquality-60.jpg',
      'width': 800,
      'height': 1200,
      'alt': 'sunbeds3'
    },
    'likeCount': 6,
    'bookmarkCount': 2,
    'viewCount': 0,
    'shareCount': 1,
    'author': <String, dynamic>{'id': 'cd92a709-c397-4b04-a963-709eb7e08486'},
    'categoryDetails': <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 6,
        'categoryName': 'recommended',
        'categoryIcon': ''
      }
    ],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 2,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music_ppKS2s4.aac',
        'title': 'soft_piano_music',
        'type': 'audio',
        'duration': 141,
        'width': 0,
        'height': 0,
        'thumbnail': ''
      }
    ],
    'galleryImages': <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 1,
        'image': <String, dynamic>{
          'id': 8,
          'title': 'Contrail',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/jake-nackos-zAeD6Gug2PY-unsplash_IXYJr4K.jpg'
          }
        }
      },
      <String, dynamic>{
        'id': 2,
        'image': <String, dynamic>{
          'id': 7,
          'title': 'Plane_with_background',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/vino-li-kpcJgsvpY3Q-unsplash_9w4CILs.jpg'
          }
        }
      },
      <String, dynamic>{
        'id': 3,
        'image': <String, dynamic>{
          'id': 9,
          'title': 'sunbeds3',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/valentin-b-kremer-icXbm3QDw2w-unsplash_YNcTzbk.jpg'
          }
        }
      },
      <String, dynamic>{
        'id': 4,
        'image': <String, dynamic>{
          'id': 11,
          'title': 'syringe',
          'meta': <String, dynamic>{
            'imageDownloadUrl':
                'https://storage.googleapis.com/mycarehub-test/media/original_images/mika-baumeister-fPE_qTJu3Ws-unsplash_4NqBMVN.jpg'
          }
        }
      }
    ],
  },
  <String, dynamic>{
    'id': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'ID': 'some-id'},
    'itemType': 'ARTICLE',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
    'featuredMedia': <Map<String, dynamic>>[
      <String, dynamic>{
        'id': 7,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/Background_Music_Soft_Piano_Music.aac',
        'title': 'Background',
        'type': 'audio',
        'width': 0,
        'duration': 6,
        'height': 0,
        'thumbnail': ''
      }
    ],
    'galleryImages': <Map<String, dynamic>>[
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
      mockGalleryImage,
    ],
  },
];

final List<Map<String, dynamic>> videoContentMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'ID': 1,
    'title': 'Tips on how to keep yourself healthy',
    'date': '2021-08-23T06:42:05.085216Z',
    'intro': 'Keep yourself healthy',
    'authorName': 'Abiud Orina',
    'authorAvatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
    'author': <String, dynamic>{'ID': 'some-id'},
    'itemType': 'AUDIO_VIDEO',
    'timeEstimateSeconds': 180,
    'body':
        'The coronavirus pandemic has affected our lives, our economy, and nearly every corner of the globe. Almost 4 billion vaccine doses have been administered worldwide; 53 for every 100 people. But the worldwide numbers of infections continue to rise, driven by the Delta variant with highly vaccinated regions like Western Europe and the United States, where cases are relatively low but climbing fast. As cases continue to surge, you can take some steps to keep yourself and your family safe. Here are some tips from our trusted science team.',
    'heroImageRendition': <String, dynamic>{
      'url': 'https://i.postimg.cc/zvW46yxk/wellness.jpg',
    },
    'likeCount': 180,
    'bookmarkCount': 180,
    'viewCount': 180,
    'shareCount': 180,
    'hasSaved': false,
    'hasLiked': false,
    'documents': <dynamic>[],
    'isNew': true,
    'featuredMedia': <dynamic>[
      <String, dynamic>{
        'ID': 1,
        'url':
            'https://storage.googleapis.com/mycarehub-test/media/media/production_ID_4473012.mp4',
        'title': 'Awesome diet video',
        'type': 'video',
        'duration': 165,
        'width': 100,
        'height': 0,
        'thumbnail':
            'https://storage.googleapis.com/mycarehub-test/media/media_thumbnails/vitalii-pavlyshynets-kcRFW-Hje8Y-unsplash_1.jpg',
      }
    ],
    'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    'meta': <String, dynamic>{
      'contentHTMLURL': 'https://mycarehub.co.ke/',
      'firstPublishedAt': '2021-08-23T06:42:05.085216Z',
    },
    'tagNames': <String>['Recommended', 'Health', 'Fitness'],
  },
];

final List<Map<String, dynamic>> categoriesMock = <Map<String, dynamic>>[
  <String, dynamic>{
    'id': 2,
    'name': 'recommended',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 1,
    'name': 'welcome',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 3,
    'name': 'exercise',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 4,
    'name': 'diet',
    'iconUrl': 'test-image.png',
  },
  <String, dynamic>{
    'id': 10002,
    'name': 'consumer-faqs',
    'iconUrl': 'test-image.png',
  }
];

final List<Map<String, dynamic>> mockDiaryEntries = <Map<String, dynamic>>[
  <String, dynamic>{
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am healthy',
    'entryType': 'HOME_PAGE_HEALTH_DIARY_ENTRY',
    'createdAt': '2021-11-30T16:17:57Z',
    'shareWithHealthWorker': false,
    'sharedAt': DateTime.now().subtract(const Duration(hours: 5)).toString()
  },
  <String, dynamic>{
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am very healthy',
    'entryType': 'HOME_PAGE_HEALTH_DIARY_ENTRY',
    'createdAt': '2021-11-30T16:17:53Z',
    'sharedAt': DateTime.now().subtract(const Duration(minutes: 10)).toString()
  },
  <String, dynamic>{
    'active': true,
    'mood': 'HAPPY',
    'note': 'I am very healthy',
    'entryType': 'HOME_PAGE_HEALTH_DIARY_ENTRY',
    'createdAt': '2021-11-30T16:17:53Z',
    'sharedAt': DateTime.now().subtract(const Duration(minutes: 10)).toString()
  },
];

final Map<String, dynamic> mockCommunitiesState = <String, dynamic>{
  'invitedCommunities': <dynamic>[
    <String, dynamic>{
      'id': core.UNKNOWN,
      'name': core.UNKNOWN,
      'memberCount': 0,
      'description': core.UNKNOWN,
      'createdBy': <String, dynamic>{
        'id': core.UNKNOWN,
        'userID': core.UNKNOWN,
        'role': core.UNKNOWN,
        'username': core.UNKNOWN,
        'gender': core.Gender.unknown.name,
      },
    },
  ]
};

final Map<String, dynamic> mockOnboardingState = <String, dynamic>{
  'termsAndConditions': TermsAndConditions.initial().toJson(),
  'securityQuestions': <Map<String, dynamic>>[
    core.SecurityQuestion.initial().toJson(),
  ],
  'securityQuestionResponses': <Map<String, dynamic>>[
    core.SecurityQuestionResponse.initial().toJson(),
  ],
};

final Map<String, dynamic> mockProgramState = <String, dynamic>{
  'programs': <dynamic>[mockProgram],
  'currentProgram': mockProgram
};
final Map<String, dynamic> mockProgram = <String, dynamic>{
  'id': 'some-id',
  'active': true,
  'name': 'name',
  'organisation': <String, dynamic>{
    'id': 'some-id',
    'description': 'some description',
    'name': 'name',
  }
};

final Map<String, dynamic> mockAddress = <String, dynamic>{
  'active': true,
  'addressType': 'POSTAL',
  'country': 'Kenya',
  'county': null,
  'postalCode': '00300',
  'text': 'One Padmore'
};

final Map<String, dynamic> mockCommunity = <String, dynamic>{
  'id': core.UNKNOWN,
  'name': core.UNKNOWN,
  'memberCount': 0,
  'description': core.UNKNOWN,
  'ageRange': <String, dynamic>{
    'lowerBound': 14,
    'upperBound': 20,
  },
  'createdBy': <String, dynamic>{
    'id': core.UNKNOWN,
    'userID': core.UNKNOWN,
    'role': core.UNKNOWN,
    'username': core.UNKNOWN,
    'gender': core.Gender.unknown.name,
    'userType': core.UserType.CLIENT.name,
  },
  'clientType': <String>['PMTCT']
};

final Map<String, dynamic> mockAuthCredentials = <String, dynamic>{
  'expiresIn': '3600',
  'idToken': 'some id token',
  'refreshToken': 'some refresh token'
};

final Map<String, dynamic> mockGetStreamToken = <String, dynamic>{
  'getStreamToken': 'test.token',
};

final Map<String, dynamic> mockPrimaryContact = <String, dynamic>{
  'active': true,
  'contact': '+254717356476',
  'contactType': 'PHONE',
  'optedIn': true
};

final Map<String, dynamic> mockFacilityState = <String, dynamic>{
  'Facilities': <dynamic>[
    <String, dynamic>{
      'ID': 'some-id',
      'name': 'hospital name',
      'code': 1,
      'phone': '',
      'active': true,
      'county': 'some-county',
      'description': '',
      'fhirOrganisationID': '',
      'workStationDetails': <String, dynamic>{
        'notifications': 1,
        'surveys': 1,
        'articles': 1,
        'messages': 1
      }
    },
    <String, dynamic>{
      'ID': '0some-id',
      'name': 'some hospital',
      'code': 2,
      'phone': '',
      'active': true,
      'county': 'some county',
      'description': '',
      'fhirOrganisationID': '',
      'workStationDetails': <String, dynamic>{
        'notifications': 0,
        'surveys': 0,
        'articles': 0,
        'messages': 0
      }
    }
  ]
};

final Map<String, dynamic> mockFeedContent = <String, dynamic>{
  'getContent': <String, dynamic>{
    'items': <dynamic>[contentMock.first]
  },
};
final Map<String, dynamic> mockListContentCategories = <String, dynamic>{
  'listContentCategories': categoriesMock
};

final Map<String, dynamic> mockRelatedPerson = <String, dynamic>{
  'active': true,
  'dateOfBirth': '21 Nov 2002',
  'firstName': 'Juha',
  'gender': 'MALE',
  'lastName': 'Kalulu',
  'otherName': null,
  'relatedTo': 'some-user-id',
  'relationshipType': 'NEXT_OF_KIN',
  'addresses': <dynamic>[mockAddress],
  'primaryContact': mockPrimaryContact,
  'secondaryContacts': <dynamic>[mockPrimaryContact]
};

final Map<String, dynamic> mockUserProfile = <String, dynamic>{
  'id': 'some_id',
  'name': 'John Doe',
  'username': 'j_doe',
  'active': true,
  'pinChangeRequired': true,
  'hasSetPin': false,
  'hasSetSecurityQuestions': false,
  'isPhoneVerified': false,
  'termsAccepted': false,
  'suspended': false,
  'pinUpdateRequired': false,
  'hasSetNickname': false
};

final Map<String, dynamic> mockUser = <String, dynamic>{
  'active': true,
  'name': 'Kowalski',
  'firstName': 'Juha',
  'gender': 'MALE',
  'languages': <dynamic>['en', 'sw'],
  'suspended': false,
  'avatar': 'https://i.postimg.cc/9XpbrC25/profile-image.png',
  'contacts': <String, dynamic>{
    'active': true,
    'contact': '+254717356476',
    'contactType': 'PHONE',
    'optedIn': true
  },
  'secondaryContacts': <dynamic>[
    <String, dynamic>{
      'active': true,
      'contact': '+254717356476',
      'contactType': 'PHONE',
      'optedIn': true
    }
  ],
  'lastName': 'Kalulu',
  'pinChangeRequired': false,
  'termsAccepted': true,
  'userID': 'some-user-id',
  'userName': 'Kowalski',
  'dateOfBirth': '21 Nov 2002',
  'hasSetPin': false,
  'hasSetSecurityQuestions': false,
  'hasSetNickname': false,
  'isPhoneVerified': false,
};

final Map<String, dynamic> mockClientState = <String, dynamic>{
  'clientProfile': <String, dynamic>{
    'active': true,
    'addresses': <dynamic>[mockAddress],
    'clientCounselled': true,
    'clientType': 'PMTCT',
    'facilityID': 'some-facility-id',
    'relatedPersons': <dynamic>[mockRelatedPerson],
    'treatmentBuddy': null,
    'treatmentEnrollmentDate': '21 Nov 2021',
    'identifiers': <dynamic>[
      <String, dynamic>{'id': 'some-id', 'type': 'CCC', 'value': '712345678'}
    ],
    'user': mockUser
  }
};

final List<dynamic> mockListFlaggedMessages = <dynamic>[
  <String, dynamic>{
    'message': <String, dynamic>{
      'id': '1fc5d6be-8550-47a4-8f46-e515ae04f7a9',
      'text': 'Test',
      'created_at': '2022-04-08T12:02:20Z',
      'attachments': <dynamic>[],
      'mentioned_users': <dynamic>[],
      'user': <String, dynamic>{
        'id': '740128ce-32b4-4b5e-8359-a92442c8f741',
        'userID': '',
        'name': 'John Ngugi',
        'username': ''
      }
    }
  },
  <String, dynamic>{
    'message': <String, dynamic>{
      'id': '71a64e8a-98cb-4a27-9ee7-4786eb7a8135',
      'text': "Who's available?",
      'created_at': '2022-03-04T12:45:54Z',
      'attachments': <dynamic>[],
      'mentioned_users': <dynamic>[],
      'user': <String, dynamic>{
        'id': 'da614cc4-b503-4bd8-9530-a7eb0d676433',
        'userID': '',
        'name': 'Nairoua Salaton',
        'username': ''
      }
    }
  },
  <String, dynamic>{
    'message': <String, dynamic>{
      'id': '1c2a059c-f49b-4b6e-a130-2812777bb280',
      'text': 'Hi I am now available',
      'created_at': '2022-04-09T08:07:38Z',
      'attachments': <dynamic>[],
      'mentioned_users': <dynamic>[],
      'user': <String, dynamic>{
        'id': '305db9b5-2ff9-4e4c-9a7a-57660b31df4c',
        'userID': '',
        'name': 'Abiud Consumer',
        'username': ''
      }
    }
  }
];

final Map<String, dynamic> mockQuote = <String, dynamic>{
  'quote': 'Health at your fingerprints',
  'author': 'myAfyaHub'
};

final Map<String, dynamic> mockQuoteList = <String, dynamic>{
  'getHealthDiaryQuote': <dynamic>[mockQuote, mockQuote, mockQuote],
};

Map<String, dynamic> mockUpdateClientCareGiver = <String, dynamic>{
  'firstName': 'John',
  'lastName': 'Doe',
  'phoneNumber': '+254798000000',
  'caregiverType': 'SIBLING',
  'clientID': core.UNKNOWN,
};

Map<String, dynamic> mockMedicalDataState = <String, dynamic>{
  'medicalData': mockMedicalData,
};

Map<String, dynamic> mockMedicalDataDetails = <String, dynamic>{
  'Category': <String, dynamic>{'Text': 'Pneumonia'},
  'MedicationCodeableConcept': <String, dynamic>{
    'Text': 'Amoxicillin',
  },
  'Code': <String, dynamic>{
    'Text': 'Milk powder (cow\'s milk)',
  },
  'ValueString': 'some-value'
};

Map<String, dynamic> mockMedicalDataResponse = <String, dynamic>{
  'getMedicalData': mockMedicalData,
};

Map<String, dynamic> mockMedicalData = <String, dynamic>{
  'regimen': <dynamic>[
    <String, dynamic>{
      'Category': <String, dynamic>{'Text': 'Pneumonia'},
      'MedicationCodeableConcept': <String, dynamic>{
        'Text': 'Amoxicillin',
      },
    }
  ],
  'allergies': <dynamic>[
    <String, dynamic>{
      'Code': <String, dynamic>{'Text': 'Beef'}
    },
    <String, dynamic>{
      'Code': <String, dynamic>{'Text': 'Shellfish'}
    },
    <String, dynamic>{
      'Code': <String, dynamic>{'Text': 'Shellfish'}
    }
  ],
  'weight': <dynamic>[
    <String, dynamic>{'ValueString': 'some-value'}
  ],
  'viralLoad': <dynamic>[
    <String, dynamic>{'ValueString': 'some-value'}
  ],
  'bmi': <dynamic>[
    <String, dynamic>{'ValueString': 'some-bmi-value'},
    <String, dynamic>{'ValueString': 'second-bmi-value'}
  ],
  'cd4Count': <dynamic>[
    <String, dynamic>{'ValueString': 'some-value'}
  ],
};

Map<String, dynamic> mockEmptyMedicalData = <String, dynamic>{
  'regimen': <dynamic>[],
  'allergies': <dynamic>[],
  'weight': <dynamic>[],
  'viralLoad': <dynamic>[],
  'bmi': <dynamic>[],
  'cd4Count': <dynamic>[],
};

Map<String, dynamic> mockNextRefillDataResponse = <String, dynamic>{
  'nextRefill': '2023-12-12',
};

Map<String, dynamic> mockViralLoadDataResponse = <String, dynamic>{
  'searchFHIRObservation': mockViralLoadData,
};

Map<String, dynamic> mockViralLoadData = <String, dynamic>{
  'edges': <dynamic>[
    <String, dynamic>{
      'node': <String, dynamic>{
        'Status': 'some-status',
        'ValueString': '50,000',
        'EffectiveInstant': '2022-02-08T12:45:25Z',
        'Code': <String, dynamic>{
          'Text': 'HIV viral load',
        },
      },
    }
  ],
};

final Map<String, dynamic> mockHealthTimelineItems = <String, dynamic>{
  'patientHealthTimeline': <String, dynamic>{
    'totalCount': 30,
    'timeline': <Map<String, dynamic>>[
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': '73e69080-5d5a-481e-97f9-a004589b6f56',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': '9bc8b78f-ce36-4906-9bec-5936d520ef3b',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'e1bf5db2-bd65-46f7-932e-423f1ccd9051',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': '5edb4d3f-7aec-429d-8fc4-440aeec8eced',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'd2b2975a-4002-4735-b9e6-15c2c44b50f9',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'cbca415f-02be-4251-a6d5-f4106752acc8',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'ac3b73c9-5a3a-430c-b1a3-15f6ad572e74',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'f7b0ea6a-a6ee-4eac-a1ae-2fa7fb408302',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5090',
              'display': 'Height (cm)',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5090/'
            }
          ],
          'text': 'Height (cm)'
        },
        'effectiveInstant': '2022-01-04T12:45:25Z',
        'id': 'e273444a-53b4-469b-8a8a-b5d9b02f7e1e',
        'performer': <dynamic>[
          <String, dynamic>{
            'display': 'Agha Khan',
            'reference': 'Organization/a84fc567-8c65-4529-9894-15d0cfe9be00'
          }
        ],
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': 'Paul',
          'reference': 'Patient/8597b8a4-c9e0-4efa-9f41-b30843873252'
        },
        'timelineDate': '2022-01-04T12:45:25Z',
        'valueString': '176'
      },
      <String, dynamic>{
        'category': <Map<String, dynamic>>[
          <String, dynamic>{
            'coding': <Map<String, dynamic>>[
              <String, dynamic>{
                'code': 'laboratory',
                'display': 'Laboratory',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Laboratory'
          }
        ],
        'code': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '306',
              'display': 'Widal test',
              'system': '/orgs/CIEL/sources/CIEL/concepts/306/'
            }
          ],
          'text': 'Widal test'
        },
        'effectiveDateTime': '2022-03-05',
        'id': '954aa3fc-0a9d-46e8-a145-703571ee434a',
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': '8371c56f-2cc3-4ea9-9db7-2befef290f9c',
          'reference': 'Patient/8371c56f-2cc3-4ea9-9db7-2befef290f9c'
        },
        'timelineDate': '2022-03-05',
        'valueString': 'Non Reactive'
      },
      <String, dynamic>{
        'category': <dynamic>[
          <String, dynamic>{
            'coding': <dynamic>[
              <String, dynamic>{
                'code': 'vital-signs',
                'display': 'Vital Signs',
                'system':
                    'http://terminology.hl7.org/CodeSystem/observation-category'
              }
            ],
            'text': 'Vital Signs'
          }
        ],
        'code': <String, dynamic>{
          'coding': <dynamic>[
            <String, dynamic>{
              'code': '5096',
              'display': 'Return visit date',
              'system': '/orgs/CIEL/sources/CIEL/concepts/5096/'
            }
          ],
          'text': 'Return visit date'
        },
        'effectiveInstant': '2022-04-05T09:36:28Z',
        'id': '3f753b78-7c91-4693-b8fd-f45f5a6538e6',
        'resourceType': 'Observation',
        'status': 'preliminary',
        'subject': <String, dynamic>{
          'display': '510a98f5-8e39-465f-abf8-663c150ce355',
          'reference': 'Patient/510a98f5-8e39-465f-abf8-663c150ce355'
        },
        'timelineDate': '2022-04-05T09:36:28Z',
        'valueString': '2022-04-21'
      },
      <String, dynamic>{
        'category': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '114100',
              'display': 'Pneumonia',
              'system': '/orgs/CIEL/sources/CIEL/concepts/114100/'
            }
          ],
          'text': 'Pneumonia'
        },
        'effectiveDateTime': '2022-03-04',
        'id': 'ab7313bb-3688-4f67-87db-e98bb69d0263',
        'medicationCodeableConcept': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '71160',
              'display': 'Amoxicillin',
              'system': '/orgs/CIEL/sources/CIEL/concepts/71160/'
            }
          ],
          'text': 'Amoxicillin'
        },
        'resourceType': 'MedicationStatement',
        'status': 'unknown',
        'subject': <String, dynamic>{
          'display': '340611da-fcd0-4fc2-bb29-ef6ba3bbcb0b',
          'reference': 'Patient/340611da-fcd0-4fc2-bb29-ef6ba3bbcb0b'
        },
        'timelineDate': '2022-03-04'
      },
      <String, dynamic>{
        'category': <String>['medication'],
        'clinicalStatus': <String, dynamic>{
          'coding': <Map<String, dynamic>>[
            <String, dynamic>{
              'code': '165586',
              'display': "Milk powder (cow's milk)",
              'system': '/orgs/CIEL/sources/CIEL/concepts/165586/'
            }
          ],
          'text': "Milk powder (cow's milk)"
        },
        'code': <String, dynamic>{},
        'id': '35fe4b5e-1f26-4d65-89bf-bdc22a4ac9c5',
        'patient': <String, dynamic>{
          'display': '8371c56f-2cc3-4ea9-9db7-2befef290f9c',
          'reference': 'Patient/8371c56f-2cc3-4ea9-9db7-2befef290f9c'
        },
        'reaction': <Map<String, dynamic>>[
          <String, dynamic>{
            'description': "Milk powder (cow's milk)",
            'manifestation': <Map<String, dynamic>>[
              <String, dynamic>{
                'coding': <Map<String, dynamic>>[
                  <String, dynamic>{
                    'code': '512',
                    'display': 'Rash',
                    'system': '/orgs/CIEL/sources/CIEL/concepts/165586/'
                  }
                ],
                'text': 'Rash'
              }
            ],
            'severity': 'severe',
            'substance': <String, dynamic>{
              'coding': <Map<String, dynamic>>[
                <String, dynamic>{
                  'code': '165586',
                  'display': "Milk powder (cow's milk)",
                  'system': '/orgs/CIEL/sources/CIEL/concepts/165586/'
                }
              ],
              'text': "Milk powder (cow's milk)"
            }
          }
        ],
        'recordedDate': '2022-03-04',
        'resourceType': 'AllergyIntolerance',
        'timelineDate': '2022-03-04',
        'type': 'allergy',
        'verificationStatus': <String, dynamic>{}
      },
    ],
  },
};

final Map<String, dynamic> groupStateMock = <String, dynamic>{
  'listCommunityMembers': <dynamic>[
    <String, dynamic>{
      'user': <String, dynamic>{
        'id': core.UNKNOWN,
        'userID': core.UNKNOWN,
        'name': core.UNKNOWN,
        'role': core.UNKNOWN,
        'username': core.UNKNOWN,
        'gender': 'unknown',
        'extraData': <String, dynamic>{
          'bannedInCommunity': false,
        }
      },
      'isModerator': true,
    },
  ],
};

const String testUserID = '@abiudrn:chat.savannahghi.org';

final Map<String, dynamic> flaggedMessagesMock = <String, dynamic>{
  'event_reports': <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 1,
      'received_ts': 1680701152291,
      'room_id': '!test:prohealth360.org',
      'event_id': 'event-id-1',
      'user_id': '@abiudrn:prohealth360.org',
      'score': -100,
      'reason': 'Inappropriate content',
      'sender': '@abiudrn:prohealth360.org',
      'canonical_alias': null,
      'name': 'Test group'
    },
    <String, dynamic>{
      'id': 2,
      'received_ts': 1680685298071,
      'room_id': '!test:prohealth360.org',
      'event_id': 'event-id-2',
      'user_id': '@abiudrn:prohealth360.org',
      'score': -100,
      'reason': 'Inappropriate content',
      'sender': '@prohealth360:prohealth360.org',
      'canonical_alias': null,
      'name': 'Test group'
    },
  ],
  'total': 2
};

final Map<String, dynamic> eventReportMock = <String, dynamic>{
  'id': 5,
  'received_ts': 1680283555310,
  'room_id': '!test:prohealth360.org',
  'event_id': 'test-event-id',
  'user_id': '@prohealth360:prohealth360.org',
  'score': -100,
  'reason': 'Testing',
  'sender': '@abiudrn:prohealth360.org',
  'canonical_alias': null,
  'name': 'Avatar',
  'event_json': <String, dynamic>{
    'type': 'm.room.message',
    'room_id': '!test:prohealth360.org',
    'sender': '@prohealth360:prohealth360.org',
    'content': <String, dynamic>{'body': 'hi', 'msgtype': 'm.text'},
    'origin': 'prohealth360.org',
    'origin_server_ts': 1680277670633,
  }
};
