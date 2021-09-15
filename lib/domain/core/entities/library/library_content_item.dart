class LibraryContentItemData {
  LibraryContentItemData(
    this.libraryContentImageUrl,
    this.libraryContentReadTime,
    this.libraryContentBodyText,
    this.libraryContentTags, {
    required this.libraryContentPublishDate,
    required this.libraryContentTitle,
  });

  final String libraryContentBodyText;
  final String libraryContentImageUrl;
  final String libraryContentPublishDate;
  final String libraryContentReadTime;
  final String libraryContentTags;
  final String libraryContentTitle;
}
