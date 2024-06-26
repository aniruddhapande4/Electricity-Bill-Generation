<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Show Bill</title>

  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

  <!-- font awesome stylesheet -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

  <style>
     body {
      font-family: Arial, sans-serif;
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
    }

    .hero_area {
      position: relative;
      height: 100vh;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      background: rgba(0, 0, 0, 0.5);
    }

    .header_section {
      width: 100%;
      position: absolute;
      top: 0;
      background: rgba(3, 169, 244, 0.8);
      box-shadow: 0 0 10px rgba(3, 169, 244, 0.8);
    }

    .navbar-brand img {
      width: 50px;
      height: 50px;
    }
    
    .navbar-brand img:hover{
      box-shadow: 0 0 10px rgba(255, 255, 255, 2);
    }

    .navbar-nav .nav-item .nav-link {
      color: #333;
      font-weight: 600;
      padding: 10px 15px;
    }

    .navbar-nav .nav-item .nav-link:hover {
      color:rgba(255, 255, 255, 0.9);
    }

    .login-box {
      width: 500px;
      padding: 40px;
      position:center;
      background: rgba(255, 255, 255, 0.9);
      text-align: center;
      box-shadow: 0 0 10px rgba(3, 169, 244, 0.8);
      border-radius: 10px;
      margin-top: 120px; /* Adjusted to ensure it is below the navbar */
      margin-left:400px;
    }

    .login-box h2 {
      margin: 0 0 30px;
      padding: 0;
      color: #333;
      text-transform: uppercase;
    }



    .login-box .user-box {
      position: relative;
      margin-bottom: 30px;
    }

    .login-box .user-box p{
      padding: 0;
      color: #333;
      text-align:left;
    }

    .login-box .user-box input {
      width: 100%;
      padding: 10px 0;
      font-size: 16px;
      color: #333;
      margin-bottom: 0px;
      border: none;
      border-bottom: 1px solid #333;
      outline: none;
      background: transparent;
    }
    
    .login-box .user-box select {
      width: 100%;
      padding: 10px 0;
      font-size: 16px;
      color: #333;
      margin-bottom: 30px;
      margin-top:30px;
      border: none;
      border-bottom: 1px solid #333;
      outline: none;
      background: transparent;
    }

    .login-box .user-box label {
      position: absolute;
      top: 0;
      left: 0;
      padding: 10px 0;
      font-size: 16px;
      color: #333;
      pointer-events: none;
      transition: 0.5s;
    }
    
    .login-box .user-box .xx label {
      position: absolute;
      top: -15px;
      left: 0;
      padding: 10px 0;
      font-size: 16px;
      color: #333;
      pointer-events: none;
      transition: 1s;
    }
    
    .login-box .user-box input:focus ~ label,
    .login-box .user-box input:valid ~ label {
      top: -20px;
      left: 0;
      color: #03a9f4;
      font-size: 12px;
    }
    
    .login-box .user-box select:focus ~ label,
    .login-box .user-box select:valid ~ label {
      top: -20px;
      left: 0;
      color: #03a9f4;
      font-size: 12px;
    }
    
   

    .login-box form button {
      position: relative;
      display: inline-block;
      padding: 10px 20px;
      color: #03a9f4;
      font-size: 16px;
      text-transform: uppercase;
      text-decoration: none;
      overflow: hidden;
      margin-top: 40px;
      letter-spacing: 4px;
    }

    .login-box button:hover {
      background: #03a9f4;
      color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 5px #03a9f4,
                  0 0 25px #03a9f4,
                  0 0 50px #03a9f4,
                  0 0 100px #03a9f4;
    }

    .login-box button span {
      position: absolute;
      display: block;
    }

    .login-box button span:nth-child(1) {
      top: 0;
      left: -100%;
      width: 100%;
      height: 2px;
      background: linear-gradient(90deg, transparent, #03a9f4);
      animation: btn-anim1 1s linear infinite;
    }

    .login-box button span:nth-child(2) {
      top: -100%;
      right: 0;
      width: 2px;
      height: 100%;
      background: linear-gradient(180deg, transparent, #03a9f4);
      animation: btn-anim2 1s linear infinite;
      animation-delay: 0.25s;
    }

    .login-box button span:nth-child(3) {
      bottom: 0;
      right: -100%;
      width: 100%;
      height: 2px;
      background: linear-gradient(270deg, transparent, #03a9f4);
      animation: btn-anim3 1s linear infinite;
      animation-delay: 0.5s;
    }

    .login-box button span:nth-child(4) {
      bottom: -100%;
      left: 0;
      width: 2px;
      height: 100%;
      background: linear-gradient(360deg, transparent, #03a9f4);
      animation: btn-anim4 1s linear infinite;
      animation-delay: 0.75s;
    }

    @keyframes btn-anim1 {
      0% {
        left: -100%;
      }
      50%, 100% {
        left: 100%;
      }
    }

    @keyframes btn-anim2 {
      0% {
        top: -100%;
      }
      50%, 100% {
        top: 100%;
      }
    }

    @keyframes btn-anim3 {
      0% {
        right: -100%;
      }
      50%, 100% {
        right: 100%;
      }
    }

    @keyframes btn-anim4 {
      0% {
        bottom: -100%;
      }
      50%, 100% {
        bottom: 100%;
      }
    }

    .login-box .create-account {
      display: block;
      margin-top: 20px;
      font-size: 14px;
      color: #333;
    }

    .login-box .create-account a {
      color: #03a9f4;
      text-decoration: none;
      font-weight: bold;
    }

    .login-box .create-account a:hover {
      text-decoration: underline;
    }
  </style>
</head>

<body>
  <header class="header_section">
    <nav class="navbar navbar-expand-lg">
      <div class="container">
        <a class="navbar-brand mr-5" href="index.html">
          <img src="images/MSEDCLlogo.png" alt="">
          <span>Mahavitaran</span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Home <span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="DateOption.jsp">Show Bill</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="LogoutServlet">Logout</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>

  <%
  HttpSession datesession = request.getSession(false);
  Long dateconsumerno = (Long) datesession.getAttribute("consumer_no");
  String datefullname = (String) datesession.getAttribute("full_name");
  String datetypeofconsumer = (String) datesession.getAttribute("typeofconsumer");
  String dateemailid = (String) datesession.getAttribute("emailid");
  Long datecontact = (Long) datesession.getAttribute("contact");
  String dateaddress = (String) datesession.getAttribute("address");
  %>

  
  <div class="login-container">
    <div class="login-box">
    <form method="post" action="ShowBillServlet" class="register-form" id="login-form">
      <h2>Month and Year Selection</h2>
      <div class="user-box">
        <p><strong>User Information:</strong></p>
        <p>Consumer Number: <%=dateconsumerno%></p>
        <p>Name: <%=datefullname%></p>
        <p>Type: <%=datetypeofconsumer%></p>
        <p>Email ID: <%=dateemailid%></p>
        <p>Contact: <%=datecontact%></p>
        <p>Address: <%=dateaddress%></p>
        </div>
        <div class="user-box">
          <input type="month" name="reading_date" id="reading_date" required>
          <div class="xx">
              <label for="reading_date">Month and Year</label>
          </div>
        </div>
        <button type="submit" style="margin-top: 0px;">
          Show Bill
          <span></span>
          <span></span>
          <span></span>
          <span></span>
        </button>
      </form>
      <% String GenerateError = request.getParameter("GenerateError");
            if (GenerateError != null && GenerateError.equals("1")) { %>
                <p style="color: red;">No data found for the selected month and year.</p>
        <% } %>
        
        <% String GenerateError1 = request.getParameter("GenerateError1");
            if (GenerateError1 != null && GenerateError1.equals("1")) { %>
                <p style="color: red;">No data found for the selected month and year.</p>
        <% } %>
    </div>
  </div>

  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>