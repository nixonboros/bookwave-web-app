<%@ page import="com.g3app.model.Notification" %>
<%@ page import="java.util.List" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Notification Dashboard - Bookstore</title>
</head>
<body>
    <jsp:include page="nav-header.jsp"/>

    <main>
        <section class="notification-section animated">
            <h1>Notification Dashboard</h1>
            <p>Here you can view and manage all your notifications. Use the tabs below to navigate between viewing notifications.</p>

            <div class="tabs">
                <div class="tab active" data-target="unreadNotifications">Unread Notifications</div>
                <div class="tab" data-target="readNotifications">Read Notifications</div>
            </div>

            <!-- UNREAD NOTIFICATIONS TAB -->
            <div id="unreadNotifications" class="tab-content active">
                <h2>Unread Notifications</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Notification ID</th>
                            <th>Details</th>
                            <th>Date Received</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Notification> unreadNotifications = (List<Notification>) request.getAttribute("unreadNotifications");
                            if (unreadNotifications != null && !unreadNotifications.isEmpty()) {
                                for (Notification notification : unreadNotifications) {
                        %>
                        <tr>
                            <td><%= notification.getNotificationId() %></td>
                            <td><%= notification.getMessage() %></td>
                            <td><%= notification.getDateSent() %></td>
                            <td><%= notification.getStatus() %></td>
                            <td>
                                <a href="UpdateNotificationStatusServlet?notificationId=<%= notification.getNotificationId() %>&ticketId=<%= notification.getTicketId() %>" class="button">View</a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5">No unread notifications available.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>

            <!-- READ NOTIFICATIONS TAB -->
            <div id="readNotifications" class="tab-content">
                <h2>Read Notifications</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Notification ID</th>
                            <th>Details</th>
                            <th>Date Received</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Notification> readNotifications = (List<Notification>) request.getAttribute("readNotifications");
                            if (readNotifications != null && !readNotifications.isEmpty()) {
                                for (Notification notification : readNotifications) {
                        %>
                        <tr>
                            <td><%= notification.getNotificationId() %></td>
                            <td><%= notification.getMessage() %></td>
                            <td><%= notification.getDateSent() %></td>
                            <td><%= notification.getStatus() %></td>
                            <td>
                                <a href="UpdateNotificationStatusServlet?notificationId=<%= notification.getNotificationId() %>&ticketId=<%= notification.getTicketId() %>" class="button">View</a>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5">No read notifications available.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </section>
    </main>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // Tab functionality
            const tabs = document.querySelectorAll('.tab');
            const tabContents = document.querySelectorAll('.tab-content');

            tabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    const targetId = tab.getAttribute('data-target');

                    tabs.forEach(t => t.classList.remove('active'));
                    tabContents.forEach(content => content.classList.remove('active'));

                    tab.classList.add('active');
                    document.getElementById(targetId).classList.add('active');
                });
            });
        });
    </script>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>
