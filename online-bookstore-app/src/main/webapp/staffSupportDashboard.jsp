<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <title>Staff Support Tickets - Bookstore</title>
</head>
<body>
    <jsp:include page="staff-nav-header.jsp"/>

    <main>
        <section class="staff-tickets-section animated">
            <h1>Support Tickets Management</h1>
            <p>Welcome to the staff dashboard. Here you can view and manage all customer support tickets.</p>

            <h2>All Support Tickets</h2>
            <table>
                <thead>
                    <tr>
                        <th>Ticket ID</th>
                        <th>Customer Name</th>
                        <th>Subject Title</th>
                        <th>Type</th>
                        <th>Status</th>
                        <th>Date Submitted</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example ticket data; this should be replaced with data from your database -->
                    <tr>
                        <td>12345</td>
                        <td>Jane Doe</td>
                        <td>Incorrect Billing Amount Charged</td>
                        <td>Billing Issues</td>
                        <td>Open</td>
                        <td>2024-09-01</td>
                        <td>
                            <a href="staffSupportTicketDetails.jsp?ticketId=12345" class="button view-ticket">View</a>
                        </td>
                    </tr>
                    <tr>
                        <td>67890</td>
                        <td>John Smith</td>
                        <td>Issue with Updating Payment Method Details</td>
                        <td>Technical Support</td>
                        <td>Closed</td>
                        <td>2024-08-20</td>
                        <td>
                            <a href="staffSupportTicketDetails.jsp?ticketId=67890" class="button view-ticket">View</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>
</body>
</html>
