import 'package:myafyahub/domain/core/entities/core/suggestion.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return 0 result when wellness points is searched ', () {
    // setup
    const String searchParam = 'points';
    const int expectedResultsCount = 0;

    // call the actual function / method
    final List<Suggestion> actualSearchResults =
        searchSuggestions(searchParam: searchParam);

    final int actualSearchResultCount = actualSearchResults.length;

    // verify functionality
    expect(actualSearchResultCount, expectedResultsCount);
  });

  test('should return 1 result when library is searched ', () {
    // setup
    const String searchParam = 'library';
    const int expectedResultsCount = 1;

    // call the actual function / method
    final List<Suggestion> actualSearchResults =
        searchSuggestions(searchParam: searchParam);

    final int actualSearchResultCount = actualSearchResults.length;

    // verify functionality
    expect(actualSearchResultCount, expectedResultsCount);
  });
}
