

#Insurance Services HUB: Buy, Review, Search Policy for Health and Auto benefits. \
This Web Application is developed with the help of Servlets + JSP + Java\

#MySQL database is used to store User, Company, Policies, Admin data. MongoDb is used  to store customer reviews and suggestions.\

#GoogleMAPS API is used to find location of our office. And YELP_API Fusion is used to fetch the information and reviews of out Partners who provide us Insurance.\

#BUILD Instructions\
1. Start your TOMCAT server and MongoDB Server, also mysql should be ON.\
2. Now open the insurance folder in IDE with accepts MAVEN Dependencies using pom.xml or adding it manually. \
3. The dependencies needed for this Web Application are \'93Java-api-servlet\'94, \'93mysql-connector\'94, \'93mongo-java-driver\'94, \'93json\'94, \'93bson\'94, \'93junit\'94\
4. After adding the dependencies we can now compile and install the project from the Maven directory. \
5. After installing, we get a \'93.war\'94 file. \
6. Place the \'93.war\'94  file in our tomcat/webapps folder and start localhost.\
7. Our Project is loaded using Tomcat Server.\
8. Find the pom.xml in the folder.\

# We have written about 3800 lines of code in .jsp, .java files\

# FEATURES\
1. We have Admin Login which allows company to register, after which they can add the policies.\
2. Company can login after the admin allows and then companies can add their health/auto insurance plans.\
3. User can Login and Buy insurance by providing the details.\
4. There is a Search Policy page which displays all the active polices.\
5. Company can active/ reactive the polices when they login as Company. After deactivate a policy, the user cannot buy it.\
6. Feedback form is present. The feedbacks are stored in Mongodb Collection.\
7. The location of our office is displayed in the google maps using GOOLEMAPS Place API.\
8. BarChart is created with the help Canvas JS charts. The chart shows the Zipcode vs Count(reviews)\
9. Image Slider with auto-timer is present on the index page.\
10. We have fetch insurance companies information and reviews from the YELP-API Fusion using the file sample.py\
11. These information and reviews are displaced under \'93Our Partners\'94 link.\
12. Scroll Up page feature is present\
13. In user Dashboard the user can update details like password, phone, profile photo etc.\
13. Mail confirmation details to the User from the company and also to the company on successful registration.\

#FutureIdeas\
1. Wanted to collect policy plans from a API and allow user to buy it.\
2. Different Visual Charts to display the trends in buying insurance.\


Thank You.}
