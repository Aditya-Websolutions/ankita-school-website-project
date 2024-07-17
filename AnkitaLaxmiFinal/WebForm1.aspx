<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AnkitaLaxmiFinal.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Master.css" rel="stylesheet" />


     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 <script>
     function opentab(tabName) {
         var i;
         var tabContents = document.getElementsByClassName("tab-contents");
         for (i = 0; i < tabContents.length; i++) {
             tabContents[i].style.display = "none";
         }
         document.getElementById(tabName).style.display = "block";
         var tabs = document.querySelectorAll('.course-box ul li');
         tabs.forEach(tab => tab.classList.remove('active'));
         document.querySelector('.course-box ul li[data-tab="' + tabName + '"]').classList.add('active');
     }

     function togglePasswordVisibility() {
         var passwordElement = document.getElementById("password");
         var showButton = document.getElementById("showButton");
         var hideButton = document.getElementById("hideButton");
         if (passwordElement.innerHTML === "") {
             passwordElement.innerHTML = "Mk5@kp26";
             showButton.style.display = "none";
             hideButton.style.display = "inline";
         } else {
             passwordElement.innerHTML = "";
             showButton.style.display = "inline";
             hideButton.style.display = "none";
         }
     }

     function toggleDarkMode() {
         document.body.classList.toggle('dark-mode');
         var icon = document.getElementById("darkModeIcon");
         if (document.body.classList.contains('dark-mode')) {
             icon.classList.remove('fa-moon');
             icon.classList.add('fa-sun');
         } else {
             icon.classList.remove('fa-sun');
             icon.classList.add('fa-moon');
         }
     }

     function toggleSidebar() {
         var container = document.querySelector('.container');
         var nav = document.querySelector('nav');
         var main = document.querySelector('.main');
         container.classList.toggle('collapsed');
         nav.classList.toggle('collapsed');
         main.classList.toggle('expanded');
     }

     window.onload = function () {
         var ctx = document.getElementById('attendanceChart').getContext('2d');
         var attendanceChart = new Chart(ctx, {
             type: 'bar',
             data: {
                 labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                 datasets: [{
                     label: 'Attendance',
                     data: [90, 95, 85, 65, 75, 70, 80],
                     backgroundColor: [
                         'rgba(255, 99, 132, 0.2)',  // Red
                         'rgba(54, 162, 235, 0.2)',  // Blue
                         'rgba(255, 206, 86, 0.2)',  // Yellow
                         'rgba(75, 192, 192, 0.2)',  // Green
                         'rgba(153, 102, 255, 0.2)', // Purple
                         'rgba(255, 159, 64, 0.2)',  // Orange
                         'rgba(0, 0, 0, 0.2)'        // Black
                     ],
                     borderColor: [
                         'rgba(255, 99, 132, 1)',    // Red
                         'rgba(54, 162, 235, 1)',    // Blue
                         'rgba(255, 206, 86, 1)',    // Yellow
                         'rgba(75, 192, 192, 1)',    // Green
                         'rgba(153, 102, 255, 1)',   // Purple
                         'rgba(255, 159, 64, 1)',    // Orange
                         'rgba(0, 0, 0, 1)'          // Black
                     ],
                     borderWidth: 1
                 }]
             },
             options: {
                 scales: {
                     y: {
                         beginAtZero: true
                     }
                 },
                 plugins: {
                     legend: {
                         labels: {
                             color: 'rgb(0, 0, 0)'
                         }
                     }
                 }
             }
         });

         document.body.classList.contains('dark-mode') && updateChartColors(attendanceChart, '#ffffff', '#ffffff');
     };

     function updateChartColors(chart, gridColor, labelColor) {
         chart.options.scales.x.grid.color = gridColor;
         chart.options.scales.y.grid.color = gridColor;
         chart.options.scales.x.ticks.color = labelColor;
         chart.options.scales.y.ticks.color = labelColor;
         chart.update();
     }
 </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="main">
  <div class="main-top">
    <h1>HOME</h1>
    <div class="icons">
      <i class="fas fa-user"></i>
      <i id="darkModeIcon" class="fas fa-moon" onclick="toggleDarkMode()"></i>
    </div>
  </div>
  <div class="main-skills">
    <div class="card">
      <img src="https://cdn-icons-png.freepik.com/256/10302/10302971.png?semt=ais_hybrid"/>
      <h3>My Profile</h3>
      <a href="WebForm3.aspx" class="button">View Profile</a>
    </div>
    <div class="card">
      <img src="https://img.freepik.com/premium-vector/wallet-logo-vector_617585-1642.jpg"/>
      <h3>Fee</h3>
      <button>Fee</button>
    </div>
    <div class="card">
      <img src="https://d1csarkz8obe9u.cloudfront.net/posterpreviews/bar-chart-design-template-2e8130b6ba4f5358b409cec63815b11f_screen.jpg?ts=1635514172"/>
      <h3>My Attendance</h3>
      <a href="WebForm2.aspx" class="button">View Attendance</a>
    </div>
    <div class="card">
      <img src="https://t3.ftcdn.net/jpg/05/41/12/92/360_F_541129209_elvuqinzkqMDGI7P1wm1GPaaANSlJ2qk.jpg"/>
      <h3>My Courses</h3>
      <button>My Courses</button>
    </div>
    <div class="card">
      <img src="https://logowik.com/content/uploads/images/check-mark-badge6475.logowik.com.webp"/>
      <h3>Marks</h3>
      <a href="WebForm4.aspx" class="button">View Marks</a>
    </div>
  </div><br/><br/>
  

  <div class="container">
    <div class="chart-container">
      <canvas id="attendanceChart"></canvas>
    </div>
  
    <div class="accordion-container">
      <h2>Routine</h2>
      <div class="accordion">
        <button class="accordion-btn">Monday</button>
        <div class="accordion-panel">
          <p>9:00 AM - 11:00 AM: Mathematics</p>
          <!-- Add more classes for Monday if needed -->
        </div>
  
        <button class="accordion-btn">Tuesday</button>
        <div class="accordion-panel">
          <p>10:00 AM - 12:00 PM: Physics</p>
          <!-- Add more classes for Tuesday if needed -->
        </div>

        <button class="accordion-btn">Wednesday</button>
        <div class="accordion-panel">
          <p>10:00 AM - 12:00 PM: Physics</p>
          <!-- Add more classes for Tuesday if needed -->
        </div>

        <button class="accordion-btn">Thursday</button>
        <div class="accordion-panel">
          <p>10:00 AM - 12:00 PM: Physics</p>
          <!-- Add more classes for Tuesday if needed -->
        </div>

        <button class="accordion-btn">Friday</button>
        <div class="accordion-panel">
          <p>10:00 AM - 12:00 PM: Physics</p>
          <!-- Add more classes for Tuesday if needed -->
        </div>
  
        <!-- Add buttons and panels for other days as needed -->
      </div>
    </div>
  </div><br/><br/>
  
  

  <section class="email-section">
    <h1>Email</h1>
    <div class="email-box">
      <p>Email: <span>ankitalaxmi26@gmail.com</span></p><br/>
      <p>Password: <span id="password"></span> 
        <button id="showButton" onclick="togglePasswordVisibility()">Show</button>
        <button id="hideButton" style="display: none;" onclick="togglePasswordVisibility()">Hide</button>
      </p>
    </div>
  </section><br/>

  <section class="main-course">
    <h1>Important</h1>
    <div class="course-box">
      <ul>
        <li class="active" data-tab="notice" onclick="opentab('notice')">Notice</li>
        <li data-tab="events" onclick="opentab('events')">Events</li>
        <li data-tab="exam" onclick="opentab('exam')">Exam</li>
      </ul><br/>

      <div class="tab-contents active-tab" id="notice">
        <ul>
          <li>No Notice for you.</li>
        </ul>
      </div>

      <div class="tab-contents" id="events">
        <ul>
          <li>No Upcoming Events.</li>
        </ul>
      </div>

      <div class="tab-contents" id="exam">
        <ul>
          <li>Not Scheduled.</li>
        </ul>
      </div>
    </div>
  </section>
</section>

     <script>
         // Get all accordion buttons
         var accordionBtns = document.querySelectorAll('.accordion-btn');

         // Add click event listener to each button
         accordionBtns.forEach(function (btn) {
             btn.addEventListener('click', function () {
                 // Toggle active class on clicked button
                 this.classList.toggle('active');

                 // Toggle active class on panel associated with the clicked button
                 var panel = this.nextElementSibling;
                 if (panel.style.display === 'block') {
                     panel.style.display = 'none';
                 } else {
                     panel.style.display = 'block';
                 }
             });
         });

 </script>
</asp:Content>
