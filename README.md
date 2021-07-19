# news_app

News Flutter Application

![news_app](https://i.imgur.com/g8lnsPS.gif)

## Description
News Flutter Demo Application using News Api ("https://newsapi.org/"):
1. User can navigate between different news categories
2.Display news according to chosen category
3. Display detail screen for news selected
4. Updating news response every 10 seconds in background using android_alarm_manager to make the fetchNews callback periodically in background each 10 seconds. 



## Pattern/Approach Used 
The Provider pattern is used for data and state management .

## Flutter Packages/Plugins/Libraries Used

  http: ^0.12.0+4
  cached_network_image: ^2.0.0
  webview_flutter: ^0.3.19+9
  provider: ^4.3.3
  android_alarm_manager_plus: ^0.4.5+20
  

## How to run
- Clone this repo
- Run (flutter packages get)
- Run (flutter run) while connecting a physical mobile device or emulator





