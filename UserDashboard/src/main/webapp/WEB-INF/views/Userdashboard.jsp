<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <style>
    .logo {
  color: #fff;
  font-size: 24px;
  text-decoration: none;
  font-weight: bold;
}
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        h2 {
            color: #666;
            margin-bottom: 10px;
        }
        nav {
            background-color: #333;
            padding: 10px;
            margin-bottom: 20px;
        }
        nav a {
            color: #fff;
            text-decoration: none;
            padding: 8px;
            margin-right: 10px;
            border-radius: 5px;
        }
        nav a:hover {
            background-color: #666;
        }
        p {
            margin: 5px 0;
        }
        .dashboard {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .dashboard p {
            border: 1px solid #ccc;
            padding: 10px;
            border-radius: 5px;
            background-color: #f5f5f5;
            margin: 0;
            flex-basis: 50%;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table thead {
            background-color: #333;
            color: #fff;
        }

        table th,
        table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        table tbody tr:nth-child(even) {
            background-color: #f5f5f5;
        }
        span{
        color:white;
        }
        
        .popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 9999;
        }

        .popup div {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            font-size: 16px;
            text-align: center;
            max-width: 80%;
        }
        
        .profile-wrapper {
            position: relative;
            display: inline-block;
            cursor: pointer;
        }
        
        .profile-options {
            position: absolute;
            top: 100%;
            right: 0;
            background-color: #555;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            padding: 5px 10px;
            display: none;
            width: 150px; /* Increase the width */
        }
        
        .profile-options a {
            color: white;
            display: block;
            padding: 5px;
            text-decoration: none;
        }
        
        .profile-wrapper:hover .profile-options {
            display: block;
        }
    </style>
</head>
<body>
    <nav>
    <span class="logo">AvengersBTRS</span>
        <a class="nav-link" href="#" >Dashboard</a>
        <a class="nav-link" href="#" >Passengers</a>
        <a class="nav-link" href="#" >Booking History</a>
        <a class="nav-link" href="#" >Tickets</a>
        <div class="profile-wrapper">
            <span class="nav-link">Profile</span>
            <div class="profile-options">
                <a href="#">View Profile</a>
                <a href="#">Edit Profile</a>
            </div>
        </div>
        <a class="nav-link" href="#">LogOut</a>
    </nav>

    <div style="display: flex; justify-content: space-between; align-items: center;">
        <h1>Welcome to the Avengers BTRS User Dashboard</h1>
    </div>
    
    <div class="dashboard2" id="dashboard2">
        <h2>Statistics</h2>
        <div class="dashboard" id="dashboard">
            <p><strong>Number of Times Travel:</strong> ${routeCount}</p>
            <p><strong>Number of Tickets Booked:</strong> ${tripCount}</p>
            <p><strong>Wallet Amount:</strong> ${serviceCount}</p>
            <%-- Add more <p> tags here as needed --%>
        </div>
    </div>
</body>
</html>