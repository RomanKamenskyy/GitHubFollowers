# GitHubFollowers
This project obtains a list of followers using the GitHub API. and allows the user to set and save a favorite GitHub user. The user can search for a specific follower
among these subscribers and can click on a follower from this list to get more information about that follower.

## How to build
1. Clone the repository
```bash
$ git clone https://github.com/tuist/XcodeProj.git
```
2.  Open the workspace in Xcode
```bash
$ open "GitHubFollowers.xcworkspace"
```

## Functional Requirements:
- The user can enter a GitHub username and get a list of followers of that name.
- The user can search for a specific follower among these followers.
- The user can click on a follower from this list to get more information about that follower.
- The user can save favorite username lookup options so that they don't have to type them in every time. This is saved between runs of the application.

Network Layer:
- GitHub API is used - no authentication required.
- Followers endpoint - https://developer.github.com/v3/users/followers/
- User information endpoint - https://developer.github.com/v3/users
- Network calls using Async/Await

## Technologies Used:
- No Storyboard, 100% programmatic UI.
- Swift.
- UIKit.
- UserDefaults.
- NSCache.
- SafariServices.

## Screenshots
<img width="529" alt="screenshot1" src="https://github.com/user-attachments/assets/6170b832-9479-4cf1-b24e-8b37a2641971">
<img width="529" alt="screenshot4" src="https://github.com/user-attachments/assets/8da9623c-0eb8-4c21-b434-616738f30195">
<img width="529" alt="screenshot2" src="https://github.com/user-attachments/assets/1414d9eb-7ad0-4011-ab2f-f1051fd3b3dc">
<img width="529" alt="screenshot5" src="https://github.com/user-attachments/assets/09b8c2fb-6e80-48d6-8460-86c4e4b5e69a">

![git1](https://github.com/user-attachments/assets/c241b418-54d9-4636-9f9c-2f39dffb22f8)
![gif2](https://github.com/user-attachments/assets/6f4407df-eeeb-4be0-81a5-3768ad312e6e)
![gif3](https://github.com/user-attachments/assets/2d63eec0-5abd-4f22-82d1-1af67c8810bd)

## Requirements
   iOS 17+
