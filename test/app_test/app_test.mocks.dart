// Mocks generated by Mockito 5.4.0 from annotations
// in flutter_bloc_demo/test/app_test/app_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_bloc_demo/data/model/github_repo.dart' as _i4;
import 'package:flutter_bloc_demo/data/repository/app_repository_impl.dart'
    as _i2;
import 'package:hydrated_bloc/src/hydrated_storage.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [AppRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppRepositoryImpl extends _i1.Mock implements _i2.AppRepositoryImpl {
  MockAppRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.GithubRepo>> getRepos() => (super.noSuchMethod(
        Invocation.method(
          #getRepos,
          [],
        ),
        returnValue: _i3.Future<List<_i4.GithubRepo>>.value(<_i4.GithubRepo>[]),
      ) as _i3.Future<List<_i4.GithubRepo>>);
}

/// A class which mocks [Storage].
///
/// See the documentation for Mockito's code generation for more information.
class MockStorage extends _i1.Mock implements _i5.Storage {
  MockStorage() {
    _i1.throwOnMissingStub(this);
  }

  @override
  dynamic read(String? key) => super.noSuchMethod(Invocation.method(
        #read,
        [key],
      ));
  @override
  _i3.Future<void> write(
    String? key,
    dynamic value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #write,
          [
            key,
            value,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> delete(String? key) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [key],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}