
<!DOCTYPE html>
<html>
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

  <title>Mahavitaran</title>

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
    .hero_area {
  height: 100vh;
  background-image: url(images/Electricity.jpg);
  background-size: cover;
}

.sub_page .hero_area {
  height: auto;
}

.header_section .container-fluid {
  padding-right: 25px;
  padding-left: 25px;
}

.header_section .nav_container {
  margin: 0 auto;
}

.custom_nav-container.navbar-expand-lg .navbar-nav .nav-item .nav-link {
  padding: 10px 30px;
  color: #ffffff;
  text-align: center;
  text-transform: uppercase;
}

a,
a:hover,
a:focus {
  color:rgba(255, 255, 255, 0.9);
}

a:hover,
a:focus {
  color: color:rgba(255, 255, 255, 0.9);;
}

.btn,
.btn:focus {
  outline: none !important;
  -webkit-box-shadow: none;
          box-shadow: none;
}

.custom_nav-container .nav_search-btn {
  
  background-size: 22px;
  background-repeat: no-repeat;
  background-position-y: 7px;
  width: 35px;
  height: 35px;
  padding: 0;
  border: none;
}

.navbar-brand {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.navbar-brand img {
  width: 50px;
  height: 50px;
  margin-right: 5px;
}

.navbar-brand span {
  font-size: 20px;
  font-weight: 700;
  color: #ffffff;
  text-transform: uppercase;
  
}

.custom_nav-container {
  z-index: 99999;
  padding: 15px 0;
}

.custom_nav-container .navbar-toggler {
  outline: none;
}

.custom_nav-container .navbar-toggler .navbar-toggler-icon {
  background-image: url(menu.png);
  background-size: 55px;
}

/*end header section*/
/* slider section */
.slider_section {
  height: calc(100% - 150px);
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.slider_section .detail-box {
  color: #ffffff;
}

.slider_section .detail-box h1 {
  text-transform: uppercase;
  font-size:80px;
}

.slider_section .detail-box h1 span {
  color: #f0370e;
}

.slider_section .detail-box p {
  margin-top: 15px;
  font-size:25px;
}

.slider_section .detail-box .btn-box {
  margin-top: 45px;
}

.slider_section .detail-box .btn-box a {
  display: inline-block;
  padding: 10px 45px;
  background-color: #e93f1a;
  color: #ffffff;
  -webkit-transition: all 0.3s;
  transition: all 0.3s;
  border: 1px solid transparent;
  border-radius: 5px;
}

.slider_section .detail-box .btn-box a:hover {
  background-color: transparent;
  border-color: #e93f1a;
  color: #e93f1a;
}

.slider_section #carouselExampleIndicators {
  width: 100%;
}
  </style>
</head>

<body>
  <div class="hero_area">
    <!-- header section starts -->
    <header class="header_section">
      <div class="container">
      <%
        // Retrieve the session object
        HttpSession currsession = request.getSession(false);

        // Check if the session is not null and the username attribute is set
        if (currsession != null && currsession.getAttribute("full_name") != null && currsession.getAttribute("consumer_no") != null) {
            // Get the username from the session
            String username = (String) currsession.getAttribute("full_name");
    %>
        <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
          <a class="navbar-brand mr-5" href="index.jsp">
            <img src="images/MSEDCLlogo.png" alt="">
            <span>
              Mahavitaran
            </span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav">
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
              <form class="form-inline">
                <button class="btn my-2 my-sm-0 nav_search-btn" type="submit"></button>
              </form>
            </div>
          </div>
        </nav>
         <%
        } 
        else if(currsession != null && currsession.getAttribute("admin_id") != null){
        	int admin_id = (int) currsession.getAttribute("admin_id");
     %>
         <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
          <a class="navbar-brand mr-5" href="index.jsp">
            <img src="images/MSEDCLlogo.png" alt="">
            <span>
              Mahavitaran
            </span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">Home <span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Analysis.jsp">Analyze</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="AdminNewConsumer.jsp">Insert New Consumer</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="AdminInsert.jsp">Insert New Reading</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
              </ul>
              <form class="form-inline">
                <button class="btn my-2 my-sm-0 nav_search-btn" type="submit"></button>
              </form>
            </div>
          </div>
        </nav>
        <%
        }
        else{
     %>
        <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
          <a class="navbar-brand mr-5" href="index.jsp">
            <img src="images/MSEDCLlogo.png" alt="">
            <span>
              Mahavitaran
            </span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
              <ul class="navbar-nav">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">Home <span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="AdminLogin.jsp">Admin</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Login.jsp">Consumer</a>
                </li>
              </ul>
              <form class="form-inline">
                <button class="btn my-2 my-sm-0 nav_search-btn" type="submit"></button>
              </form>
            </div>
          </div>
        </nav>
        <%
            }
    %>
      </div>
    </header>
    <!-- end header section -->
    <!-- slider section -->
    <section class="slider_section position-relative">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="container">
              <div class="row">
                <div class="col-md-7">
                  <div class="detail-box">
                    <div>
                      <h1>
                        Welcome To <br>
                        <span>
                          Mahavitaran
                        </span>
                      </h1>
                      <p>
                        Track your electricity expenses and generate electricity bills with us easily and without any issues
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end slider section -->
  </div>

  <!-- about section -->
  <section class="about_section layout_padding">
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="detail-box">
            <div class="heading_container">
              <h2>
                About Us
              </h2>
            </div>
            <p>
              Mahavitaran is your trusted partner in managing and understanding your 
              electricity usage and billing. Our mission is to provide a seamless, transparent, and user-friendly
              platform where consumers can effortlessly generate, view, and download their electricity bills 
              for any selected month.
            </p>
          </div>
        </div>
        <div class="col-md-6">
          <div class="img-box">
            <img src="images/aboutus.jpg" alt="">
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- end about section -->

  <div class="body_bg layout_padding">
    <!-- service section -->
    <section class="service_section">
      <div class="container">
        <div class="heading_container">
          <h2>
            Our Service
          </h2>
        </div>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="box">
              <div class="img-box"></div>
              <h4>
                Instant Bill Generation
              </h4>
              <p>
                Quickly generate your electricity bill for any selected month. 
                With just a few clicks, you can access detailed breakdowns and usage statistics. 
                This feature helps you stay on top of your energy expenses and manage your budget effectively. 
                No more waiting for your bill in the mail get it instantly whenever you need it.
              </p>
            </div>
          </div>
          <div class="col-md-6">
            <div class="box align-items-end align-items-md-start text-right text-md-left">
              <div class="img-box"></div>
              <h4>
                Easy Access to Bill History
              </h4>
              <p>
                View and track all your past bills in one convenient place. 
                Our platform keeps a comprehensive record of your electricity consumption over time. 
                This helps you monitor trends, identify any irregularities, and better understand your energy 
                usage patterns. Stay organized and informed with easy access to your billing history.
              </p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6">
            <div class="box">
              <div class="img-box"></div>
              <h4>
                Downloadable Bills
              </h4>
              <p>
                Download your bills in PDF format for easy storage and reference. 
                This feature ensures you have a permanent, accessible record of your electricity expenses.
                Whether for personal records or for sharing with others, downloadable bills make managing your finances simpler. 
                Keep your bills handy, secure, and well-organized.
              </p>
            </div>
          </div>
          <div class="col-md-6">
            <div class="box align-items-end align-items-md-start text-right text-md-left">
              <div class="img-box"></div>
              <h4>
                User-Friendly Interface
              </h4>
              <p>
                Our platform is designed for simplicity and ease of use, 
                ensuring everyone can navigate it effortlessly. Intuitive menus, clear instructions, 
                and responsive design make managing your electricity bills straightforward. 
                We prioritize user experience, making it accessible for users of all tech-savviness levels.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <!-- info section -->
  <section class="info_section layout_padding">
    <div class="footer_contact">
      <div class="heading_container">
        <h2>
          Contact Us
        </h2>
      </div>
      <div class="box">
        <a href="" class="img-box">
          <img src="images/location.png" alt="" class="img-1">
          <img src="images/location-o.png" alt="" class="img-2">
        </a>
        <a href="" class="img-box">
          <img src="images/call.png" alt="" class="img-1">
          <img src="images/call-o.png" alt="" class="img-2">
        </a>
        <a href="" class="img-box">
          <img src="images/envelope.png" alt="" class="img-1">
          <img src="images/envelope-o.png" alt="" class="img-2">
        </a>
      </div>
    </div>
  </section>

  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>
