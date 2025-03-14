<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("username") == null) {
        response.sendRedirect("login.jsp?error=Session Expired");
        return; // Stop further execution
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>Customer Dashboard</h1>
        <p>Welcome, <%= session.getAttribute("username") %></p>

        <form action="BookingReportServlet" method="GET">
            <label>From Date:</label>
            <input type="date" name="fromDate" required>

            <label>To Date:</label>
            <input type="date" name="toDate" required>

            <button type="submit" class="btn btn-danger">Download My Booking Report (CSV)</button>
        </form>

        <a href="logout.jsp" class="btn btn-danger">Logout</a>
    </div>
</body>
</html>
