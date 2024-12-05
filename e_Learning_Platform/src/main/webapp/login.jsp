<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	  <title>E-Learning Platform</title>
	  <meta name="description" content="">
	  <meta name="keywords" content="">
	
	  <!-- Favicons -->
	  <link href="assets/img/favicon.png" rel="icon">
	  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	
	  <!-- Fonts -->
	  <link href="https://fonts.googleapis.com" rel="preconnect">
	  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
	  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
	
	  <!-- Vendor CSS Files -->
	  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
	  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	
	  <!-- Main CSS File -->
	  <link href="assets/css/main.css" rel="stylesheet">
    <style>
      *{
        padding: 0;
        margin: 0;
        box-sizing: border-box;
      } 
      #page-1{
        width: 100%;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
      .form {
        background-color: #fff;
        display: block;
        padding: 1rem;
        max-width: 350px;
        border-radius: 0.5rem;
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
      }

      .form-title {
        font-size: 1.25rem;
        line-height: 1.75rem;
        font-weight: 600;
        text-align: center;
        color: #000;
      }

      .input-container {
        position: relative;
      }

      .input-container input, .form button {
        outline: none;
        border: 1px solid #e5e7eb;
        margin: 8px 0;
      }

      .input-container input {
        background-color: #fff;
        padding: 1rem;
        padding-right: 3rem;
        font-size: 0.875rem;
        line-height: 1.25rem;
        width: 300px;
        border-radius: 0.5rem;
        box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
      }

      .submit {
        display: block;
        padding-top: 0.75rem;
        padding-bottom: 0.75rem;
        padding-left: 1.25rem;
        padding-right: 1.25rem;
        background-color: #4F46E5;
        color: #ffffff;
        font-size: 0.875rem;
        line-height: 1.25rem;
        font-weight: 500;
        width: 100%;
        border-radius: 0.5rem;
        text-transform: uppercase;
      }

      .signup-link {
        color: #6B7280;
        font-size: 0.875rem;
        line-height: 1.25rem;
        text-align: center;
      }

      .signup-link a {
        text-decoration: underline;
      }
    </style>
</head>
<body>
	<header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1 class="sitename" style="color: black;"  >eLearn</h1>
      </a>

      <nav id="navmenu" class="navmenu" style="color: black;">
        <ul>
          <li><a href="#hero" style="color: black;"  >Home</a></li>
          <li><a href="#about" style="color: black;">Courses</a></li>
          <li><a href="#features" style="color: black;">Articles</a></li>
          <li><a href="#gallery" style="color: black;">Tutorials</a></li>
          <li><a href="#team" style="color: black;">Contact</a></li>
          <!-- 
          <li><a href="#pricing">Pricing</a></li>
          <li class="dropdown"><a href="#"><span>Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="#">Dropdown 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Dropdown</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                <ul>
                  <li><a href="#">Deep Dropdown 1</a></li>
                  <li><a href="#">Deep Dropdown 2</a></li>
                  <li><a href="#">Deep Dropdown 3</a></li>
                  <li><a href="#">Deep Dropdown 4</a></li>
                  <li><a href="#">Deep Dropdown 5</a></li>
                </ul>
              </li>
              <li><a href="#">Dropdown 2</a></li>
              <li><a href="#">Dropdown 3</a></li>
              <li><a href="#">Dropdown 4</a></li>
            </ul>
          </li>
           -->
          <li><a href="login.jsp" style="color: black;" class="active">LogIn/SignUp</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

    </div>
  </header>
  <div class="page" id="page-1">
    
    <%-- Success message --%>
    <% String message = request.getParameter("message");
       if (message != null && message.equals("success")) { %>
        <div class="alert alert-success" role="alert" style="max-width: 400px; margin: 20px auto; text-align: center; padding: 10px; background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; border-radius: 4px;">
            Registration successful! Please login with your credentials.
        </div>
    <% } %>

    <form class="form" id="loginForm" onsubmit="return validateCaptcha()" action="./LoginServlet" method="post">
       <p class="form-title">Sign in to your account</p>
        <div class="input-container">
          <input type="text" name="userName" placeholder="Enter username" required>
          <span>
          </span>
      </div>
      <div class="input-container">
          <input type="password" name="password" placeholder="Enter password" required>
      </div>
      <div class="input-container">
          <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
              <canvas id="captcha" style="border: 1px solid #ddd; border-radius: 4px;"></canvas>
              <button type="button" onclick="generateCaptcha()" style="padding: 5px 10px; background: #4F46E5; color: white; border: none; border-radius: 4px; cursor: pointer;">
                  <i class="bi bi-arrow-clockwise"></i> Refresh
              </button>
          </div>
          <input type="text" id="captchaInput" placeholder="Enter CAPTCHA code" required style="text-transform: uppercase;">
          <div id="captchaError" style="color: red; font-size: 12px; display: none;">Invalid CAPTCHA code!</div>
      </div>
         <button type="submit" class="submit">
        Sign in
      </button>

      <p class="signup-link">
        No account?
        <a href="signup.jsp">Sign up</a>
      </p>
   </form>

<script>
let captchaText = '';

function generateCaptcha() {
    const canvas = document.getElementById('captcha');
    const ctx = canvas.getContext('2d');
    canvas.height = 40;
    canvas.width = 150;

    // Generate random string
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789';
    captchaText = '';
    for(let i = 0; i < 6; i++) {
        captchaText += chars.charAt(Math.floor(Math.random() * chars.length));
    }

    // Clear canvas
    ctx.fillStyle = '#f0f0f0';
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    // Add noise
    for(let i = 0; i < 100; i++) {
        ctx.strokeStyle = '#' + Math.floor(Math.random()*16777215).toString(16);
        ctx.beginPath();
        ctx.moveTo(Math.random() * canvas.width, Math.random() * canvas.height);
        ctx.lineTo(Math.random() * canvas.width, Math.random() * canvas.height);
        ctx.stroke();
    }

    // Draw captcha text
    ctx.font = '30px Arial';
    ctx.fillStyle = '#333';
    ctx.textAlign = 'center';
    ctx.textBaseline = 'middle';
    ctx.fillText(captchaText, canvas.width/2, canvas.height/2);
}

function validateCaptcha() {
    const userInput = document.getElementById('captchaInput').value.trim();
    const errorDiv = document.getElementById('captchaError');
    
    if (userInput.toLowerCase() !== captchaText.toLowerCase()) {
        errorDiv.style.display = 'block';
        generateCaptcha();
        document.getElementById('captchaInput').value = '';
        return false;
    }
    errorDiv.style.display = 'none';
    return true;
}

// Generate initial CAPTCHA when page loads
window.onload = generateCaptcha;
</script>
</div>


</body>
</html>