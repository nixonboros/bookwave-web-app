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
            <p>Here you can view and manage all your notifications. Use the tabs below to navigate between viewing notifications and any other relevant sections.</p>

            <div id="notifications" class="tab-content active">
                <h2>Your Notifications</h2>
                <p>Here you can view and manage all your notifications. Click on a notification to view its details.</p>
                
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
                            List<Notification> notifications = (List<Notification>) request.getAttribute("notifications");
                            if (notifications != null && !notifications.isEmpty()) {
                                for (Notification notification : notifications) {
                        %>
                        <tr>
                            <td><%= notification.getNotificationId() %></td>
                            <td><%= notification.getMessage() %></td>
                            <td><%= notification.getDateSent() %></td>
                            <td><%= notification.getStatus() %></td>
                            <td><a href="notification_detail.jsp?id=<%= notification.getNotificationId() %>" class="button">View</a></td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="7">No notifications available.</td>
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
