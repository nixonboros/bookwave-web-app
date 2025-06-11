<%@ page import="com.g3app.model.User" %>
<%@ page import="com.g3app.model.Book" %>
<%@ page import="com.g3app.model.Notification" %>
<%@ page import="java.util.List" %>

<html>
<header>
    <nav class="navbar">
        <div class="navbar__left">
            <a href="index.jsp" class="navbar__logo" aria-label="BookWave Home">
                <img src="images/book-logo.png" alt="BookWave Logo" class="navbar__logo-img">
                <span>BookWave</span>
            </a>
        </div>
        <button class="navbar__toggle" aria-label="Open menu" aria-expanded="false">
            <span></span><span></span><span></span>
        </button>
        <div class="navbar__center" id="navbarNav">
            <ul class="navbar__links">
                <li><a href="index.jsp" class="<%= request.getRequestURI().endsWith("index.jsp") ? "active" : "" %>">Home</a></li>
                <li><a href="product.jsp" class="<%= request.getRequestURI().endsWith("product.jsp") ? "active" : "" %>">Products</a></li>
                <% User user = (User) request.getSession().getAttribute("user");
                   if (user != null) { %>
                <li><a href="UserOrderDashboardServlet" class="<%= request.getRequestURI().contains("Order") ? "active" : "" %>">Orders</a></li>
                <li><a href="UserSupportDashboardServlet" class="<%= request.getRequestURI().contains("Support") ? "active" : "" %>">Contact</a></li>
                <% } %>
            </ul>
        </div>
        <div class="navbar__right">
            <% if (user != null) { %>
                <a href="cart.jsp" class="navbar__icon" aria-label="Cart" title="Cart">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
                </a>
                <div class="navbar__icon notification">
                    <button class="notification-button" aria-label="Notifications" title="Notifications">
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
                        <% List<Notification> unreadNotifications = (List<Notification>) request.getSession().getAttribute("unreadNotifications");
                           if (unreadNotifications != null && !unreadNotifications.isEmpty()) { %>
                            <span class="notification-badge"><%= unreadNotifications.size() %></span>
                        <% } %>
                    </button>
                    <div class="dropdown-menu animated">
                        <div class="dropdown-header">
                            <h4>Notifications</h4>
                            <a href="MarkAllNotificationsAsReadServlet" class="mark-all-read">Mark All as Read</a>
                        </div>
                        <ul>
                            <%
                                if (unreadNotifications != null && !unreadNotifications.isEmpty()) {
                                    for (Notification notification : unreadNotifications) {
                            %>
                            <li>
                                <a href="UpdateNotificationStatusServlet?notificationId=<%= notification.getNotificationId() %>&ticketId=<%= notification.getTicketId() %>">
                                    <%= notification.getMessage() %>
                                </a>
                            </li>
                            <%
                                    }
                                } else {
                            %>
                            <li class="no-notifications">No new notifications</li>
                            <%
                                }
                            %>
                        </ul>
                        <a href="NotificationServlet" class="view-all">View All Notifications</a>
                    </div>
                </div>
                <a href="mydetails.jsp" class="navbar__icon" aria-label="My Account" title="My Account">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                </a>
                <a href="LogoutServlet" class="navbar__icon logout-button" aria-label="Log Out" title="Log Out">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
                </a>
            <% } else { %>
                <a href="login.jsp" class="button button-primary navbar__login" aria-label="Login" title="Login">
                    <svg class="login-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"></path><polyline points="10 17 15 12 10 7"></polyline><line x1="15" y1="12" x2="3" y2="12"></line></svg>
                    Login
                </a>
            <% } %>
        </div>
    </nav>
</header>

