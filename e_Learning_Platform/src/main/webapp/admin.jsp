<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - E-Learning Platform</title>
    
    <!-- Favicon -->
    <link href="assets/img/favicon.png" rel="icon">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    
    <style>
        :root {
            --primary: #2b55cc;
            --secondary: #1e40af;
            --success: #22c55e;
            --danger: #ef4444;
            --warning: #f59e0b;
            --info: #3b82f6;
            --light: #f8fafc;
            --dark: #1e293b;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--light);
            overflow-x: hidden;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 260px;
            background: #fff;
            padding: 20px;
            transition: all 0.4s ease;
            z-index: 1000;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }

        .logo {
            display: flex;
            align-items: center;
            padding: 15px 0;
            color: var(--primary);
            border-bottom: 1px solid #eee;
            margin-bottom: 20px;
        }

        .logo i {
            font-size: 24px;
            margin-right: 10px;
        }

        .logo span {
            font-size: 20px;
            font-weight: 600;
        }

        .side-menu {
            margin: 36px 0;
            padding: 0;
            list-style: none;
        }

        .side-menu li {
            margin-bottom: 10px;
        }

        .side-menu a {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            color: var(--dark);
            text-decoration: none;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .side-menu a:hover, 
        .side-menu a.active {
            background: var(--primary);
            color: #fff;
        }

        .side-menu a i {
            font-size: 18px;
            margin-right: 10px;
        }

        /* Active Menu Styles */
        .side-menu li a.active {
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
        }

        /* Main Content */
        .content {
            margin-left: 260px;
            padding: 30px;
            transition: all 0.4s ease;
        }

        .content-header {
            background: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header-title h1 {
            font-size: 24px;
            font-weight: 600;
            margin: 0;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        /* Cards */
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .card {
            background: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border: none;
        }

        .card-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .card-icon {
            width: 45px;
            height: 45px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
        }

        .card-icon i {
            font-size: 20px;
            color: #fff;
        }

        .card-info h3 {
            font-size: 28px;
            font-weight: 600;
            margin: 0;
        }

        .card-info span {
            font-size: 14px;
            color: #64748b;
        }

        /* Table */
        .table-container {
            background: #fff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .table-title {
            font-size: 18px;
            font-weight: 600;
        }

        .table-actions {
            display: flex;
            gap: 10px;
        }

        .btn-custom {
            padding: 8px 15px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: var(--primary);
            color: #fff;
        }

        .btn-danger {
            background: var(--danger);
            color: #fff;
        }

        .status {
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-active {
            background: #dcfce7;
            color: var(--success);
        }

        .status-pending {
            background: #fef9c3;
            color: var(--warning);
        }

        /* Student Management Styles */
        .student-section {
            display: none;
            padding: 20px;
        }

        .student-header {
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .student-search {
            width: 300px;
            position: relative;
        }

        .student-search input {
            width: 100%;
            padding: 8px 15px;
            border: 1px solid #ddd;
            border-radius: 20px;
            padding-left: 35px;
        }

        .student-search i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        .student-table {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .student-table th {
            background: #4723d9;
            color: white;
            padding: 15px;
            font-weight: 500;
        }

        .student-table td {
            padding: 12px 15px;
            vertical-align: middle;
        }

        .student-status {
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 0.85em;
            font-weight: 500;
        }

        .status-active {
            background: #e1f7e3;
            color: #1fa526;
        }

        .status-inactive {
            background: #ffeaea;
            color: #dc3545;
        }

        .student-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        .student-actions .btn {
            padding: 5px 10px;
            margin: 0 3px;
        }

        /* Instructor Management Styles */
        .instructor-section {
            display: none;
            padding: 20px;
        }

        .instructor-header {
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .instructor-search {
            width: 300px;
            position: relative;
        }

        .instructor-search input {
            width: 100%;
            padding: 8px 15px;
            border: 1px solid #ddd;
            border-radius: 20px;
            padding-left: 35px;
        }

        .instructor-search i {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        .instructor-table {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .instructor-table th {
            background: #4723d9;
            color: white;
            padding: 15px;
            font-weight: 500;
        }

        .instructor-table td {
            padding: 12px 15px;
            vertical-align: middle;
        }

        .instructor-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        .instructor-status {
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 0.85em;
            font-weight: 500;
        }

        .instructor-actions .btn {
            padding: 5px 10px;
            margin: 0 3px;
        }

        .expertise-tags span {
            display: inline-block;
            background: #f0f0f0;
            padding: 3px 10px;
            border-radius: 15px;
            font-size: 0.85em;
            margin: 2px;
        }

        .rating-stars {
            color: #ffc107;
        }

        /* Enrollment Management Styles */
        .enrollment-section {
            display: none;
            padding: 20px;
        }

        .enrollment-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .stat-card .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 15px;
        }

        .stat-card h3 {
            font-size: 24px;
            margin: 10px 0 5px;
        }

        .stat-card p {
            color: #666;
            margin: 0;
        }

        .enrollment-filters {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .enrollment-table {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .enrollment-table th {
            background: #4723d9;
            color: white;
            padding: 15px;
            font-weight: 500;
        }

        .progress-bar {
            height: 8px;
            border-radius: 4px;
            background: #e9ecef;
        }

        .progress-bar div {
            height: 100%;
            border-radius: 4px;
            background: #4723d9;
        }

        .status-badge {
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 0.85em;
            font-weight: 500;
        }

        .status-active {
            background: #e1f7e3;
            color: #1fa526;
        }

        .status-completed {
            background: #e3f2ff;
            color: #0d6efd;
        }

        .status-dropped {
            background: #ffeaea;
            color: #dc3545;
        }

        .payment-paid {
            background: #e1f7e3;
            color: #1fa526;
        }

        .payment-pending {
            background: #fff3cd;
            color: #ffc107;
        }

        /* Help Desk Styles */
        .helpdesk-section {
            display: none;
            padding: 20px;
        }

        .ticket-priority {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            display: inline-block;
            margin-right: 8px;
        }

        .priority-high {
            background: #dc3545;
        }

        .priority-medium {
            background: #ffc107;
        }

        .priority-low {
            background: #198754;
        }

        .ticket-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            border-left: 4px solid #4723d9;
        }

        .ticket-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .ticket-status {
            padding: 5px 12px;
            border-radius: 15px;
            font-size: 0.85em;
        }

        .status-open {
            background: #e1f7e3;
            color: #1fa526;
        }

        .status-pending {
            background: #fff3cd;
            color: #ffc107;
        }

        .status-closed {
            background: #e9ecef;
            color: #6c757d;
        }

        .ticket-meta {
            font-size: 0.85em;
            color: #6c757d;
        }

        .ticket-category {
            background: #f8f9fa;
            padding: 3px 10px;
            border-radius: 12px;
            font-size: 0.85em;
            color: #4723d9;
        }

        @media screen and (max-width: 768px) {
            .sidebar {
                left: -260px;
            }
            .content {
                margin-left: 0;
            }
            .sidebar.active {
                left: 0;
            }
        }
        
        /* Add this style for active menu item */
        .side-menu li a.active {
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="logo">
            <i class="bi bi-code-square"></i>
            <span>Admin Panel</span>
        </div>
        <ul class="side-menu">
            <li><a href="index.jsp"><i class="bi bi-house"></i> Home</a></li>
            <li><a href="#!" onclick="switchSection('dashboard')"><i class="bi bi-grid"></i> Dashboard</a></li>
            <li><a href="#!" onclick="switchSection('studentSection')"><i class="bi bi-people"></i> Students</a></li>
            <li><a href="#!" onclick="switchSection('instructorSection')"><i class="bi bi-person-badge"></i> Instructors</a></li>
            <li><a href="#!" onclick="switchSection('enrollmentSection')"><i class="bi bi-card-checklist"></i> Enrollments</a></li>
            <li><a href="#!" onclick="switchSection('helpdeskSection')"><i class="bi bi-headset"></i> Help Desk</a></li>
            <li><a href="#"><i class="bi bi-gear"></i> Settings</a></li>
            <li><a href="logout.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="content">
        <!-- Header -->
        <div class="content-header">
            <div class="header-title">
                <h1 id="header-title">Dashboard</h1>
            </div>
            <div class="user-info">
                <span>Welcome, Admin</span>
                <img src="assets/img/profile-placeholder.jpg" alt="Admin">
            </div>
        </div>

        <!-- Dashboard Section -->
        <div class="container-fluid" id="dashboard">
            <!-- Cards -->
            <div class="cards">
                <div class="card">
                    <div class="card-header">
                        <div class="card-icon" style="background: var(--primary)">
                            <i class="bi bi-people-fill"></i>
                        </div>
                        <div class="card-info">
                            <h3>1,234</h3>
                            <span>Total Students</span>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <div class="card-icon" style="background: var(--success)">
                            <i class="bi bi-book-fill"></i>
                        </div>
                        <div class="card-info">
                            <h3>56</h3>
                            <span>Total Courses</span>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <div class="card-icon" style="background: var(--warning)">
                            <i class="bi bi-currency-dollar"></i>
                        </div>
                        <div class="card-info">
                            <h3>$12,345</h3>
                            <span>Total Revenue</span>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <div class="card-icon" style="background: var(--info)">
                            <i class="bi bi-graph-up"></i>
                        </div>
                        <div class="card-info">
                            <h3>789</h3>
                            <span>Enrollments</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Table -->
            <div class="table-container">
                <div class="table-header">
                    <div class="table-title">Recent Courses</div>
                    <div class="table-actions">
                        <button class="btn-custom btn-primary">Add Course</button>
                    </div>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Course Name</th>
                            <th>Instructor</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Java Programming Fundamentals</td>
                            <td>John Doe</td>
                            <td>Programming</td>
                            <td>$49.99</td>
                            <td><span class="status status-active">Active</span></td>
                            <td>
                                <button class="btn-custom btn-primary">Edit</button>
                                <button class="btn-custom btn-danger">Delete</button>
                            </td>
                        </tr>
                        <tr>
                            <td>Web Development Bootcamp</td>
                            <td>Jane Smith</td>
                            <td>Web Development</td>
                            <td>$89.99</td>
                            <td><span class="status status-pending">Pending</span></td>
                            <td>
                                <button class="btn-custom btn-primary">Edit</button>
                                <button class="btn-custom btn-danger">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Student Management Section -->
        <div class="container-fluid student-section" id="studentSection">
            <div class="student-header">
                <h2><i class="bi bi-people"></i> Student Management</h2>
                <div class="student-search">
                    <i class="bi bi-search"></i>
                    <input type="text" placeholder="Search students...">
                </div>
            </div>

            <div class="student-table">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>Student ID</th>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Enrolled Courses</th>
                            <th>Join Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sample student rows for demonstration -->
                        <tr>
                            <td>#STU001</td>
                            <td><img src="assets/img/profile-img.jpg" class="student-avatar" alt="Student"></td>
                            <td>John Doe</td>
                            <td>john.doe@email.com</td>
                            <td>+1 234 567 8900</td>
                            <td>3</td>
                            <td>2024-01-15</td>
                            <td><span class="student-status status-active">Active</span></td>
                            <td class="student-actions">
                                <button class="btn btn-primary btn-sm" title="View Details">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button class="btn btn-warning btn-sm" title="Edit">
                                    <i class="bi bi-pencil"></i>
                                </button>
                                <button class="btn btn-danger btn-sm" title="Delete">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>#STU002</td>
                            <td><img src="assets/img/profile-img.jpg" class="student-avatar" alt="Student"></td>
                            <td>Jane Smith</td>
                            <td>jane.smith@email.com</td>
                            <td>+1 234 567 8901</td>
                            <td>2</td>
                            <td>2024-01-10</td>
                            <td><span class="student-status status-inactive">Inactive</span></td>
                            <td class="student-actions">
                                <button class="btn btn-primary btn-sm" title="View Details">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button class="btn btn-warning btn-sm" title="Edit">
                                    <i class="bi bi-pencil"></i>
                                </button>
                                <button class="btn btn-danger btn-sm" title="Delete">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Instructor Management Section -->
        <div class="container-fluid instructor-section" id="instructorSection">
            <div class="instructor-header">
                <h2><i class="bi bi-person-badge"></i> Instructor Management</h2>
                <div class="d-flex gap-3">
                    <div class="instructor-search">
                        <i class="bi bi-search"></i>
                        <input type="text" placeholder="Search instructors...">
                    </div>
                    <button class="btn btn-primary">
                        <i class="bi bi-plus-circle"></i> Add Instructor
                    </button>
                </div>
            </div>

            <div class="instructor-table">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Photo</th>
                            <th>Name</th>
                            <th>Expertise</th>
                            <th>Email</th>
                            <th>Courses</th>
                            <th>Students</th>
                            <th>Rating</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sample instructor rows -->
                        <tr>
                            <td>#INS001</td>
                            <td><img src="assets/img/profile-img.jpg" class="instructor-avatar" alt="Instructor"></td>
                            <td>Dr. Robert Wilson</td>
                            <td>
                                <div class="expertise-tags">
                                    <span>Java</span>
                                    <span>Python</span>
                                    <span>Web Dev</span>
                                </div>
                            </td>
                            <td>robert.wilson@email.com</td>
                            <td>5</td>
                            <td>120</td>
                            <td>
                                <div class="rating-stars">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                    <span class="text-muted">(4.5)</span>
                                </div>
                            </td>
                            <td><span class="student-status status-active">Active</span></td>
                            <td class="instructor-actions">
                                <button class="btn btn-primary btn-sm" title="View Profile">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button class="btn btn-warning btn-sm" title="Edit">
                                    <i class="bi bi-pencil"></i>
                                </button>
                                <button class="btn btn-danger btn-sm" title="Delete">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>#INS002</td>
                            <td><img src="assets/img/profile-img.jpg" class="instructor-avatar" alt="Instructor"></td>
                            <td>Prof. Sarah Johnson</td>
                            <td>
                                <div class="expertise-tags">
                                    <span>Data Science</span>
                                    <span>Machine Learning</span>
                                </div>
                            </td>
                            <td>sarah.johnson@email.com</td>
                            <td>3</td>
                            <td>85</td>
                            <td>
                                <div class="rating-stars">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star"></i>
                                    <span class="text-muted">(4.0)</span>
                                </div>
                            </td>
                            <td><span class="student-status status-active">Active</span></td>
                            <td class="instructor-actions">
                                <button class="btn btn-primary btn-sm" title="View Profile">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button class="btn btn-warning btn-sm" title="Edit">
                                    <i class="bi bi-pencil"></i>
                                </button>
                                <button class="btn btn-danger btn-sm" title="Delete">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Enrollment Management Section -->
        <div class="container-fluid enrollment-section" id="enrollmentSection">
            <div class="enrollment-header mb-4">
                <h2><i class="bi bi-card-checklist"></i> Enrollment Management</h2>
            </div>

            <!-- Statistics Cards -->
            <div class="enrollment-stats">
                <div class="stat-card">
                    <div class="stat-icon" style="background: #e8e5ff; color: #4723d9;">
                        <i class="bi bi-people-fill"></i>
                    </div>
                    <p>Total Enrollments</p>
                    <h3>1,234</h3>
                    <small class="text-success">↑ 12% from last month</small>
                </div>
                <div class="stat-card">
                    <div class="stat-icon" style="background: #fff5e5; color: #fd7e14;">
                        <i class="bi bi-calendar-check"></i>
                    </div>
                    <p>Recent Enrollments</p>
                    <h3>156</h3>
                    <small class="text-muted">Last 7 days</small>
                </div>
                <div class="stat-card">
                    <div class="stat-icon" style="background: #fff3cd; color: #ffc107;">
                        <i class="bi bi-cash-stack"></i>
                    </div>
                    <p>Pending Payments</p>
                    <h3>23</h3>
                    <small class="text-warning">Requires attention</small>
                </div>
                <div class="stat-card">
                    <div class="stat-icon" style="background: #e1f7e3; color: #1fa526;">
                        <i class="bi bi-graph-up"></i>
                    </div>
                    <p>Completion Rate</p>
                    <h3>78%</h3>
                    <small class="text-success">↑ 5% from last month</small>
                </div>
            </div>

            <!-- Filters -->
            <div class="enrollment-filters">
                <div class="row g-3">
                    <div class="col-md-3">
                        <label class="form-label">Date Range</label>
                        <select class="form-select">
                            <option>Last 7 days</option>
                            <option>Last 30 days</option>
                            <option>Last 3 months</option>
                            <option>Custom range</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Course</label>
                        <select class="form-select">
                            <option>All Courses</option>
                            <option>Java Programming</option>
                            <option>Web Development</option>
                            <option>Data Science</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Payment Status</label>
                        <select class="form-select">
                            <option>All</option>
                            <option>Paid</option>
                            <option>Pending</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Status</label>
                        <select class="form-select">
                            <option>All</option>
                            <option>Active</option>
                            <option>Completed</option>
                            <option>Dropped</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Enrollment Table -->
            <div class="enrollment-table">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Student</th>
                            <th>Course</th>
                            <th>Instructor</th>
                            <th>Enrollment Date</th>
                            <th>Payment</th>
                            <th>Progress</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>#ENR001</td>
                            <td>John Doe</td>
                            <td>Java Programming</td>
                            <td>Dr. Robert Wilson</td>
                            <td>2024-01-15</td>
                            <td><span class="status-badge payment-paid">Paid</span></td>
                            <td>
                                <div class="progress-bar">
                                    <div style="width: 75%"></div>
                                </div>
                                <small class="text-muted">75%</small>
                            </td>
                            <td><span class="status-badge status-active">Active</span></td>
                            <td>
                                <button class="btn btn-primary btn-sm" title="View Details">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button class="btn btn-danger btn-sm" title="Cancel">
                                    <i class="bi bi-x-circle"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>#ENR002</td>
                            <td>Jane Smith</td>
                            <td>Web Development</td>
                            <td>Prof. Sarah Johnson</td>
                            <td>2024-01-10</td>
                            <td><span class="status-badge payment-pending">Pending</span></td>
                            <td>
                                <div class="progress-bar">
                                    <div style="width: 30%"></div>
                                </div>
                                <small class="text-muted">30%</small>
                            </td>
                            <td><span class="status-badge status-active">Active</span></td>
                            <td>
                                <button class="btn btn-primary btn-sm" title="View Details">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button class="btn btn-danger btn-sm" title="Cancel">
                                    <i class="bi bi-x-circle"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>#ENR003</td>
                            <td>Mike Johnson</td>
                            <td>Data Science</td>
                            <td>Dr. Robert Wilson</td>
                            <td>2024-01-05</td>
                            <td><span class="status-badge payment-paid">Paid</span></td>
                            <td>
                                <div class="progress-bar">
                                    <div style="width: 100%"></div>
                                </div>
                                <small class="text-muted">100%</small>
                            </td>
                            <td><span class="status-badge status-completed">Completed</span></td>
                            <td>
                                <button class="btn btn-primary btn-sm" title="View Details">
                                    <i class="bi bi-eye"></i>
                                </button>
                                <button class="btn btn-secondary btn-sm" title="Download Certificate">
                                    <i class="bi bi-download"></i>
                                </button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Help Desk Section -->
        <div class="container-fluid helpdesk-section" id="helpdeskSection">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2><i class="bi bi-headset"></i> Help Desk</h2>
                <button class="btn btn-primary">
                    <i class="bi bi-plus-circle"></i> Create New Ticket
                </button>
            </div>

            <!-- Ticket Statistics -->
            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="stat-icon" style="background: #e8e5ff; color: #4723d9;">
                            <i class="bi bi-ticket-detailed"></i>
                        </div>
                        <p>Total Tickets</p>
                        <h3>45</h3>
                        <small class="text-muted">This month</small>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="stat-icon" style="background: #e1f7e3; color: #1fa526;">
                            <i class="bi bi-check-circle"></i>
                        </div>
                        <p>Resolved Tickets</p>
                        <h3>32</h3>
                        <small class="text-success">71% resolution rate</small>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="stat-icon" style="background: #fff3cd; color: #ffc107;">
                            <i class="bi bi-clock"></i>
                        </div>
                        <p>Pending Tickets</p>
                        <h3>8</h3>
                        <small class="text-warning">Requires attention</small>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="stat-card">
                        <div class="stat-icon" style="background: #ffeaea; color: #dc3545;">
                            <i class="bi bi-exclamation-circle"></i>
                        </div>
                        <p>High Priority</p>
                        <h3>5</h3>
                        <small class="text-danger">Immediate action needed</small>
                    </div>
                </div>
            </div>

            <!-- Ticket Filters -->
            <div class="enrollment-filters mb-4">
                <div class="row g-3">
                    <div class="col-md-3">
                        <label class="form-label">Status</label>
                        <select class="form-select">
                            <option>All Tickets</option>
                            <option>Open</option>
                            <option>Pending</option>
                            <option>Closed</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Priority</label>
                        <select class="form-select">
                            <option>All Priorities</option>
                            <option>High</option>
                            <option>Medium</option>
                            <option>Low</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Category</label>
                        <select class="form-select">
                            <option>All Categories</option>
                            <option>Technical</option>
                            <option>Course Content</option>
                            <option>Payment</option>
                            <option>Other</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">Sort By</label>
                        <select class="form-select">
                            <option>Newest First</option>
                            <option>Oldest First</option>
                            <option>Priority</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Ticket List -->
            <div class="ticket-list">
                <!-- High Priority Ticket -->
                <div class="ticket-card">
                    <div class="ticket-header">
                        <h5 class="mb-0">
                            <span class="ticket-priority priority-high"></span>
                            Unable to access course content
                        </h5>
                        <span class="ticket-status status-open">Open</span>
                    </div>
                    <p class="ticket-meta mb-2">
                        Ticket #HD001 | Submitted by John Doe | 2 hours ago
                    </p>
                    <p class="mb-2">I'm unable to access the Java Programming course content. The video player shows an error message...</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="ticket-category">Technical</span>
                        <div>
                            <button class="btn btn-sm btn-primary">Respond</button>
                            <button class="btn btn-sm btn-success">Mark Resolved</button>
                        </div>
                    </div>
                </div>

                <!-- Medium Priority Ticket -->
                <div class="ticket-card">
                    <div class="ticket-header">
                        <h5 class="mb-0">
                            <span class="ticket-priority priority-medium"></span>
                            Payment confirmation not received
                        </h5>
                        <span class="ticket-status status-pending">Pending</span>
                    </div>
                    <p class="ticket-meta mb-2">
                        Ticket #HD002 | Submitted by Sarah Smith | 1 day ago
                    </p>
                    <p class="mb-2">I made the payment for Web Development course but haven't received any confirmation email...</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="ticket-category">Payment</span>
                        <div>
                            <button class="btn btn-sm btn-primary">Respond</button>
                            <button class="btn btn-sm btn-success">Mark Resolved</button>
                        </div>
                    </div>
                </div>

                <!-- Low Priority Ticket -->
                <div class="ticket-card">
                    <div class="ticket-header">
                        <h5 class="mb-0">
                            <span class="ticket-priority priority-low"></span>
                            Certificate name correction
                        </h5>
                        <span class="ticket-status status-closed">Closed</span>
                    </div>
                    <p class="ticket-meta mb-2">
                        Ticket #HD003 | Submitted by Mike Johnson | 3 days ago
                    </p>
                    <p class="mb-2">My name is misspelled on the course completion certificate. Please correct it...</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="ticket-category">Course Content</span>
                        <div>
                            <button class="btn btn-sm btn-secondary">Reopen</button>
                            <button class="btn btn-sm btn-primary">View Details</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    
    <script>
        // Function to switch between sections
        function switchSection(sectionId) {
            // Hide all sections first
            document.getElementById('dashboard').style.display = 'none';
            document.getElementById('studentSection').style.display = 'none';
            document.getElementById('instructorSection').style.display = 'none';
            document.getElementById('enrollmentSection').style.display = 'none';
            document.getElementById('helpdeskSection').style.display = 'none';

            // Show the selected section
            document.getElementById(sectionId).style.display = 'block';

            // Remove active class from all links
            var links = document.querySelectorAll('.side-menu li a');
            links.forEach(function(link) {
                link.classList.remove('active');
            });

            // Add active class to clicked link
            document.getElementById(sectionId + 'Link').classList.add('active');

            // Prevent default link behavior
            event.preventDefault();
        }

        // Set dashboard as active on page load
        window.onload = function() {
            switchSection('dashboard');
        };
    </script>
</body>
</html>