// Consider using environment variables or secure storage in production
const String API_KEY = "1ecafcf95d9286c516d61a69e1915ded";
const String BASE_URL = "https://api.openweathermap.org/data/2.5";

// Latitude and longitude coordinates for API calls
// double latitude = 40.7128; // New York City latitude
// double longitude = -74.0060; // New York City longitude

// // Construct the complete API URL with coordinates
// String getWeatherUrl() {
//   return '$BASE_URL/weather?lat=$latitude&lon=$longitude&appid=$API_KEY&units=metric';
// }

// // Construct URL for hourly forecast data
// String getHourlyForecastUrl() {
//   return '$BASE_URL/forecast?lat=$latitude&lon=$longitude&appid=$API_KEY&units=metric';
// }

// // Browser-friendly URL for testing (Note: Don't expose API key in production)
// String getBrowserTestUrl() {
//   return 'https://api.openweathermap.org/data/2.5/forecast?lat=40.7128&lon=-74.0060&appid=1ecafcf95d9286c516d61a69e1915ded&units=metric';
// }

// give me browser 