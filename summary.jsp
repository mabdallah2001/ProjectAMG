<%-- 
    Document   : summary
    Created on : Apr 29, 2021, 1:49:27 PM
    Author     : Amir
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
<%@page import="javax.sql.rowset.RowSetProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
    crs.setUrl("jdbc:derby://localhost:1527/ProjectAMG");
    crs.setUsername("AMG");
    crs.setPassword("AMG");
    crs.setCommand("Select * from CarList where id = ?");
    crs.setString(1, pageContext.getSession().getId());
    crs.execute();
    crs.next();

    //CachedRowSet crs2 = RowSetProvider.newFactory().createCachedRowSet();
    //crs2.setUrl("jdbc:derby://localhost:1527/ProjectAMG");
    //crs2.setUsername("AMG");
    //crs2.setPassword("AMG");
    //crs2.setCommand("Select picture from bodypaint where id = ?");
    //crs2.setInt(1, crs.getInt("bodypaint"));
    //crs2.execute();
    //crs2.next();
    //String n = "graphics/"+crs2.getString("picture");

%>
<%--
<!DOCTYPE html>
<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>JSP Page</title>
   </head>
   <body>
       <h1><%= crs2.getString("picture") %> </h1>
   </body>
</html>
--%>

<% if (crs.getInt("bodypaint") < 1 || crs.getInt("wheeldesign") < 1 || crs.getInt("upholstery") < 1 || crs.getInt("trimcolor") < 1 || !crs.getString("featuresavailable").matches("Yes")) {
%>
<h1 style=text-align:center>Configuration steps not completed. Please complete every category. </h1>
<%
} else {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">

        <title>ProjectAMG</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href=https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css>
        <script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
        <link rel="stylesheet" href="projectBenz.css">

    </head>


    <body>



        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a href="ProjectAMG.html"><img src="graphics\mercLogo.png" class="merclogo"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse nav-bar" id="main_nav">
                <ul class="navbar-nav" id="navbar-align">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Models</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="cla45.html">CLA45s</a></li>
                            <li><a class="dropdown-item" href="g63.html">G63s</a></li>
                            <li><a class="dropdown-item" href="amgone.html">AMG ONE</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="specs.html">Specs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="build.html">Build</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.html">Contact Us</a>
                    </li>
                </ul>

            </div> <!-- navbar-collapse.// -->
            <a href="ProjectAMG.html"><img src="graphics\amglogo.png" class="amglogo"></a>
        </nav>




        <!-- NAVBAR BUILD -->

        <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
            <a class="navbar-brand" href="#"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse"></div>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="exterior.html">Exterior </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="interior.html">Interior</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="options.html">Options</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="summary.jsp">Summary</a>
                    </li>
                </ul>
            </div>
        </nav>


        <!-- MAIN -->
        <br><br>

        <h1 style="text-align:center; font-size: 3rem;">YOUR AMG</h1><br><br>
        
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
  </ol>
  <div class="carousel-inner">

    <div class="carousel-item active">
              <% if (crs.getInt("bodypaint") == 1 && crs.getInt("wheeldesign") == 1) {
        %>
        <img class="d-block w-100" src="graphics/b blck mix.png" alt="Second slide" style="height: auto; width: 100%; margin-right: 4.75%;">
        <%
        } else if (crs.getInt("bodypaint") == 1 && crs.getInt("wheeldesign") == 2) {
        %>
        <img class="d-block w-100" src="graphics/b silv mix.png" alt="Second slide" style="height: auto; width: 100%; margin-right: 4.75%;">

        <%
        } else if (crs.getInt("bodypaint") == 1 && crs.getInt("wheeldesign") == 3) {
        %>
        <img class="d-block w-100" src="graphics/b front.png" alt="Second slide" style="height: auto; width: 100%; margin-right: 4.75%;">

        <%
        } else if (crs.getInt("bodypaint") == 2 && crs.getInt("wheeldesign") == 1) {
        %>
        <img class="d-block w-100" src="graphics/w blck mix.png" alt="Second slide" style="height: auto; width: 100%; margin-right: 4.75%;">

        <%
            }
            if (crs.getInt("bodypaint") == 2 && crs.getInt("wheeldesign") == 2) {
        %>
        <img class="d-block w-100" src="graphics/w silv mix.png" alt="Second slide" style="height: auto; width: 100%; margin-right: 4.75%;">
        <%
        } else if (crs.getInt("bodypaint") == 2 && crs.getInt("wheeldesign") == 3) {
        %>
        <img class="d-block w-100" src="graphics/w front.png" alt="Second slide" style="height: auto; width: 100%; margin-right: 4.75%;">

        <%
        } else if (crs.getInt("bodypaint") == 3 && crs.getInt("wheeldesign") == 1) {
        %>
        <img class="d-block w-100" src="graphics/g blck mix.png" alt="Second slide" style="height: auto; width: 100%; margin-right: 4.75%;">

        <%
        } else if (crs.getInt("bodypaint") == 3 && crs.getInt("wheeldesign") == 2) {
        %>
        <img class="d-block w-100" src="graphics/g silv mix.png" alt="Second slide" style="height: auto; width: 100%; margin-right: 4.75%;">

        <%
        } else if (crs.getInt("bodypaint") == 3 && crs.getInt("wheeldesign") == 3) {

        %>
        <img class="d-block w-100" src="graphics/g front.png" alt="Second slide" style="height: auto; width: 100%; margin-right: 4.75%;">

        <%        }

        %>
    </div>
    <div class="carousel-item">
              <% if (crs.getInt("upholstery") == 1 && crs.getInt("trimcolor") == 1) {
        %>
        <img class="d-block w-100"  src="graphics/white alumn.jpeg" alt="Second slide" style="height: auto; width: 50%; margin-right: 4.75%;">
        <%
        } else if (crs.getInt("upholstery") == 1 && crs.getInt("trimcolor") == 2) {
        %>
        <img class="d-block w-100"  src="graphics/white walnut.jpeg" alt="Second slide" style="height: auto; width: 50%;  margin-right: 4.75%;">

        <%
        } else if (crs.getInt("upholstery") == 1 && crs.getInt("trimcolor") == 3) {
        %>
        <img  src="graphics/white black.jpeg" alt="Second slide" style="height: auto; width: 50%; margin-right: 4.75%;">

        <%
        } else if (crs.getInt("upholstery") == 2 && crs.getInt("trimcolor") == 1) {
        %>
        <img class="d-block w-100" src="graphics/brown white.jpeg" alt="Second slide" style="height: auto; width: 100%; margin-right: 4.75%;">

        <%
            }
            if (crs.getInt("upholstery") == 2 && crs.getInt("trimcolor") == 2) {
        %>
        <img class="d-block w-100" src="graphics/brown brown.jpeg" alt="Second slide" style="height: auto; width: 50%; margin-right: 4.75%;">
        <%
        } else if (crs.getInt("upholstery") == 2 && crs.getInt("trimcolor") == 3) {
        %>
        <img class="d-block w-100" src="graphics/brown black.jpeg" alt="Second slide" style="height: auto; width: 50%; margin-right: 4.75%;">

        <%
        } else if (crs.getInt("upholstery") == 3 && crs.getInt("trimcolor") == 1) {
        %>
        <img class="d-block w-100" src="graphics/red white.jpeg" alt="Second slide" style="height: auto; width: 50%; margin-right: 4.75%;">

        <%
        } else if (crs.getInt("upholstery") == 3 && crs.getInt("trimcolor") == 2) {
        %>
        <img class="d-block w-100" src="graphics/red brown.jpeg" alt="Second slide" style="height: auto; width: 50%; margin-right: 4.75%;">

        <%
        } else if (crs.getInt("upholstery") == 3 && crs.getInt("trimcolor") == 3) {

        %>
        <img class="d-block w-100" src="graphics/red black.jpeg" alt="Second slide" style="height: auto; width: 50%; margin-right: 4.75%;">

        <%        }

        %>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>

        </div>

        
           
    <br><br>
            
            <div class="jumbotron jumbotron-fluid" style="text-align:center;">
    <div class="container">
        <h1 class="display-5" >Your options:</h1><br>
  
  
            
        <ul style="list-style-type:none; margin-left: -40px;">
        <%        if (crs.getString("featuresavailable").matches("Yes")) {
                //ArrayList<Integer> ftnum = new ArrayList<>();
                crs.setCommand("select feature from Features where ID in (select feature from carfeaturelist where car = ?)");
                crs.setString(1, pageContext.getSession().getId());
                crs.execute();

                while (crs.next()) {
        %>
        <li><h3><%= crs.getString("Feature")%></h3></li>

        <%
            }
        %>
        </ul>


        <%
            }
        %>
        
          </div>
    </div>
        <div id="claSpec"></div><br>
<!-- Table -->
<div class="container-fluid padding">
    <div class="row">
        <div class="col-md-12 col-lg-6">
            <div class="container">
                <h2 style='text-align: center '>Engines</h2>        
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Component</th>
                        <th>Specification</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Engine</td>
                        <td>turbocharged inline-4</td>
                    </tr>
                    <tr>
                        <td>Max. Power</td>
                        <td>421 hp @ 6750 rpm</td>
                    </tr>
                    <tr>
                        <td>Max. Torque</td>
                        <td>500 Nm @ 5000rpm</td>
                    </tr>
                    <tr>
                        <td>Transmission</td>
                        <td>8-speed dual-clutch automatic</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-12 col-lg-6">
            <div class="container">
                <h2 style='text-align: center '>Performance</h2>        
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Component</th>
                        <th>Specification</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Top Speed</td>
                        <td>270 Km/h</td>
                    </tr>
                    <tr>
                        <td>0-100 Km/h</td>
                        <td>3.7 s</td>
                    </tr>
                    <tr>
                        <td>1/4 mile</td>
                        <td>12.1 s</td>
                    </tr>
                    <tr>
                        <td>Braking 100-0 Km/h</td>
                        <td>45.3 m</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-12 col-lg-12">
            <div class="container">
                <h2 style='text-align: center '>Dimensions</h2>        
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Component</th>
                        <th>Specification</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>Wheelbase</td>
                        <td>2.72 m</td>
                    </tr>
                    <tr>
                        <td>Length</td>
                        <td>4.69 m</td>
                    </tr>
                    <tr>
                        <td>Width</td>
                        <td>4.86 m</td>
                    </tr>
                    <tr>
                        <td>Height</td>
                        <td>1.41 m</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<br><br><br> 
        <%
            }
        %>
        <br><br>

        <br>
        <br>



        <!-- Footer -->
        <br><br>
        <footer>
            <div class="container-fluid padding">
                <div class="row text-center">
                    <div class="col-md-4">
                        <img src="graphics\mercLogo.png" class="image1">
                        <hr class="light">
                        <p>555-555-5555</p>
                        <p>benz@gmail.com</p>
                        <p>100 Street Name</p>
                        <p>Stuttgart, Germany, 00000</p>
                    </div>
                    <div class="col-md-4">
                        <hr class="light">
                        <h5 class="head-color">Information</h5>
                        <hr class="light">
                        <a href="#"><p>About Us</p></a>
                        <a href="#"><p>Careers</p></a>
                        <a href="#"><p>Blog</p></a>
                        <a href="#"><p>Other locations</p></a>
                    </div>
                    <div class="col-md-4">
                        <hr class="light">
                        <h5 class="head-color">More about us</h5>
                        <hr class="light">
                        <a href="#"><p>Services</p></a>
                        <a href="#"><p>Support</p></a>
                        <a href="#"><p>Terms & Conditions</p></a>
                        <a href="#"><p>Privacy Policy</p></a>
                        <a href="#"><p>Cookies</a>


                    </div>
                    <div class="col-12">
                        <hr class="light-hr">
                        <div class="container-fluid">
                            <div class="row text-center">
                                Follow us to share your passion of cars with us and use our social media in order to contact us
                                <br>
                            </div>
                            <div class="col-12 social">
                                <a href="https://www.facebook.com/MercedesAMG/"><i class="fab fa-facebook"></i></a>
                                <a href="https://twitter.com/mercedesamg?lang=en"><i class="fab fa-twitter"></i></a>
                                <a href="https://www.mercedes-amg.com/en/home.html"><i class="fab fa-google-plus-g"></i></a>
                                <a href="https://www.instagram.com/mercedesamg/"><i class="fab fa-instagram"></i></a>
                                <a href="https://www.youtube.com/user/OfficialMercedesAMG"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
        <div class="col-12">
            <hr class="light-hr">
            <div class="container-fluid">
                <div class="row text-center">
                </div>
                <div><i> This is the official International website of Mercedes-Benz AMG. To shop locally, find the closest shop to your location. </i></div>
                <br>
                </footer>


                <!-- Bootstrap core JS-->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
                <!-- Third party plugin JS-->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
                </body>
                </html>
                --%>    