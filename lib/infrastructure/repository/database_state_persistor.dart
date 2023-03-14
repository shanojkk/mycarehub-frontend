import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:pro_health_360/application/redux/states/chat_state.dart';
import 'package:pro_health_360/domain/core/entities/caregiver/caregiver_state.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:pro_health_360/application/redux/states/app_state.dart';
import 'package:pro_health_360/application/redux/states/connectivity_state.dart';
import 'package:pro_health_360/application/redux/states/misc_state.dart';
import 'package:pro_health_360/application/redux/states/onboarding_state.dart';
import 'package:pro_health_360/domain/core/entities/core/auth_credentials.dart';
import 'package:pro_health_360/domain/core/entities/core/client_state.dart';
import 'package:pro_health_360/domain/core/entities/core/content_state.dart';
import 'package:pro_health_360/domain/core/entities/home/bottom_nav_state.dart';
import 'package:pro_health_360/infrastructure/repository/database_base.dart';
import 'package:pro_health_360/infrastructure/repository/database_mobile.dart';
import 'package:pro_health_360/infrastructure/repository/initialize_db.dart';

/// [MyAfyaHubStateDatabase] is the middleware that interacts with the database on behalf
/// of the application. From the apps perspective, it doesn't care which database
/// its saving its state on. MyAfyaHubStateDatabase therefore offers different implementations
/// for its method.
class MyAfyaHubStateDatabase implements PersistorPrinterDecorator<AppState> {
  MyAfyaHubStateDatabase({
    Duration throttle = const Duration(seconds: 2),
    Duration saveDuration = Duration.zero,
    required this.dataBaseName,
  })  : _throttle = throttle,
        _saveDuration = saveDuration;

  final String dataBaseName;

  final Duration _saveDuration;
  final Duration _throttle;

  @override
  Future<void> deleteState() async {
    await MyAfyaHubDatabaseMobile<Database>(
      initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
    ).clearDatabase();
  }

  @override
  Future<void> persistDifference({
    AppState? lastPersistedState,
    required AppState newState,
  }) async {
    await Future<dynamic>.delayed(saveDuration);

    if (lastPersistedState == null ||
        lastPersistedState.credentials != newState.credentials ||
        lastPersistedState.clientState != newState.clientState ||
        lastPersistedState.onboardingState != newState.onboardingState ||
        lastPersistedState.bottomNavigationState !=
            newState.bottomNavigationState ||
        lastPersistedState.connectivityState != newState.connectivityState ||
        lastPersistedState.miscState != newState.miscState ||
        lastPersistedState.contentState != newState.contentState ||
        lastPersistedState.caregiverState != newState.caregiverState ||
        lastPersistedState.chatState != newState.chatState) {
      await persistState(
        newState,
        MyAfyaHubDatabaseMobile<Database>(
          initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
        ),
      );
    }
  }

  /// we first check whether the database is empty
  ///
  /// - if the database is empty, we return null
  /// - else, we retrieve the state from the database
  @override
  Future<AppState> readState() async {
    if (await MyAfyaHubDatabaseMobile<Database>(
      initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
    ).isDatabaseEmpty()) {
      return AppState.initial();
    } else {
      return retrieveState(
        MyAfyaHubDatabaseMobile<Database>(
          initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
        ),
      );
    }
  }

  @override
  Future<void> saveInitialState(AppState state) async =>
      persistDifference(newState: state);

  @override
  Duration get throttle => _throttle;

  Duration get saveDuration => _saveDuration;

  Future<void> init() async {
    await MyAfyaHubDatabaseMobile<Database>(
      initializeDB: InitializeDB<Database>(dbName: this.dataBaseName),
    ).database;
  }

  /// saves app state to the database
  @visibleForTesting
  Future<void> persistState(
    AppState newState,
    ProHealthDatabaseBase<dynamic> database,
  ) async {
    // save credentials state
    await database.saveState(
      data: newState.credentials!.toJson(),
      table: Tables.credentials,
    );

    // save clientState state
    await database.saveState(
      data: newState.clientState!.toJson(),
      table: Tables.clientState,
    );

    // save onboardingState state
    await database.saveState(
      data: newState.onboardingState!.toJson(),
      table: Tables.onboardingState,
    );

    // save bottomNavigationState state
    await database.saveState(
      data: newState.bottomNavigationState!.toJson(),
      table: Tables.bottomNavigationState,
    );

    // save connectivityState state
    await database.saveState(
      data: newState.connectivityState!.toJson(),
      table: Tables.connectivityState,
    );

    // save contentState state
    await database.saveState(
      data: newState.contentState!.toJson(),
      table: Tables.contentState,
    );

    // save miscState state
    await database.saveState(
      data: newState.miscState!.toJson(),
      table: Tables.miscState,
    );

    // save caregiverState state
    await database.saveState(
      data: newState.caregiverState!.toJson(),
      table: Tables.caregiverState,
    );

    // save chat state
    await database.saveState(
      data: newState.chatState!.toJson(),
      table: Tables.chatState,
    );
  }

  /// retrieves app state to the database
  @visibleForTesting
  Future<AppState> retrieveState(
    ProHealthDatabaseBase<dynamic> database,
  ) async {
    return AppState().copyWith(
      // retrieve user state
      credentials: AuthCredentials.fromJson(
        await database.retrieveState(Tables.credentials),
      ),

      clientState: ClientState.fromJson(
        await database.retrieveState(Tables.clientState),
      ),

      onboardingState: OnboardingState.fromJson(
        await database.retrieveState(Tables.onboardingState),
      ),

      bottomNavigationState: BottomNavigationState.fromJson(
        await database.retrieveState(Tables.bottomNavigationState),
      ),

      connectivityState: ConnectivityState.fromJson(
        await database.retrieveState(Tables.connectivityState),
      ),

      contentState: ContentState.fromJson(
        await database.retrieveState(Tables.contentState),
      ),

      miscState: MiscState.fromJson(
        await database.retrieveState(Tables.miscState),
      ),

      caregiverState: CaregiverState.fromJson(
        await database.retrieveState(Tables.caregiverState),
      ),

      chatState: ChatState.fromJson(
        await database.retrieveState(Tables.chatState),
      ),

      wait: Wait(),
    );
  }
}
