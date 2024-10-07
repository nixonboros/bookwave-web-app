# AdvSoftwareDevG3

AdvSoftwareDev Group 3
Repo for an Online Bookstore System

FEATURES

Jerry 
- Cleaned up index.jsp (added Best Sellers section)
- Login/Register
- User Dashboard (Edit and view account details, delete account) 
- Page Footer
- General data validation
- Helped with catalogue features (add book, delete book, display book(s) in catalogue and best sellers in index.jsp, individual product pages and Manage Catalogue menu (staff))
- Helped setup database
- Set up testing and linked to Azure
- UserTest

Nixon 
- Notifications
- Customer Support (support chat, viewing and opening and closing tickets) 
- Database setup (tables and contents)
- General data validation
- Server setup 
- Helped with Login/Registration
- Page Navbar
- SupportTicketTest

Sarneet 
- Staff Login/Registration 
- Catalogue

Nicolas 
- Orders Management 
- Orders Tracking

Yuri 
- Checkout
- Product Pages

HOW TO SETUP

install netbeans 23 (latest)
open online-bookstore-app project directory (wherever u have it saved)

tomcat server 

download tomcat server zip file (https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.0-M26/bin/apache-tomcat-11.0.0-M26-windows-x64.zip)
inside netbeans, go to services tab > add server > choose tomcat and select the directory to the tomcat server folder > username: admin, password: admin
after adding the tomcat server > go projects tab > right click online-bookstore-app > properties > run > and change the server to tomcat

database

download mysql (https://dev.mysql.com/downloads/file/?id=532677) (server only, msg any questions on installing)
download my-sql-connector-j-8.0.32.jar (https://downloads.mysql.com/archives/get/p/3/file/mysql-connector-j-8.0.32.zip)
go to services tab > right cllick 'databases' > new connection > go to mysql > add > select the mysql-connector jar FILE > enter password: root > (can ignore the database it creates after, its just a sample)
start the mysql server > right click > create database > name it 'bookstoredb' exactly
