# Planets
- A Star wars API based app
- Showcases first page of Planets listed in SWAPI API here: https://swapi.dev/api/planets
- Uses another API called Lorem Picsum to fetch random images from here: https://picsum.photos
- This app is built on MVVM architecture 
- It uses Combine framework to fetch Data
- And it uses SwiftUI 
- This app is universal, meaning it's built for iPhone and iPads
- It also supports rotation on both iPhone and iPad
- It includes mockAPIRespository to test the SWAPI API
- Includes a cool and continuous animation when the images are tapped 
- Has a nice custom built icon
- Supports dark mode
- Does not use any third party framework

Possible improvements:
- Adding another ProgressView() for images just like the one used for main API
- Adding another test case for Lorem Picsum API
- Adding Swift lint support to detect code anomalies and to clean up the formatting
- Adding Snapshot test framework to enable Snapshot testing which is an easier way to do UI tests 
- Adding Pagination support to load rest of the pages
- Adding AsyncImage() API 
- Transition away from NavigationView to NavigationStack(requires updating the app to iOS 16 and above)

Prerequisites:
- Requires a mac running Xcode 14 or above

Short Demo:
- https://user-images.githubusercontent.com/9431943/236849614-452bbca3-348a-42bd-950d-ce79d25adc45.mov

