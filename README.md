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
#### Login Users
**Characteristics:**

Login Users are logged in users that can create and get content at any given location. Logged in users have names and can be identified by anyone using the app. 

**Stories:**

Logged in user logs into the app. After providing geolocation info, he/she can create content for that location. If there is content from that location, he/she can download that content. 
#### Anonymous Monkeys
**Characteristics:**

Users that have no need to login, but in exchange do not have the ability to “drop” files.

**Stories:**
	
Anonymous monkeys hit a skip button to bypass login page and are presented with a map with files, but can only see files and cannot edit them.
Bobby is going to a symposium on how rails is the future of web development. The organisers tell the guests that they have all requisite symposium files on “Geobox”. Bobby loads geobox.xyz and sees a login page. He also sees a “skip” button which he presses. A map with his location and several “file” icons appears. Opening a sidebar reveals the files he needs.

## 3.        External Interface Requirements
### 3.1        User Interfaces
Responsive Design - should look good on phones as well as large screens
Majority of Screen is the map, the user position is indicated on the map.
File/Rooms could also be shown on the map, or not (decide later)
