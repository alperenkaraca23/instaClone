
```markdown
# Instagram Clone

Instagram Clone is a simplified version of Instagram, where users can log in, view a feed of photos, upload their own photos, and access settings. The app utilizes **Firebase** for authentication, database storage, and image uploading.

## Features

- **User Authentication**: Users can log in or sign up using Firebase Authentication.
- **Feed Page**: Displays a list of photos, captions, and like buttons retrieved from the Firebase Cloud Database.
- **Photo Upload**: Allows users to upload photos with captions, which are saved to the Firebase Cloud Database.
- **Settings Page**: Includes a logout button to allow users to sign out of the app.
- **Data Display**: Displays uploaded data in the feed, sorted by the date it was added.

## How It Works

1. **User Authentication**:
   - Integrated **Firebase Authentication** to handle user sign-in and sign-up processes.
   - Created a login page where users can either sign in or sign up with their email and password.
   - If a user is already logged in, they are automatically redirected to the feed page.

2. **Feed Page**:
   - Designed a custom **feed cell** that displays a photo, caption, and like button.
   - Fetched data from **Firebase Cloud Firestore** and displayed the content (photos, captions, and user info) in the feed, sorted by the date of the post.

3. **Photo Upload**:
   - Created a page where users can upload a photo with a caption.
   - When the user uploads a photo, the image is saved to Firebase Storage, and the caption along with the user’s email and upload date is saved in Firebase Cloud Firestore.

4. **Settings Page**:
   - Designed a settings page with a **logout button**, allowing users to sign out of the app and return to the login page.

5. **Firebase Integration**:
   - Used **Firebase** for both authentication (sign in, sign up) and database management (storing user data, photos, and captions).
   - Used **Firebase Storage** to store the images and **Firestore** to store user-related data and photo captions.

6. **Navigation**:
   - Implemented **segues** to smoothly navigate between pages, including from the login page to the feed page and from the feed page to the upload page.

7. **Testing**:
   - Performed extensive testing to ensure smooth user login, feed display, photo upload, and logout functionality.

## Requirements

- Xcode 14+
- iOS 15+
- Swift 5.7+
- **Firebase** for authentication, cloud database, and storage.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your_username/instagram-clone.git
   cd instagram-clone
   ```

2. Install Firebase SDK by following the instructions in the Firebase setup guide.
   
3. Open the project in Xcode:
   ```bash
   open InstagramClone.xcodeproj
   ```

4. Run the project on a simulator or a physical device.

## Screenshots & Demo

### Screenshots

<img width="1386" alt="Ekran Resmi 2024-11-29 15 41 48" src="https://github.com/user-attachments/assets/5dfc449e-0102-4f6e-b67a-25176c97156f">
<img width="1394" alt="Ekran Resmi 2024-11-29 15 41 32" src="https://github.com/user-attachments/assets/5c5a99a9-c88f-4eca-8318-769339bd726d">
<img width="1322" alt="Ekran Resmi 2024-11-29 15 41 17" src="https://github.com/user-attachments/assets/aec97e18-15a6-41f5-b136-d46ace7eaa3f">


### Video Demo



## Technologies Used

- **Firebase Authentication**: For user authentication (sign in, sign up).
- **Firebase Cloud Firestore**: For storing user data, captions, and posts.
- **Firebase Storage**: For storing uploaded images.
- **Swift**: Programming language for development.
- **UIKit**: For designing the user interface.
- **Segues**: For easy navigation between pages.

## Future Improvements

- Add a like button functionality that updates the number of likes in the feed.
- Implement a comment system for each post.
- Add a user profile page where users can edit their details and view their uploaded photos.
- Implement push notifications for new posts or activity.
- Add a search function to discover other users and posts.