<style>
html, body {
    overflow: auto;
    scrollbar-width: none; /* Firefox */
    -ms-overflow-style: none;  /* IE and Edge */
}
html::-webkit-scrollbar, body::-webkit-scrollbar {
    display: none; /* Chrome, Safari and Opera */
}
.navbar {
    position: sticky;
    top: 0;
    z-index: 100;
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    min-height: 56px;
    height: 56px;
    background: var(--surface);
    box-shadow: 0 2px 8px rgba(30,41,59,0.06);
    padding: 0 24px;
    box-sizing: border-box;
}
.navbar__left {
    flex: 1;
    display: flex;
    align-items: center;
}
.navbar__logo {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-family: var(--font-heading);
    font-size: 1.5rem;
    font-weight: 600;
    color: var(--text-primary);
    text-decoration: none;
}
.navbar__logo-img {
    height: 2rem;
    width: auto;
}
.navbar__toggle {
    display: none;
    flex-direction: column;
    gap: 4px;
    background: none;
    border: none;
    cursor: pointer;
    margin-left: 1rem;
    padding: 8px;
}
.navbar__toggle span {
    display: block;
    width: 24px;
    height: 2.5px;
    background: var(--text-primary);
    border-radius: 2px;
}
.navbar__center {
    flex: 2;
    display: flex;
    justify-content: center;
    align-items: center;
}
.navbar__links {
    display: flex;
    gap: 2.5rem;
    list-style: none;
    margin: 0;
    padding: 0;
}
.navbar__links a {
    color: var(--text-secondary);
    text-decoration: none;
    font-weight: 500;
    font-size: 1.08rem;
    padding: 0.25rem 0.75rem;
    border-radius: 999px;
    transition: color 0.2s, background 0.2s;
    position: relative;
    display: inline-block;
}
.navbar__links a:hover,
.navbar__links a:focus {
    color: var(--primary);
    background: rgba(37,99,235,0.07);
}
.navbar__links a.active {
    color: var(--primary);
    background: rgba(37,99,235,0.07);
}
.navbar__links a.active::after,
.navbar__links a:hover::after,
.navbar__links a:focus::after {
    content: "";
    display: block;
    position: absolute;
    left: 0;
    right: 0;
    bottom: -6px;
    height: 3px;
    border-radius: 2px;
    background: var(--primary);
}
.navbar__right {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: flex-end;
    gap: 1rem;
}
.navbar__icon,
.notification-button {
    color: var(--text-secondary);
    background: none;
    border: none;
    font-size: 1.15rem;
    padding: 0.25rem 0.5rem;
    border-radius: var(--radius-md);
    transition: background 0.2s, color 0.2s;
    cursor: pointer;
    position: relative;
    min-width: 40px;
    min-height: 40px;
    outline: none;
}
.navbar__icon:hover,
.navbar__icon:focus,
.notification-button:hover,
.notification-button:focus {
    background: rgba(37,99,235,0.08);
    color: var(--primary);
}
.logout-button:hover,
.logout-button:focus {
    background: rgba(239,68,68,0.08);
    color: var(--error);
    border-color: transparent;
}
.notification-badge {
    position: absolute;
    top: 6px;
    right: 6px;
    background-color: var(--error);
    color: white;
    font-size: 0.75rem;
    font-weight: 600;
    padding: 2px 6px;
    border-radius: 999px;
    min-width: 18px;
    text-align: center;
    pointer-events: none;
}
.navbar__icon.notification:hover,
.navbar__icon.notification:focus {
    background: none !important;
}
.notification-button {
    display: flex;
    align-items: center;
    justify-content: center;
    vertical-align: middle;
    padding: 0.25rem 0.5rem;
    min-width: 40px;
    min-height: 40px;
    background: none;
    border: 2px solid transparent;
    color: var(--text-secondary);
    border-radius: var(--radius-md);
    transition: background 0.2s, color 0.2s;
    outline: none;
    box-shadow: none;
}
.notification-button svg {
    display: block;
    width: 22px;
    height: 22px;
    vertical-align: middle;
    transition: color 0.2s;
}
.notification-button:hover,
.notification-button:focus {
    background: rgba(37,99,235,0.08);
    color: var(--primary);
    border-color: transparent;
    box-shadow: none;
}
@media (max-width: 900px) {
    .navbar {
        flex-wrap: wrap;
        height: auto;
        min-height: unset;
        padding: 0 12px;
    }
    .navbar__toggle {
        display: flex;
    }
    .navbar__center {
        width: 100%;
        order: 3;
        justify-content: center;
        margin-top: 0.5rem;
        display: none;
    }
    .navbar__center.active {
        display: flex;
    }
    .navbar__links {
        flex-direction: column;
        gap: 1.25rem;
        width: 100%;
        align-items: center;
    }
    .navbar__right {
        order: 2;
        width: 100%;
        justify-content: center;
        margin-top: 0.5rem;
    }
    .navbar__left {
        order: 1;
    }
}
.navbar__login.button.button-primary {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    background: var(--primary);
    color: #fff;
    font-weight: 600;
    font-size: 1rem;
    border-radius: 999px;
    padding: 0.5rem 1.5rem;
    box-shadow: 0 2px 8px rgba(37,99,235,0.08);
    border: 2px solid transparent;
    transition: background 0.2s, box-shadow 0.2s, border-color 0.2s;
}
.navbar__login.button.button-primary:hover,
.navbar__login.button.button-primary:focus {
    background: var(--primary-dark);
    color: #fff;
    box-shadow: 0 4px 16px rgba(37,99,235,0.12);
    border-color: transparent;
    text-decoration: none;
}
.navbar__login .login-icon {
    display: block;
    width: 20px;
    height: 20px;
}
.notification-button,
.navbar__icon,
.navbar__login.button.button-primary {
    display: flex;
    align-items: center;
    justify-content: center;
    vertical-align: middle;
    padding: 0.25rem 0.5rem;
    min-width: 40px;
    min-height: 40px;
    height: 40px;
    background: none;
    border: 2px solid transparent;
    color: var(--text-secondary);
    border-radius: var(--radius-md);
    transition: background 0.2s, color 0.2s;
    outline: none;
    box-shadow: none;
    box-sizing: border-box;
    line-height: 1;
}
.navbar__login.button.button-primary {
    min-width: unset;
    width: auto;
    padding: 0.5rem 1.5rem;
    background: var(--primary);
    color: #fff;
    font-weight: 600;
    font-size: 1rem;
    border-radius: 999px;
    box-shadow: 0 2px 8px rgba(37,99,235,0.08);
    gap: 0.5rem;
    border: 2px solid transparent;
}
.notification-button svg,
.navbar__icon svg,
.navbar__login .login-icon {
    display: block;
    width: 22px;
    height: 22px;
    vertical-align: middle;
    stroke-width: 2;
    stroke: currentColor;
    fill: none;
    transition: color 0.2s;
    line-height: 1;
}
.notification-button:hover,
.notification-button:focus,
.navbar__icon:hover:not(.logout-button),
.navbar__icon:focus:not(.logout-button),
.navbar__login.button.button-primary:hover,
.navbar__login.button.button-primary:focus {
    background: rgba(37,99,235,0.08);
    color: var(--primary);
    border-color: transparent;
    box-shadow: none;
}
</style>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const toggle = document.querySelector('.navbar__toggle');
    const nav = document.getElementById('navbarNav');
    toggle.addEventListener('click', function() {
        nav.classList.toggle('active');
        toggle.setAttribute('aria-expanded', nav.classList.contains('active'));
    });
});
</script>
</html>
