<!DOCTYPE html>
<html>
<head>
  <title>User Dashboard</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  
  <style>
    /* CSS styles for the dashboard */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f1f1f1;
    }
    .sidebar {
      background-color: #333;
      color: #fff;
      width: 200px;
      height: 100vh;
      position: fixed;
      top: 0;
      left: 0;
      padding: 20px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    .sidebar ul {
      list-style-type: none;
      padding: 0;
      margin: 0;
      margin-top: auto;
      padding-bottom: 500px;
    }
    .sidebar li {
      margin-bottom: 10px;
    }
    .sidebar li a {
      color: #fff;
      text-decoration: none;
      display: block;
      padding: 10px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }
    .sidebar li a:hover {
      background-color: #555;
    }
    .user-info {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin-bottom: 20px;
    }
    .user-info img {
      width: 130px;
      height: 130px;
      border-radius: 50%;
      margin-bottom: 10px;
    }
    .user-info span {
      font-weight: bold;
      font-size: 18px;
      cursor: pointer;
      text-decoration: underline;
    }
    .logout-link {
      margin-top: auto;
      color: white;
    }
    .content {
      margin-left: 250px;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
      font-size: 24px;
      margin-bottom: 20px;
    }
    h2 {
      font-size: 20px;
      margin-bottom: 10px;
    }
    p {
      margin-bottom: 10px;
    }
    .user-details p {
      margin-bottom: 5px;
    }
    .user-details.show {
      display: block;
    }
    .user-details {
      display: none;
      margin: 20px auto;
      max-width: 400px;
      padding: 20px;
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
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
    
    /* Added styles and colors for the user profile */
    .user-details h2 {
      font-size: 24px;
      margin-bottom: 20px;
      color: #333;
      text-align: center;
    }
    .user-details label {
      font-weight: bold;
    }
    .user-details input[type="int"],
    .user-details input[type="text"],
    .user-details input[type="double"],
    .user-details input[type="password"],
    .user-details input[type="email"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    .user-details button {
      padding: 10px 20px;
      background-color: #333;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .user-details button:hover {
      background-color: #555;
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
  
   .ticket-details {
      display: none;
      }
      .passenger-details {
      display: none;
      }
  .dropdown:hover .dropdown-menu {
  display: block;
}

.dropdown-menu {
  display: none;
}  
    #ticketDetails{
    width:100%;
    
    }
    
    .popup {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 400px;
  max-width: 90%;
  background-color: #ffffff;
  border: 1px solid #cccccc;
  padding: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  z-index: 9999;
}
.edit-button,
.delete-button {
    font-size: 20px;
    width: 50px;
    height: 50px;
    padding: 0;
    line-height: 1;
}
 #editFormContainer {
        display: none;
        padding: 20px;
        border: 1px solid #ccc;
    }

    #editFormContainer h2 {
        font-size: 18px;
        font-weight: bold;
    }

    #editFormContainer label {
        font-weight: bold;
    }

    #editFormContainer .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    #editFormContainer .form-group label {
        width: 100px;
        margin-right: 10px;
    }

    #editFormContainer .form-group input[type="text"],
    #editFormContainer .form-group input[type="number"],
    #editFormContainer .form-group select {
        font-size: 16px;
        width: 300px; 
    }

    #editFormContainer button[type="submit"] {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="sidebar">
  <div class="user-info">
    <img src="https://tse4.mm.bing.net/th?id=OIP.CUmXK7A3sWtCO2KP_yPztgAAAA&pid=Api&P=0&h=180" alt="User Icon">
    <li><a href="#" onclick="showUserDetails()">Renuka</a></li>
  </div>
  <ul>
  <li><a href="home">Book Ticket</a></li>
    <li><a href="#" onclick="showDashboard()">Dashboard</a></li>
    <li><a href="#" onclick="showPassengers()">Passengers</a></li>
    <li class="dropdown">
      <a href="#" onmouseover="showBookingOptions()">Booking History</a>
      <ul class="dropdown-menu">
        <li><a href="#"  onclick="showPastBooking()">Past Bookings</a></li>
        <li><a href="#" onclick="showfutureBooking()">Future Bookings</a></li>
        <li><a href="#"  onclick="showBooking()">All</a></li>
      </ul>
    </li>
    <li>
      <div class="logout-link">
        <a href="#logout">Logout</a>
      </div> 
    </li>
  </ul>
</div>

  <div class="content" id="content">
    <!-- Your dashboard content goes here -->
    <div style="display: flex; justify-content: space-between; align-items: center;">
      <h1>Welcome to the Avengers BTRS User Dashboard</h1>
    </div>

    <div class="dashboard2" id="dashboard2">
      <h2>Statistics</h2>
      <div class="dashboard" id="dashboard">
        <p><strong>Number of Times Travel:</strong> 5</p>
        <p><strong>Number of Tickets Booked:</strong> 10</p>
        <p><strong>Wallet Amount:</strong> $500</p>
        <!-- Add more <p> tags here as needed -->
      </div>
    </div>

    <div class="user-details" id="userDetails">
     <center><h2>Profile</h2> </center> 
      <form id="userForm"></form>
      <!-- User details will be loaded dynamically here -->
    </div>
    
    <div class="passenger-details" id="passengerDetails">
     <center>
	<table>
  	<thead>
    <tr>
      <th>User ID</th>
      <th>Passenger name</th> 
      <th>Age</th>
      <th>Gender</th>
      <th>Edit</th>
      <th>Delete</th>
    </tr>
  </thead>
  <tbody>
     
    <!-- Add more rows as needed -->
  </tbody>
</table>
	
	</center>
    </div>
    

<div id="editFormContainer">
    <h2 id="formTitle">Passenger Details</h2>
    <form id="editForm">
        <div class="form-group">
            <label for="editUserId">User ID:</label>
            <input type="text" id="editUserId" name="userId" readonly>
        </div>
        <div class="form-group">
            <label for="editName">Name:</label>
            <input type="text" id="editName" name="name">
        </div>
        <div class="form-group">
            <label for="editAge">Age:</label>
            <input type="number" id="editAge" name="age">
        </div>
        <div class="form-group">
            <label for="editGender">Gender:</label>
            <select id="editGender" name="gender">
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <button type="button" onclick="submitPassengerDetails()">Save</button>
    </form>
</div>
<div id="passengerDetails">
    <table>
        <tbody></tbody>
    </table>
