# Shoesly

A Test App for Priority Soft

# PROJECT SETUP

1. MVVM and Stack archetecture followed.
2. build_runner package used to generate code for the archetecture (command use: dart run build_runner build).
3. Folder divided into following structure
   # app
   - Includes app.dart file which includes dependencies(Singleton classes) and routes.
   - includes app.router and app.locator which is generated code after using build_runner command.
   - Note* To add views and service/controllers it must be defined in app.dart and command must be run after adding any new views/pages/screen or service/controller.

   # core
   - Includes helper classes which are used to define static globally accessible constants like image assets/ non-changable strings/values, etc
   - Includes Date time helper class which helps to convert date time format into time into before/after seconds/hours/days/months or year.

   # model
   - Includes all model classes required for the application.
     
   # service

   - Includes all service classes for the application. eg API call services code etc are kept here.

   # ui
   - Divided into views and widget
     # view
       - Each view for each screen/pages of the application.
         
       # screen (view)
       - Includes all UI code for the page. Frontend code are written here.
         
       # logical (view model)
       - Includes the backend part for the screen/view part. Logics required for its view are written here which are accessed in view classes.
         
     # widget
     - All required widget/reusable components are created and placed inside this sub-directory.
  
  # main.dart
  - Main file of the application kept is kept outide where initial route, firebase initalization, etc are provided.

  # firebase_option.dart
  - firebase initial file created by firebase itselft is located outside where all essential setups/credential are enlisted and generated by firebase itself.

# Notes.
  - For IOS cocopods is required.
  - Android minimum kotlin version is changed to 1.9 inside the settings.gradle file in android directory.
  - Application id "com.example.shoely" has been used to add in firebase for both iOs and android.
  - IOS minimum supported version was changed to 13.0 as required for Firebase (minimum required 13).

# ASSUMPTIONS FOR THE APPLICATION.

- Color and Size are currenlty constant for now ie. user can only choose following colors and sizes:
  - Color : (White, Black, Green, Blue)
  - Size : (39, 40, 41, 42, 43)
  * Though color and sizes are constant currently, it can be changed dynamically in upcoming adjustment easily.

- Same Reviews from the database are used for all products.
  - Though in real scenario, reviews are based on product i.e. linked to product_id. For this test app same reviews have been used for all products which can be made dynamic
    in upcoming date.

- Payment method are provided in three categories, (Credit Card(master card), PayPal and Cash on Deliver) which is choosable.

- Location for shipping is currenly included in app as an field where use needs to enter their location rather than choosing from drop down.

- The end of order is completed once the data is written into database as their is no requirement of any payment services feature in the app.




# CHALLENGES AND THEIR SOLUTION.

 **Setting up iOS compatibity and project setup**.
    As a recent mac user, i found myself stuck for hours on setting up the project for this application.
    Common errors I faced were:
    - Cocoapods setup (Pod install).
    - Ruby setup.
    - X code runner build library and dependency errors, etc.
    **How did i overame them?**
    On doing self-research and dedication towards the project, i found that the ruby and pod are interrelated and their env path must be added to zhrc file and must be saved.
    Secondly I came to know about the pre-installed ruby of version 2.9 must be replaced with latest version 3.3 and then the cocoapods must be installed for clean installation
    without any error. So after after installing pods through homebrew and updating ruby, i finally managed to setup the project correctly for iOs platform.

**Operating with firebase**
    Working with the firebase in cloud storage was quite unique for me as I had worked with firebase for push notification previously. So working with firebase seemed quite challenging
    for me at the beginning. Secondly, i also faced some issue on setting up firebase for iOs platform as the pod and firebase were not interacting properly with each other and errors
    were thrown one after another.
    **How did i overame them?**
    Documentation and online source/community has always been a way to learn new technologies for me. So on researching and practice for a period of time, I understood the working     
    mechanism and required setup for working with firebase. After couple hours of learning, i was able to implement firebase with ease.



**Additional Features Added**
    - Splash Screen
    - Snackbars on errors.
    - Payment bottomsheet on completed payments.
    - Precise (before and after) Date Time (eg. 2 seconds ago, 1 day ago, etc).
    

    
  
     



