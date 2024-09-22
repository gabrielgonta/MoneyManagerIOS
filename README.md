# 📝 MoneyManagerIOS - SwiftUI iOS App

## Description

Welcome to MoneyManager - a SwiftUI iOS App for managing your finances! 🎉  
This simple yet captivating app allows you to track your revenues and expenses with a clean and visually appealing interface.

Accounts are presented as cards that display the current balance and related transactions.  
Adding transactions is simple: just select the amount, category, and type (revenue or expense). You can also delete transactions with a swipe. Additionally, there's a toggle in the profile view that lets you choose whether to delete a transaction while retaining its economic impact on the balance, or to remove it completely in case of an incorrect entry.

By tapping on a card, a histogram will be displayed, visually representing the financial status of that account.

Through the toolbar, you can access the Profile View, where the data provided during the app’s first launch can be reviewed, and you can upload a profile picture as well.

## Prerequisites

You will need a Mac with Xcode installed to run this app.  
Install Xcode: https://developer.apple.com/xcode/

## Installation

Clone the repository:

```
git clone https://github.com/gabrielgonta/MoneyManagerIOS.git
```

Open the project in Xcode :

```
cd MoneyManager open MoneyManager.xcodeproj
```

Run the app on a simulator or connected iOS device.

## Features

✔ Track revenues and expenses by adding transactions  
✔ Visually see account status with histograms  
✔ Delete transactions via swipe gestures  
✔ Option to delete transactions while maintaining balance impact  
✔ Upload and manage profile pictures from the Profile View  
✔ View and edit user data provided at the app’s first launch

## App Preview

### App Demo

<img src="https://github.com/gabrielgonta/MoneyManagerIOS/Demo/Example.gif" width="300" height="700" alt="example">

## Technical Details

- **SwiftUI** for designing the User Interface  
- **PhotosUI** for selecting profile pictures directly from the system Photos app on iOS  
- **SwiftCharts** for displaying interactive charts

The app follows the **MVVM** architecture, with each View stored in its own folder containing both the UI file and its corresponding ViewModel.

User data is stored persistently using **DocumentsDirectory**, and **UserDefaults** is used to track the first launch of the app.

## Authors

* **Andrea Sara** - *Initial work* - [MoneyManagerIOS](https://github.com/gabrielgonta/MoneyManagerIOS.git)