</div>
 
 
<div class="ticket-details" id="ticketDetails">
	<center>
	<table>
  	<thead>
    <tr>
      <th>Booking ID</th>
      <th>Payment ID</th> 
      <th>Booking Date</th>
      <th>Payment Mode</th>
      <th>Total Fare</th>
      <th>Status</th>
      <th> No Of seats Booked </th>
    </tr>
  </thead>
  <tbody>
     
    <!-- Add more rows as needed -->
  </tbody>
</table>
	
	</center>
    </div>
    
</div>
 <script type="text/javascript">
  function showDashboard() {
      document.getElementById("dashboard2").style.display = "grid";
      document.getElementById("userDetails").style.display = "none";
      document.getElementById("ticketDetails").style.display = "none";
      document.getElementById("passengerDetails").style.display = "none";
      
  }  
 
  
  function showUserDetails() {
	  $.ajax({
	    url: "UserList", // Replace with the actual URL of your service
	    method: "GET",
	    success: function(response) {
	      var users = JSON.parse(response);
	      var form = document.getElementById("userForm");
	      form.innerHTML = ""; // Clear existing form fields
			console.log("im working...");
	      // Iterate over the users and populate the form
	      for (var i = 0; i < users.length; i++) {
	        var user = users[i];

	        // Create label element
	        var label = document.createElement("label");
	        label.textContent = "User ID: " ;
	        label.style.fontWeight = "bold";
	        label.readOnly=true;
	        form.appendChild(label);
	        var input = document.createElement("input");
	        input.type = "int";
	        input.value = user.user_id;
	        input.disabled = true; // Disable input field
	        input.name = "userId";
	        input.id = 'userId';
	        form.appendChild(input);
	        input.style.width = "200px";
	        form.appendChild(document.createElement("br"));
	        form.appendChild(document.createElement("br"));

	        // Create input element to display user email
	        var label = document.createElement("label");
	        label.textContent = "User Email: ";
	        form.appendChild(label);
	        label.style.fontWeight = "bold";
	        var input = document.createElement("input");
	        input.type = "email";
	        input.value = user.email;
	        input.disabled = true; // Disable input field
	        input.name = "userEmail";
	        input.id = 'userEmail';
	        form.appendChild(input);
	        input.style.width = "200px";
	        form.appendChild(document.createElement("br"));
	        form.appendChild(document.createElement("br"));
	        
	        
	        // Create input element to display user password
	        var label = document.createElement("label");
	        label.textContent = "Password: ";
	        form.appendChild(label);
	        label.style.fontWeight = "bold";
	        var input = document.createElement("input");
	        input.type = "password";
	        input.value = user.password;
	        input.disabled = true; // Disable input field
	        input.name = "password";
	        input.id = 'password';
	        form.appendChild(input);
	        input.style.width = "200px";
	        form.appendChild(document.createElement("br"));
	        form.appendChild(document.createElement("br"));

	        // Create input element to display user name
	        var label = document.createElement("label");
	        label.textContent = "User  Name: ";
	        form.appendChild(label);
	        label.style.fontWeight = "bold";
	        var input = document.createElement("input");
	        input.type = "text";
	        input.value = user.full_name;
	        input.disabled = true; // Disable input field
	        input.name = "userName";
	        input.id = 'userName';
	        form.appendChild(input);
	        input.style.width = "200px";
	        form.appendChild(document.createElement("br"));
	        form.appendChild(document.createElement("br"));

	        // Create input element to display user age
	        var label = document.createElement("label");
	        label.textContent = "Age: ";
	        form.appendChild(label);
	        label.style.fontWeight = "bold";
	        var input = document.createElement("input");
	        input.type = "int";
	        input.value = user.age;
	        input.disabled = true; // Disable input field
	        input.name = "age";
	        input.id = 'age';
	        form.appendChild(input);
	        input.style.width = "200px";
	        form.appendChild(document.createElement("br"));
	        form.appendChild(document.createElement("br"));

	        // Create input element to display user gender
	        var label = document.createElement("label");
	        label.textContent = "Gender: ";
	        form.appendChild(label);
	        label.style.fontWeight = "bold";
	        var input = document.createElement("input");
	        input.type = "text";
	        input.value = user.gender;
	        input.disabled = true; // Disable input field
	        input.name = "gender";
	        input.id = 'gender';
	        form.appendChild(input);
	        input.style.width = "200px";
	        form.appendChild(document.createElement("br"));
	        form.appendChild(document.createElement("br"));

	        // Create input element to display user address
	        var label = document.createElement("label");
	        label.textContent = "cashback: ";
	        form.appendChild(label);
	        label.style.fontWeight = "bold";
	        var input = document.createElement("input");
	        input.type = "double";
	        input.value = user.cashback;
	        input.disabled = true; // Disable input field
	        input.name = "cashback";
	        input.id = 'cashback';
	        form.appendChild(input);
	        input.style.width = "200px";
	        form.appendChild(document.createElement("br"));
	        form.appendChild(document.createElement("br"));
	        
	        
	        // Create input element to display user address
	        var label = document.createElement("label");
	        label.textContent = "wallet: ";
	        form.appendChild(label);
	        label.style.fontWeight = "bold";
	        var input = document.createElement("input");
	        input.type = "double";
	        input.value = user.wallet;
	        input.disabled = true; // Disable input field
	        input.name = "wallet";
	        input.id = 'wallet';
	        form.appendChild(input);
	        input.style.width = "200px";
	        form.appendChild(document.createElement("br"));
	        form.appendChild(document.createElement("br"));
	       

	        // Create Edit button
	        var editButton = document.createElement("button");
	        editButton.textContent = "Edit";
	        editButton.addEventListener("click", function() {
	          enableEdit(form, user.user_id);

	        });
	        form.appendChild(editButton);
	        form.appendChild(document.createTextNode("    "));
	       
	        //create save button
	        
	        var saveButton = document.createElement("input");
	        saveButton.type = "submit";
	        saveButton.textContent = "Save";
	        saveButton.id = 'Save';
	        saveButton.addEventListener("click", function() {
		          savedata(form, user.user_id);

		        });
	       
	        form.appendChild(saveButton);
	        
	        
	      }
	    },
	    error: function(xhr, status, error) {
	      console.error("AJAX request failed: " + status + ", " + error);
	    }
	  });

	  document.getElementById("dashboard2").style.display = "none";
	  document.getElementById("userDetails").style.display = "block";
	    document.getElementById("ticketDetails").style.display = "none";
	      document.getElementById("passengerDetails").style.display = "none";

	}

  var userId; // Declare a variable to store the user ID

  function enableEdit(form, id) {
    // Store the user ID
    userId = id;
    console.log(userId);
    

    // Enable all input fields in the form
    var inputs = form.getElementsByTagName("input");
    for (var i = 3; i < inputs.length; i++) {
      inputs[i].disabled = false;
    }
  }
  
  function savedata(form, id1){
	  $("#userForm").submit(function(event) {
		  
		  event.preventDefault();
		  var id= $("#userId").val();
		  var user = $("#userEmail").val();
		  var password= $("#password").val();
          var name = $("#userName").val();
          var age = $("#age").val();
          var gender = $("#gender").val();
          var cashback = $("#cashback").val();
          var wallet = $("#wallet").val();
          
          var user={
        		  "user_id": id,
                  "email": user,
                  "password": password,
                  "full_name": name,
                  "age": age,
                  "gender": gender,
                  "cashback": cashback,
                  "wallet":wallet
          };
          
		  var data=JSON.stringify(user);
		  
		  console.log(data); 
          $.ajax({
              type: "POST",
              url: "updateUser",
              data:data,  //{user_id:id,user_email:user,user_name:name,dob:dob,mobile:mobile,address:address,passwords:passwords},
              contentType: "application/json",
              success: function(response) {
                  // Handle success response
                  alert(data);
                  console.log(user);
                  console.log("Employee updated successfully!");
                  // Redirect to employee details page or show a success message
              },
              error: function(xhr, status, error) {
                  // Handle error response
                  console.log(user);
                  console.log("Error updating employee: " + error);
                  // Show an error message or handle the error case
              }
          });
	  });
  }
  
 function showBooking(){
 	$.ajax({
         url: "ticketList", // Replace with the actual URL of your service
         method: "GET",
         success: function(response) {
             var tickets = JSON.parse(response);
             var tableBody = document.querySelector("#ticketDetails table tbody");
             tableBody.innerHTML = ""; // Clear existing table rows
             
             // Iterate over the services and populate the table
             for (var i = 0; i < tickets.length; i++) {
                 var ticket = tickets[i];
                 var row = document.createElement("tr");

                 var bookingIdCell = document.createElement("td");
                 bookingIdCell.textContent = ticket.booking_id;
                 row.appendChild(bookingIdCell);
                 
                 var paymentIdCell = document.createElement("td");
                 paymentIdCell.textContent = ticket.payment_id;
                 row.appendChild(paymentIdCell);
                 
          
                 
                 var bookingdateCell = document.createElement("td");
                 var bookingDate = new Date(ticket.booking_date);
                 bookingdateCell.textContent = bookingDate.toLocaleDateString();
                 row.appendChild(bookingdateCell);
                 
                

                 var paymentModeCell = document.createElement("td");
                 paymentModeCell.textContent = ticket.payment_mode;
                 row.appendChild(paymentModeCell);
                 
                 
                 var totalfareCell = document.createElement("td");
                 totalfareCell.textContent = ticket.total_fare;
                 row.appendChild(totalfareCell);
                 
                 var statusCell = document.createElement("td");
                 statusCell.textContent = ticket.status;
                 row.appendChild(statusCell);
                 
                 
                 var noofseatsbokkedCell = document.createElement("td");
                 noofseatsbokkedCell.textContent = ticket.no_of_seats_booked;
                 row.appendChild(noofseatsbokkedCell);
                 
                 var previewCell = document.createElement("td");
                 var previewButton = document.createElement("button");
                 previewButton.textContent = "Preview";
                 previewButton.addEventListener("click", createPopup.bind(null, ticket));
                 previewCell.appendChild(previewButton);
                 row.appendChild(previewCell);

                 
                 tableBody.appendChild(row);
             }
         },
         error: function(xhr, status, error) {
             console.error("AJAX request failed: " + status + ", " + error);
         }
     });
 	
 	function createPopup(ticket) {
 		  var popup = document.createElement("div");
 		  popup.id = "popup";
 		  popup.classList.add("popup");

 		  var popupContent = document.createElement("div");
 		  popupContent.classList.add("popup-content");

 		  // Populate the popup with the row data
 		  var bookingIdLabel = document.createElement("span");
 		  bookingIdLabel.textContent = "Booking ID:";
 		  bookingIdLabel.style.fontWeight = "bold";
 		  var bookingIdValue = document.createElement("span");
 		  bookingIdValue.textContent = ticket.booking_id;
 		 bookingIdValue.style.fontStyle = "italic";
 		  bookingIdValue.style.color = "blue";

 		  popupContent.appendChild(bookingIdLabel);
 		  popupContent.appendChild(bookingIdValue);
 		  popupContent.appendChild(document.createElement("br"));
 		  popupContent.appendChild(document.createElement("br"));

 		  // Add more labels and values for other data fields in a similar manner
 		  
 		  var paymentIdLabel = document.createElement("span");
 		  paymentIdLabel.textContent = "Payment ID:";
 		 paymentIdLabel.style.fontWeight = "bold";
 		  var paymentIdvalue = document.createElement("span");
 		  paymentIdvalue.textContent = ticket.payment_id;
 		paymentIdvalue.style.fontStyle = "italic";
 		paymentIdvalue.style.color = "blue";

 		  popupContent.appendChild(paymentIdLabel);
 		  popupContent.appendChild(paymentIdvalue);
 		  popupContent.appendChild(document.createElement("br"));
 		  popupContent.appendChild(document.createElement("br"));

 		  
 		  var UserIdLabel = document.createElement("span");
 		  UserIdLabel.textContent = "User ID:";
 		 UserIdLabel.style.fontWeight = "bold";
		  var userIdValue = document.createElement("span");
		  userIdValue.textContent = ticket.user_id;
		  userIdValue.style.color = "blue";
		  userIdValue.style.fontStyle = "italic";

		  popupContent.appendChild(UserIdLabel);
		  popupContent.appendChild(userIdValue);
		  popupContent.appendChild(document.createElement("br"));
		  popupContent.appendChild(document.createElement("br"));

		  
		  var bookingdateLabel = document.createElement("span");
		  bookingdateLabel.textContent = "Booking Date:";
		  bookingdateLabel.style.fontWeight = "bold";
		  var bookingdatevalue = document.createElement("span");
		  bookingdatevalue.textContent = ticket.booking_date;
		  bookingdatevalue.style.color = "blue";
		  bookingdatevalue.style.fontStyle = "italic";

		  popupContent.appendChild(bookingdateLabel);
		  popupContent.appendChild(bookingdatevalue);
		  popupContent.appendChild(document.createElement("br"));
		  popupContent.appendChild(document.createElement("br"));

		  var routeIdLabel = document.createElement("span");
		  routeIdLabel.textContent = "Route ID:";
		  routeIdLabel.style.fontWeight = "bold";
		  var routeIdValue = document.createElement("span");
		  routeIdValue.textContent = ticket.route_id;
		  routeIdValue.style.color = "blue";
		  routeIdValue.style.fontStyle = "italic";

		  popupContent.appendChild(routeIdLabel);
		  popupContent.appendChild(routeIdValue);
		  popupContent.appendChild(document.createElement("br"));
		  popupContent.appendChild(document.createElement("br"));

			  
		  var tripIdLabel = document.createElement("span");
		  tripIdLabel.textContent = "Trip Id:";
		  tripIdLabel.style.fontWeight = "bold";
		  var tripidvalue = document.createElement("span");
		  tripidvalue.textContent = ticket.trip_id;
		  tripidvalue.style.color = "blue";
		  tripidvalue.style.fontStyle = "italic";

		  popupContent.appendChild(tripIdLabel);
		  popupContent.appendChild(tripidvalue);
		  popupContent.appendChild(document.createElement("br"));
		  popupContent.appendChild(document.createElement("br"));
			  
		  var srviceIdLabel = document.createElement("span");
		  srviceIdLabel.textContent = "Service ID:";
		  srviceIdLabel.style.fontWeight = "bold";
		  var serviceIdValue = document.createElement("span");
		  serviceIdValue.textContent = ticket.service_id;
		  serviceIdValue.style.color = "blue";
		  serviceIdValue.style.fontStyle = "italic";

		 popupContent.appendChild(srviceIdLabel);
		 popupContent.appendChild(serviceIdValue);
  		  popupContent.appendChild(document.createElement("br"));
		  popupContent.appendChild(document.createElement("br"));

				  
		 var paymentLabel = document.createElement("span");
		 paymentLabel.textContent = "Payment Mode:";
		 paymentLabel.style.fontWeight = "bold";
    	  var paymentvalue = document.createElement("span");
    	  paymentvalue.textContent = ticket.payment_mode;
    	  
    	  paymentvalue.style.color = "blue";
    	  paymentvalue.style.fontStyle = "italic";
    	  
	      popupContent.appendChild(paymentLabel);
     	  popupContent.appendChild(paymentvalue);
		  popupContent.appendChild(document.createElement("br"));
		  popupContent.appendChild(document.createElement("br"));
			  
		  
		  var totalfLabel = document.createElement("span");
		  totalfLabel.textContent = "Total Fare :";
		  totalfLabel.style.fontWeight = "bold";
		  var totalfValue = document.createElement("span");
		  totalfValue.textContent = ticket.total_fare;
		  totalfValue.style.color = "blue";
		  totalfValue.style.fontStyle = "italic";

		 popupContent.appendChild(totalfLabel);
		 popupContent.appendChild(totalfValue);
  		  popupContent.appendChild(document.createElement("br"));
		  popupContent.appendChild(document.createElement("br"));

				  
		 var statusLabel = document.createElement("span");
		 statusLabel.textContent = "Status:";
		 statusLabel.style.fontWeight = "bold";
    	  var statusvalue = document.createElement("span");
    	  statusvalue.textContent = ticket.status;
    	  statusvalue.style.color = "blue";
    	  statusvalue.style.fontStyle = "italic";
    	  
	      popupContent.appendChild(statusLabel);
     	  popupContent.appendChild(statusvalue);
		  popupContent.appendChild(document.createElement("br"));
		  popupContent.appendChild(document.createElement("br"));
		  
		  var noofseatsLabel = document.createElement("span");
		  noofseatsLabel.textContent = "No Of Seats Booked:";
		  noofseatsLabel.style.fontWeight = "bold";
	    	  var noofseatsvalue = document.createElement("span");
	    	  noofseatsvalue.textContent = ticket.no_of_seats_booked;
	    	  noofseatsvalue.style.color = "blue";
	    	  noofseatsvalue.style.fontStyle = "italic";
	    	  
		      popupContent.appendChild(noofseatsLabel);
	     	  popupContent.appendChild(noofseatsvalue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));
			  
			  var backButton = document.createElement("button");
			  backButton.textContent = "Back";
			  backButton.classList.add("popup-button"); // Add a CSS class for the button

			  backButton.addEventListener("click", function() {
			    popup.classList.remove("show-popup"); // Remove the animation class
			    setTimeout(function() {
			      popup.remove(); // Remove the popup after the animation finishes
			    }, 500);
			  });
			  
			  popupContent.appendChild(backButton);
 		  popup.appendChild(popupContent);

 		  document.body.appendChild(popup);

 		  // Add event listener to hide the popup on click
 		 setTimeout(function() {
 		    popup.classList.add("show-popup"); // Add the animation class after a delay
 		  }, 100);
 		 
 		}
 	

 	document.getElementById("dashboard2").style.display = "none";
    document.getElementById("userDetails").style.display = "none";
   document.getElementById("ticketDetails").style.display = "block";	
   document.getElementById("passengerDetails").style.display = "none";

 }
 
 
 
 
 function showfutureBooking(){
	 	$.ajax({
	         url: "futureticketList", // Replace with the actual URL of your service
	         method: "GET",
	         success: function(response) {
	             var tickets = JSON.parse(response);
	             var tableBody = document.querySelector("#ticketDetails table tbody");
	             tableBody.innerHTML = ""; // Clear existing table rows
	             
	             // Iterate over the services and populate the table
	             for (var i = 0; i < tickets.length; i++) {
	                 var ticket = tickets[i];
	                 var row = document.createElement("tr");

	                 var bookingIdCell = document.createElement("td");
	                 bookingIdCell.textContent = ticket.booking_id;
	                 row.appendChild(bookingIdCell);
	                 
	                 var paymentIdCell = document.createElement("td");
	                 paymentIdCell.textContent = ticket.payment_id;
	                 row.appendChild(paymentIdCell);
	                 
	          
	                 
	                 var bookingdateCell = document.createElement("td");
	                 var bookingDate = new Date(ticket.booking_date);
	                 bookingdateCell.textContent = bookingDate.toLocaleDateString();
	                 row.appendChild(bookingdateCell);
	                 
	                

	                 var paymentModeCell = document.createElement("td");
	                 paymentModeCell.textContent = ticket.payment_mode;
	                 row.appendChild(paymentModeCell);
	                 
	                 
	                 var totalfareCell = document.createElement("td");
	                 totalfareCell.textContent = ticket.total_fare;
	                 row.appendChild(totalfareCell);
	                 
	                 var statusCell = document.createElement("td");
	                 statusCell.textContent = ticket.status;
	                 row.appendChild(statusCell);
	                 
	                 
	                 var noofseatsbokkedCell = document.createElement("td");
	                 noofseatsbokkedCell.textContent = ticket.no_of_seats_booked;
	                 row.appendChild(noofseatsbokkedCell);
	                 
	                 var previewCell = document.createElement("td");
	                 var previewButton = document.createElement("button");
	                 previewButton.textContent = "Preview";
	                 previewButton.addEventListener("click", createPopup.bind(null, ticket));
	                 previewCell.appendChild(previewButton);
	                 row.appendChild(previewCell);
	                 
	              // Create cancel button
	                 var cancelButton = document.createElement("button");
	                 cancelButton.textContent = "Cancel Ticket";
	                 cancelButton.onclick = function() {
	                   cancelTicket(ticket); // Pass the ticket object to the cancelTicket function
	                 };
	                 cancelButton.style.backgroundColor = "green"; // Apply green color
	                 cancelButton.style.color = "white";
	                 var cancelButtonCell = document.createElement("td");
	                 cancelButtonCell.appendChild(cancelButton);
	                 row.appendChild(cancelButtonCell);
	                 tableBody.appendChild(row);
	             }
	         },
	         error: function(xhr, status, error) {
	             console.error("AJAX request failed: " + status + ", " + error);
	         }
	     });
	 	function cancelTicket(ticket) {
	 		  // Logic to cancel the ticket goes here
	 		  // You can perform an AJAX call or update the ticket status in your system
	 		  alert("Ticket cancelled:", ticket.booking_id);
	 		  console.log("Ticket cancelled:", ticket.booking_id);
	 		}
	 	function createPopup(ticket) {
	 		  var popup = document.createElement("div");
	 		  popup.id = "popup";
	 		  popup.classList.add("popup");

	 		  var popupContent = document.createElement("div");
	 		  popupContent.classList.add("popup-content");

	 		  // Populate the popup with the row data
	 		  var bookingIdLabel = document.createElement("span");
	 		  bookingIdLabel.textContent = "Booking ID:";
	 		  bookingIdLabel.style.fontWeight = "bold";
	 		  var bookingIdValue = document.createElement("span");
	 		  bookingIdValue.textContent = ticket.booking_id;
	 		 bookingIdValue.style.fontStyle = "italic";
	 		  bookingIdValue.style.color = "blue";

	 		  popupContent.appendChild(bookingIdLabel);
	 		  popupContent.appendChild(bookingIdValue);
	 		  popupContent.appendChild(document.createElement("br"));
	 		  popupContent.appendChild(document.createElement("br"));

	 		  // Add more labels and values for other data fields in a similar manner
	 		  
	 		  var paymentIdLabel = document.createElement("span");
	 		  paymentIdLabel.textContent = "Payment ID:";
	 		 paymentIdLabel.style.fontWeight = "bold";
	 		  var paymentIdvalue = document.createElement("span");
	 		  paymentIdvalue.textContent = ticket.payment_id;
	 		paymentIdvalue.style.fontStyle = "italic";
	 		paymentIdvalue.style.color = "blue";

	 		  popupContent.appendChild(paymentIdLabel);
	 		  popupContent.appendChild(paymentIdvalue);
	 		  popupContent.appendChild(document.createElement("br"));
	 		  popupContent.appendChild(document.createElement("br"));

	 		  
	 		  var UserIdLabel = document.createElement("span");
	 		  UserIdLabel.textContent = "User ID:";
	 		 UserIdLabel.style.fontWeight = "bold";
			  var userIdValue = document.createElement("span");
			  userIdValue.textContent = ticket.user_id;
			  userIdValue.style.color = "blue";
			  userIdValue.style.fontStyle = "italic";

			  popupContent.appendChild(UserIdLabel);
			  popupContent.appendChild(userIdValue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));

			  
			  var bookingdateLabel = document.createElement("span");
			  bookingdateLabel.textContent = "Booking Date:";
			  bookingdateLabel.style.fontWeight = "bold";
			  var bookingdatevalue = document.createElement("span");
			  bookingdatevalue.textContent = ticket.booking_date;
			  bookingdatevalue.style.color = "blue";
			  bookingdatevalue.style.fontStyle = "italic";

			  popupContent.appendChild(bookingdateLabel);
			  popupContent.appendChild(bookingdatevalue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));

			  var routeIdLabel = document.createElement("span");
			  routeIdLabel.textContent = "Route ID:";
			  routeIdLabel.style.fontWeight = "bold";
			  var routeIdValue = document.createElement("span");
			  routeIdValue.textContent = ticket.route_id;
			  routeIdValue.style.color = "blue";
			  routeIdValue.style.fontStyle = "italic";

			  popupContent.appendChild(routeIdLabel);
			  popupContent.appendChild(routeIdValue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));

				  
			  var tripIdLabel = document.createElement("span");
			  tripIdLabel.textContent = "Trip Id:";
			  tripIdLabel.style.fontWeight = "bold";
			  var tripidvalue = document.createElement("span");
			  tripidvalue.textContent = ticket.trip_id;
			  tripidvalue.style.color = "blue";
			  tripidvalue.style.fontStyle = "italic";

			  popupContent.appendChild(tripIdLabel);
			  popupContent.appendChild(tripidvalue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));
				  
			  var srviceIdLabel = document.createElement("span");
			  srviceIdLabel.textContent = "Service ID:";
			  srviceIdLabel.style.fontWeight = "bold";
			  var serviceIdValue = document.createElement("span");
			  serviceIdValue.textContent = ticket.service_id;
			  serviceIdValue.style.color = "blue";
			  serviceIdValue.style.fontStyle = "italic";

			 popupContent.appendChild(srviceIdLabel);
			 popupContent.appendChild(serviceIdValue);
	  		  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));

					  
			 var paymentLabel = document.createElement("span");
			 paymentLabel.textContent = "Payment Mode:";
			 paymentLabel.style.fontWeight = "bold";
	    	  var paymentvalue = document.createElement("span");
	    	  paymentvalue.textContent = ticket.payment_mode;
	    	  
	    	  paymentvalue.style.color = "blue";
	    	  paymentvalue.style.fontStyle = "italic";
	    	  
		      popupContent.appendChild(paymentLabel);
	     	  popupContent.appendChild(paymentvalue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));
				  
			  
			  var totalfLabel = document.createElement("span");
			  totalfLabel.textContent = "Total Fare :";
			  totalfLabel.style.fontWeight = "bold";
			  var totalfValue = document.createElement("span");
			  totalfValue.textContent = ticket.total_fare;
			  totalfValue.style.color = "blue";
			  totalfValue.style.fontStyle = "italic";

			 popupContent.appendChild(totalfLabel);
			 popupContent.appendChild(totalfValue);
	  		  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));

					  
			 var statusLabel = document.createElement("span");
			 statusLabel.textContent = "Status:";
			 statusLabel.style.fontWeight = "bold";
	    	  var statusvalue = document.createElement("span");
	    	  statusvalue.textContent = ticket.status;
	    	  statusvalue.style.color = "blue";
	    	  statusvalue.style.fontStyle = "italic";
	    	  
		      popupContent.appendChild(statusLabel);
	     	  popupContent.appendChild(statusvalue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));
			  
			  var noofseatsLabel = document.createElement("span");
			  noofseatsLabel.textContent = "No Of Seats Booked:";
			  noofseatsLabel.style.fontWeight = "bold";
		    	  var noofseatsvalue = document.createElement("span");
		    	  noofseatsvalue.textContent = ticket.no_of_seats_booked;
		    	  noofseatsvalue.style.color = "blue";
		    	  noofseatsvalue.style.fontStyle = "italic";
		    	  
			      popupContent.appendChild(noofseatsLabel);
		     	  popupContent.appendChild(noofseatsvalue);
				  popupContent.appendChild(document.createElement("br"));
				  popupContent.appendChild(document.createElement("br"));
				  
				  var backButton = document.createElement("button");
				  backButton.textContent = "Back";
				  backButton.classList.add("popup-button"); // Add a CSS class for the button

				  backButton.addEventListener("click", function() {
				    popup.classList.remove("show-popup"); // Remove the animation class
				    setTimeout(function() {
				      popup.remove(); // Remove the popup after the animation finishes
				    }, 500);
				  });
				  
				  popupContent.appendChild(backButton);
	 		  popup.appendChild(popupContent);

	 		  document.body.appendChild(popup);

	 		  // Add event listener to hide the popup on click
	 		 setTimeout(function() {
	 		    popup.classList.add("show-popup"); // Add the animation class after a delay
	 		  }, 100);
	 		 
	 		}
	 	

	 	document.getElementById("dashboard2").style.display = "none";
	    document.getElementById("userDetails").style.display = "none";
	   document.getElementById("ticketDetails").style.display = "block";	
	   document.getElementById("passengerDetails").style.display = "none";

	 }
	 
 
 
 function showPastBooking(){
	 	$.ajax({
	         url: "pastticketList", // Replace with the actual URL of your service
	         method: "GET",
	         success: function(response) {
	             var tickets = JSON.parse(response);
	             var tableBody = document.querySelector("#ticketDetails table tbody");
	             tableBody.innerHTML = ""; // Clear existing table rows
	             
	             // Iterate over the services and populate the table
	             for (var i = 0; i < tickets.length; i++) {
	                 var ticket = tickets[i];
	                 var row = document.createElement("tr");

	                 var bookingIdCell = document.createElement("td");
	                 bookingIdCell.textContent = ticket.booking_id;
	                 row.appendChild(bookingIdCell);
	                 
	                 var paymentIdCell = document.createElement("td");
	                 paymentIdCell.textContent = ticket.payment_id;
	                 row.appendChild(paymentIdCell);
	                 
	          
	                 
	                 var bookingdateCell = document.createElement("td");
	                 var bookingDate = new Date(ticket.booking_date);
	                 bookingdateCell.textContent = bookingDate.toLocaleDateString();
	                 row.appendChild(bookingdateCell);
	                 
	                

	                 var paymentModeCell = document.createElement("td");
	                 paymentModeCell.textContent = ticket.payment_mode;
	                 row.appendChild(paymentModeCell);
	                 
	                 
	                 var totalfareCell = document.createElement("td");
	                 totalfareCell.textContent = ticket.total_fare;
	                 row.appendChild(totalfareCell);
	                 
	                 var statusCell = document.createElement("td");
	                 statusCell.textContent = ticket.status;
	                 row.appendChild(statusCell);
	                 
	                 
	                 var noofseatsbokkedCell = document.createElement("td");
	                 noofseatsbokkedCell.textContent = ticket.no_of_seats_booked;
	                 row.appendChild(noofseatsbokkedCell);
	                 
	                 var previewCell = document.createElement("td");
	                 var previewButton = document.createElement("button");
	                 previewButton.textContent = "Preview";
	                 previewButton.addEventListener("click", createPopup.bind(null, ticket));
	                 previewCell.appendChild(previewButton);
	                 row.appendChild(previewCell);

	                 
	                 tableBody.appendChild(row);
	             }
	         },
	         error: function(xhr, status, error) {
	             console.error("AJAX request failed: " + status + ", " + error);
	         }
	     });
	 	
	 	function createPopup(ticket) {
	 		  var popup = document.createElement("div");
	 		  popup.id = "popup";
	 		  popup.classList.add("popup");

	 		  var popupContent = document.createElement("div");
	 		  popupContent.classList.add("popup-content");

	 		  // Populate the popup with the row data
	 		  var bookingIdLabel = document.createElement("span");
	 		  bookingIdLabel.textContent = "Booking ID:";
	 		  bookingIdLabel.style.fontWeight = "bold";
	 		  var bookingIdValue = document.createElement("span");
	 		  bookingIdValue.textContent = ticket.booking_id;
	 		 bookingIdValue.style.fontStyle = "italic";
	 		  bookingIdValue.style.color = "blue";

	 		  popupContent.appendChild(bookingIdLabel);
	 		  popupContent.appendChild(bookingIdValue);
	 		  popupContent.appendChild(document.createElement("br"));
	 		  popupContent.appendChild(document.createElement("br"));

	 		  // Add more labels and values for other data fields in a similar manner
	 		  
	 		  var paymentIdLabel = document.createElement("span");
	 		  paymentIdLabel.textContent = "Payment ID:";
	 		 paymentIdLabel.style.fontWeight = "bold";
	 		  var paymentIdvalue = document.createElement("span");
	 		  paymentIdvalue.textContent = ticket.payment_id;
	 		paymentIdvalue.style.fontStyle = "italic";
	 		paymentIdvalue.style.color = "blue";

	 		  popupContent.appendChild(paymentIdLabel);
	 		  popupContent.appendChild(paymentIdvalue);
	 		  popupContent.appendChild(document.createElement("br"));
	 		  popupContent.appendChild(document.createElement("br"));

	 		  
	 		  var UserIdLabel = document.createElement("span");
	 		  UserIdLabel.textContent = "User ID:";
	 		 UserIdLabel.style.fontWeight = "bold";
			  var userIdValue = document.createElement("span");
			  userIdValue.textContent = ticket.user_id;
			  userIdValue.style.color = "blue";
			  userIdValue.style.fontStyle = "italic";

			  popupContent.appendChild(UserIdLabel);
			  popupContent.appendChild(userIdValue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));

			  
			  var bookingdateLabel = document.createElement("span");
			  bookingdateLabel.textContent = "Booking Date:";
			  bookingdateLabel.style.fontWeight = "bold";
			  var bookingdatevalue = document.createElement("span");
			  bookingdatevalue.textContent = ticket.booking_date;
			  bookingdatevalue.style.color = "blue";
			  bookingdatevalue.style.fontStyle = "italic";

			  popupContent.appendChild(bookingdateLabel);
			  popupContent.appendChild(bookingdatevalue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));

			  var routeIdLabel = document.createElement("span");
			  routeIdLabel.textContent = "Route ID:";
			  routeIdLabel.style.fontWeight = "bold";
			  var routeIdValue = document.createElement("span");
			  routeIdValue.textContent = ticket.route_id;
			  routeIdValue.style.color = "blue";
			  routeIdValue.style.fontStyle = "italic";

			  popupContent.appendChild(routeIdLabel);
			  popupContent.appendChild(routeIdValue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));

				  
			  var tripIdLabel = document.createElement("span");
			  tripIdLabel.textContent = "Trip Id:";
			  tripIdLabel.style.fontWeight = "bold";
			  var tripidvalue = document.createElement("span");
			  tripidvalue.textContent = ticket.trip_id;
			  tripidvalue.style.color = "blue";
			  tripidvalue.style.fontStyle = "italic";

			  popupContent.appendChild(tripIdLabel);
			  popupContent.appendChild(tripidvalue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));
				  
			  var srviceIdLabel = document.createElement("span");
			  srviceIdLabel.textContent = "Service ID:";
			  srviceIdLabel.style.fontWeight = "bold";
			  var serviceIdValue = document.createElement("span");
			  serviceIdValue.textContent = ticket.service_id;
			  serviceIdValue.style.color = "blue";
			  serviceIdValue.style.fontStyle = "italic";

			 popupContent.appendChild(srviceIdLabel);
			 popupContent.appendChild(serviceIdValue);
	  		  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));

					  
			 var paymentLabel = document.createElement("span");
			 paymentLabel.textContent = "Payment Mode:";
			 paymentLabel.style.fontWeight = "bold";
	    	  var paymentvalue = document.createElement("span");
	    	  paymentvalue.textContent = ticket.payment_mode;
	    	  
	    	  paymentvalue.style.color = "blue";
	    	  paymentvalue.style.fontStyle = "italic";
	    	  
		      popupContent.appendChild(paymentLabel);
	     	  popupContent.appendChild(paymentvalue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));
				  
			  
			  var totalfLabel = document.createElement("span");
			  totalfLabel.textContent = "Total Fare :";
			  totalfLabel.style.fontWeight = "bold";
			  var totalfValue = document.createElement("span");
			  totalfValue.textContent = ticket.total_fare;
			  totalfValue.style.color = "blue";
			  totalfValue.style.fontStyle = "italic";

			 popupContent.appendChild(totalfLabel);
			 popupContent.appendChild(totalfValue);
	  		  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));

					  
			 var statusLabel = document.createElement("span");
			 statusLabel.textContent = "Status:";
			 statusLabel.style.fontWeight = "bold";
	    	  var statusvalue = document.createElement("span");
	    	  statusvalue.textContent = ticket.status;
	    	  statusvalue.style.color = "blue";
	    	  statusvalue.style.fontStyle = "italic";
	    	  
		      popupContent.appendChild(statusLabel);
	     	  popupContent.appendChild(statusvalue);
			  popupContent.appendChild(document.createElement("br"));
			  popupContent.appendChild(document.createElement("br"));
			  
			  var noofseatsLabel = document.createElement("span");
			  noofseatsLabel.textContent = "No Of Seats Booked:";
			  noofseatsLabel.style.fontWeight = "bold";
		    	  var noofseatsvalue = document.createElement("span");
		    	  noofseatsvalue.textContent = ticket.no_of_seats_booked;
		    	  noofseatsvalue.style.color = "blue";
		    	  noofseatsvalue.style.fontStyle = "italic";
		    	  
			      popupContent.appendChild(noofseatsLabel);
		     	  popupContent.appendChild(noofseatsvalue);
				  popupContent.appendChild(document.createElement("br"));
				  popupContent.appendChild(document.createElement("br"));
				  
				  var backButton = document.createElement("button");
				  backButton.textContent = "Back";
				  backButton.classList.add("popup-button"); // Add a CSS class for the button

				  backButton.addEventListener("click", function() {
				    popup.classList.remove("show-popup"); // Remove the animation class
				    setTimeout(function() {
				      popup.remove(); // Remove the popup after the animation finishes
				    }, 500);
				  });
				  
				  popupContent.appendChild(backButton);
	 		  popup.appendChild(popupContent);

	 		  document.body.appendChild(popup);

	 		  // Add event listener to hide the popup on click
	 		 setTimeout(function() {
	 		    popup.classList.add("show-popup"); // Add the animation class after a delay
	 		  }, 100);
	 		 
	 		}
	 	

	 	document.getElementById("dashboard2").style.display = "none";
	    document.getElementById("userDetails").style.display = "none";
	   document.getElementById("ticketDetails").style.display = "block";	
	   document.getElementById("passengerDetails").style.display = "none";

	 }
	 
	 
	 
 function showPassengers() {
	    $.ajax({
	        url: "passengersList", // Replace with the actual URL of your service
	        method: "GET",
	        success: function(response) {
	            var passengers = JSON.parse(response);
	            var tableBody = document.querySelector("#passengerDetails table tbody");
	            tableBody.innerHTML = ""; // Clear existing table rows

	            // Iterate over the passengers and populate the table
	            for (var i = 0; i < passengers.length; i++) {
	                var passenger = passengers[i];
	                var row = document.createElement("tr");

	                var userIdCell = document.createElement("td");
	                userIdCell.textContent = passenger.user_id;
	                row.appendChild(userIdCell);

	                var nameCell = document.createElement("td");
	                nameCell.textContent = passenger.passenger_name;
	                row.appendChild(nameCell);

	                var ageCell = document.createElement("td");
	                ageCell.textContent = passenger.age;
	                row.appendChild(ageCell);

	                var genderCell = document.createElement("td");
	                genderCell.textContent = passenger.gender;
	                row.appendChild(genderCell);

	                var actionCell = document.createElement("td");

	                var editButton = document.createElement("button");
	                editButton.innerHTML = '<i class="fas fa-edit"></i>';
	                editButton.addEventListener("click", function() {
	                	var selectedRow = this.parentNode.parentNode;
	                    var userId = selectedRow.cells[0].textContent;
	                    var name = selectedRow.cells[1].textContent;
	                    var age = selectedRow.cells[2].textContent;
	                    var gender = selectedRow.cells[3].textContent;

	                    // Populate the edit form fields with values
	                    document.getElementById("editUserId").value = userId;
	                    document.getElementById("editName").value = name;
	                    document.getElementById("editAge").value = age;
	                    document.getElementById("editGender").value = gender;

	                    // Display the edit form
	                    document.getElementById("editFormContainer").style.display = "block";
	                    document.getElementById("formTitle").textContent = "Edit Passenger";
	                    editMode = true;
	                });
	                actionCell.appendChild(editButton);
	                
	                var actionCell2 = document.createElement("td");
	                var deleteButton = document.createElement("button");
	                deleteButton.innerHTML = '<i class="fas fa-trash"></i>';
	                deleteButton.addEventListener("click", function() {
	                	 var selectedRow = this.parentNode.parentNode;
	                	    var userId = selectedRow.cells[0].textContent;
	                	    var name = selectedRow.cells[1].textContent;
	                	    var age = selectedRow.cells[2].textContent;
	                	    var gender = selectedRow.cells[3].textContent;

	                    // Call the controller method to delete the passenger
	                    deletePassenger(userId,name,age,gender);
	                });
	                actionCell2.appendChild(deleteButton);

	                row.appendChild(actionCell);
	                row.appendChild(actionCell2);


	                tableBody.appendChild(row);
	                
	            }
	            
	            var addButtonRow = document.createElement("tr");
	            var addButtonCell = document.createElement("td");
	            addButtonCell.colSpan = 6; // Span the cell across all columns
	            addButtonCell.style.textAlign = "center"; // Align the button in the center
	            var addButton = document.createElement("button");
	            addButton.textContent = "Add Passengers";
	            addButton.addEventListener("click", function() {
	            	

	            	    resetForm();

	            	    // Display the add passengers form
	            	    document.getElementById("editUserId").value = "";
	                document.getElementById("editFormContainer").style.display = "block";
	                document.getElementById("formTitle").textContent = "Add Passenger";
	                editMode = false;
	            	// Perform action when "Add Passengers" button is clicked
	            });
	            addButtonCell.appendChild(addButton);
	            addButtonRow.appendChild(addButtonCell);

	            // Insert the button row in the middle of the table
	            var rows = tableBody.getElementsByTagName("tr");
	            var middleIndex = Math.floor(rows.length);
	            tableBody.insertBefore(addButtonRow, rows[middleIndex]);
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX request failed: " + status + ", " + error);
	        }
	    });

	    document.getElementById("dashboard2").style.display = "none";
	    document.getElementById("userDetails").style.display = "none";
	    document.getElementById("ticketDetails").style.display = "none";
	    document.getElementById("passengerDetails").style.display = "block";
	}
 
 function deletePassenger(userId, name, age, gender) {
	 
	 var passenger={
      		  "user_id": userId,
                "passenger_name": name,
                "age": age,
                "gender": gender            
        };    
	  var data=JSON.stringify(passenger);
	  console.log(passenger);  
	    $.ajax({
	        url: "deletePassenger", // Replace with the actual URL of your controller method
	        method: "POST",
	        data:data,// Pass the values to the controller method
	        contentType: "application/json",
	        success: function(response) {
	            // Handle the success response
	            alert("passenger deleteed successfully");
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX request failed: " + status + ", " + error);
	        }
	    });
	}

 
 
 function savePassengersDetails(){
	  $("#editForm").submit(function(event) {
		 
		 // event.preventDefault();
		  var id= $("#editUserId").val();
         var name = $("#editName").val();
         var age = $("#editAge").val();
         var gender = $("#editGender").val();
         
         var passenger={
       		  "user_id": id,
                 "passenger_name": name,
                 "age": age,
                 "gender": gender            
         };     
		  var data=JSON.stringify(passenger);
		  console.log(data); 
         $.ajax({
             type: "POST",
             url: "editPassengersDetails",
             data:data,  //{user_id:id,user_email:user,user_name:name,dob:dob,mobile:mobile,address:address,passwords:passwords},
             contentType: "application/json",
             success: function(response) {
                 // Handle success response
                 alert(data);
                 console.log("passenger details updated successfully!");
                 // Redirect to employee details page or show a success message
             },
             error: function(xhr, status, error) {
                 // Handle error response
                 console.log(user);
                 console.log("Error updating passenger details: " + error);
                 // Show an error message or handle the error case
             }
         });
	  });
 }
 
 function submitPassengerDetails() {
	   var id= $("#editUserId").val();
        var name = $("#editName").val();
        var age = $("#editAge").val();
        var gender = $("#editGender").val();
        
        var passenger={
      		  "user_id": id,
                "passenger_name": name,
                "age": age,
                "gender": gender            
        };     
		  var data=JSON.stringify(passenger);
	    //var data=JSON.stringify(formData);
	    console.log(data);
	    if (editMode) {
	    	 
	        $.ajax({
	            url: "editPassengersDetails", // Replace with the actual URL of your edit passenger controller method
	            method: "POST",
	            data: data,
	            contentType:"application/json",
	            success: function(response) {
	            	 alert(response);
	                 console.log("passenger details updated successfully!");
	            },
	            error: function(xhr, status, error) {
	                console.error("AJAX request failed: " + status + ", " + error);
	                // Handle the error response
	                // For example, display an error message
	            }
	        });
	    } else {
	        // Perform AJAX request to add new passenger
	        $.ajax({
	            url: "addPassenger", // Replace with the actual URL of your add passenger controller method
	            method: "POST",
	            data: data,
	            contentType:  "application/json",
	            success: function(response) {
	            	alert(data);
	                 console.log("passenger details updated successfully!");
	            },
	            error: function(xhr, status, error) {
	                console.error("AJAX request failed: " + status + ", " + error);
	                // Handle the error response
	                // For example, display an error message
	            }
	        });
	    }

	    // Hide the form after submission
	    document.getElementById("editFormContainer").style.display = "none";
	}

	function resetForm() {
	    document.getElementById("editName").value = "";
	    document.getElementById("editAge").value = "";
	    document.getElementById("editGender").value = ""; // Set a default value
	}


 </script>
</body>
</html>