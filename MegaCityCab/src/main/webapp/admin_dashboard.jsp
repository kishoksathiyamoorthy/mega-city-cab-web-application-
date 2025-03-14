<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <h1>Admin Dashboard</h1>
<p>Welcome, <%= session.getAttribute("username") %></p>
 <%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("username") == null) {
        response.sendRedirect("login.jsp?error=Session Expired");
    }
%>
<form action="BookingReportServlet" method="GET">
    <label>From Date:</label>
    <input type="date" name="fromDate" required>

    <label>To Date:</label>
    <input type="date" name="toDate" required>

    <button type="submit" class="btn btn-danger">Download Booking Report (PDF)</button>
</form>

<a href="logout.jsp" class="btn btn-danger">Logout</a>
        </div>
    </body>
</html>
