🚀 Maven Project Setup Guide
This guide will help you smoothly convert your existing dynamic web project into a Maven project and get everything up and running! 😎

1️⃣ Convert Your Dynamic Web Project to Maven
If you've already created a dynamic web project in your IDE (like Eclipse), follow these easy steps to convert it into a Maven project:

Right-click on your project name in the Project Explorer.
Navigate to Configure → Convert to Maven Project.
Maven will automatically generate a pom.xml file to manage dependencies.
✔️ Done! Your project is now Maven-based!

2️⃣ Update pom.xml with Dependencies
Now it's time to update the pom.xml file with the necessary dependencies for your project.

Open the pom.xml file.

Add the required dependencies. (reffer pom.xml)

3️⃣ Force Dependency Updates ⏩
If your dependencies don't install automatically, don’t worry! You can manually force Maven to update them:

Right-click on your project.
Choose Maven → Update Project.
If you're unsure how to force an update, check out a quick tutorial or ask ChatGPT for more guidance! 🤖

4️⃣ Move Your Project Files to the Maven Folder Structure 📂
Now it's time to organize your code! Follow Maven’s standard folder hierarchy to keep everything neat and functional:

Java code (Servlets, DAOs, Models) goes into:
src/main/java/com/company

Web content (HTML, JSP, JS, CSS) goes into:
src/main/webapp

Here’s a quick breakdown of where to put things:

📂 Maven Folder	📝 What to Move
src/main/java	Java files (Servlets, DAOs, Models, Utilities)
src/main/webapp	JSP files, HTML pages
src/main/webapp/resources	CSS, JS, Images, and other static resources
🚨 Important: Make sure to maintain your folder structure and hierarchy for everything to run smoothly!

🎉 And that’s it! You've successfully converted your dynamic web project into a Maven project! 🎉

Now, you're all set to manage your dependencies easily and organize your code like a pro! 💪
