<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

/* Navbar styles */
.navbar {
  background-color: #333;
  height: 45px;
  padding: 10px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.logo {
  color: #fff;
  font-size: 24px;
  text-decoration: none;
  font-weight: bold;
}

.navbar-nav {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

.nav-item {
  display: inline-block;
  margin-right: 10px;
}

.nav-link {
  color: #fff;
  text-decoration: none;
  padding: 15px;
  border-radius: 5px;
}

.nav-link.active {
  background-color: #555;
}

.nav-link:hover {
  background-color: #555;
}

.nav-link:active {
  background-color: #777;
}

.nav-link:focus {
  outline: none;
  background-color: #777;
}

.navbar-right {
  display: flex;
  align-items: center;
}

.search-form {
  margin-right: 10px;
}

.search-form input[type="text"] {
  padding: 5px;
  border-radius: 5px;
  border: none;
}

.search-form button {
  background-color: transparent;
  border: none;
  cursor: pointer;
  color: #fff;
}

.user-actions a {
  color: #fff;
  text-decoration: none;
  padding: 10px;
  border-radius: 5px;
  margin-right: 5px;
}

.user-actions a.login-btn {
  background-color: #555;
}

.user-actions a.signup-btn {
  background-color: #777;
}

.user-actions a:hover,
.user-actions a:active {
  background-color: #999;
}

</style>
</head>
<body>

 <header>
        <h1>Welcome to My Website</h1>
   </header>

<nav>
  <div class="navbar">
    <a href="#" class="logo">YourBusBooking</a>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link active" href="#">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About us</a>
      </li>
 
      <li class="nav-item">
        <a class="nav-link" href="#">Contact Us</a>
      </li>
      
    </ul>
    <div class="navbar-right">
      <form class="search-form">
        <input type="text" placeholder="Search buses">
        <button type="submit"><i class="fas fa-search"></i></button>
      </form>
      <div class="user-actions">
        <a href="#" class="login-btn">Log In</a>
        <a href="#" class="signup-btn">Sign Up</a>
      </div>
    </div>
  </div>
</nav>


 <main>
        <h2><%= pageHeading %></h2>
        
        <p><%= pageContent %></p>
    </main>
    
    <footer>
        &copy; 2023 My Website. All rights reserved.
    </footer>


</body>
</html>