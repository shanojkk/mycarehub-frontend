/// a constant for storing the custom token expiry time in minutes
///
/// this value is set as is because we want to refresh the token
/// 10 minutes before expiry
const int kTokenCustomExpiryTimeInSeconds = 3000;

// the amount of seconds before token expiry where we should refresh the token
const int kTokenCustomBeforeExpiryTimeInSeconds = 600;

// the amount of time to periodically poll for the feed. Currently this is 10 minutes
const int kFeedAutoRefreshTimeInSeconds = 10 * 60;

// 18 years in days
const int kMinorAgeLimit = 6570;
