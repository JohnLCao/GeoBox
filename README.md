# GeoBox
File-sharing application that enables users to manage shared files based on geolocation.

## 1.        Introduction
### 1.1        Purpose
Enable users to manage shared files based on geolocation.

### 1.2        Intended Audience
All users who want to manage shared files based on geolocation.

### 1.3        Product Scope
Main functions includes file search, upload and download. To be developed features: sharing rooms and file open. Users can login as guest, normal users, or admins to gain access to the application. 

File will be automatically deleleted after they expire. Uploaders or room owners also have permission to delete their files.

### 1.4		Minimal Viable Product
Have files popped up when users walk into the vicinity of share file location.

### 1.5		Competitors
Any file-sharing solutions: Box, Dropbox, Google Drive, etc.
Whisper: allows users to share media (mostly text) with limits based on geolocation.  

## 2.        Overall Description
### 2.1        Product Functions
A user can set a radius for a shared file so that other users whose geolocations are within the radius can access the file.

Example situation: there are users A, B, C, D in a classroom. User A shares a file and set the file's radius to the classroom size. Then users B, C, D can access the shared file. User A also can create a "room" and upload (adding) a file in that room. The room can have a secret key. Then all users in the example can connect to each other via “rooms”. 

Each “room” has a coordinate that allows users to discover it when being within its radius.
### 2.2       User Classes and Characteristics (Stories)
#### Admin Gods
**Characteristics:**
 
Admins are super users with following permissions:
- Ban users when inappropriate behaviours are found.
- Access rooms, shared files, and users' information except passwords. 
- Delete/modify rooms and files.

**Stories:**  

Steve is an employee of GeoBox and is part of the anti-harassment team which is responsible to make sure no malicious or offensive content lingers on the app.  
 	
Steve logs into the application as Admin. Steve now can see a complete view of the company's database. Steve can check on new users, new rooms, and new files just like a standard user. Steve will look for suspicious behaviours. For example, Steve notices that user John has shared malicious files. Steve then decides to give John a warning or delete John from the database. 

#### Standard Users
**Characteristics:**

Standard Users are users with valid username/password to log into the application. Standard Users's permissions:
- Access files
- Upload/ download files
- Create rooms 

**Stories:**

John as a standard user logs ino the application. John now can have full access (view, upload, download, delete (only files uploaded by John)) to rooms/ files which are accessable within his geolocation.
 
#### Guest Users
**Characteristics:**

Guest users which only can see files which are accessible within their geolocation.

**Stories:**
	
Story 1. 
John, as a guest user, hits a skip button to bypass the login page. John now sees a map with files. He can only view files but edit them.

Story 2. 
Bobby is going to a symposium on how Rails is the future of web development. The organisers inform all guests that they have all requisite symposium files on “Geobox”. Bobby loads geobox.xyz and sees a login page. As a guest user, he hits a skip button to bypass the login page. A map shows his location and “file” icons. Bobby opens a sidebar to access the files.

## 3.        External Interface Requirements
### 3.1        User Interfaces
Responsive Design - should look good on phones as well as large screens.
Majority of Screen is the map, the user position and file icons are shown on the map.
