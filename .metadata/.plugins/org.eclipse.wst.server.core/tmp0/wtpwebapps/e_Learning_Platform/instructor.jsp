<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Dashboard - E-Learning Platform</title>
    
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

        .brand {
            display: flex;
            align-items: center;
            padding-bottom: 20px;
            border-bottom: 1px solid #e5e7eb;
        }

        .brand i {
            font-size: 1.5rem;
            color: var(--primary);
            margin-right: 10px;
        }

        .brand span {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--dark);
        }

        .side-menu {
            margin-top: 30px;
            list-style: none;
            padding: 0;
        }

        .side-menu li {
            margin-bottom: 10px;
        }

        .side-menu a {
            display: flex;
            align-items: center;
            padding: 10px;
            color: var(--dark);
            text-decoration: none;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .side-menu a:hover,
        .side-menu a.active {
            background: var(--primary);
            color: #fff;
        }

        .side-menu a i {
            font-size: 1.2rem;
            margin-right: 10px;
        }

        /* Content */
        .content {
            margin-left: 260px;
            padding: 30px;
            transition: all 0.4s ease;
        }

        .content-header {
            margin-bottom: 30px;
        }

        .header-title h1 {
            font-size: 1.75rem;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 10px;
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
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-icon {
            width: 40px;
            height: 40px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 15px;
        }

        .card-icon.courses {
            background: #e0e7ff;
            color: var(--primary);
        }

        .card-icon.students {
            background: #dcfce7;
            color: var(--success);
        }

        .card-icon.assignments {
            background: #fef3c7;
            color: var(--warning);
        }

        .card-icon.submissions {
            background: #fee2e2;
            color: var(--danger);
        }

        .card h3 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 5px;
        }

        .card p {
            color: #64748b;
            font-size: 0.875rem;
        }

        /* Tables */
        .table-card {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            margin-bottom: 30px;
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .table-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--dark);
        }

        .action-button {
            padding: 8px 16px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .action-button:hover {
            background: var(--secondary);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e5e7eb;
        }

        th {
            font-weight: 600;
            color: var(--dark);
            background: var(--light);
        }

        td {
            color: #64748b;
        }

        .status {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.875rem;
            font-weight: 500;
        }

        .status-active {
            background: #dcfce7;
            color: var(--success);
        }

        .status-pending {
            background: #fef3c7;
            color: var(--warning);
        }

        .status-graded {
            background: #e0e7ff;
            color: var(--primary);
        }

        .action-icons {
            display: flex;
            gap: 10px;
        }

        .action-icons i {
            cursor: pointer;
            font-size: 1.1rem;
            color: var(--dark);
            transition: all 0.3s ease;
        }

        .action-icons i:hover {
            color: var(--primary);
        }

        /* Responsive */
        @media (max-width: 768px) {
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
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="brand">
            <i class="bi bi-code-square"></i>
            <span>E-Learning</span>
        </div>
        <ul class="side-menu">
            <li><a href="index.jsp"><i class="bi bi-house"></i> Home</a></li>
            <li><a href="#" class="active"><i class="bi bi-grid"></i> Dashboard</a></li>
            <li><a href="#"><i class="bi bi-book"></i> My Courses</a></li>
            <li><a href="#"><i class="bi bi-file-text"></i> Assignments</a></li>
            <li><a href="#"><i class="bi bi-people"></i> Students</a></li>
            <li><a href="#"><i class="bi bi-graph-up"></i> Grades</a></li>
            <li><a href="#"><i class="bi bi-calendar"></i> Schedule</a></li>
            <li><a href="#"><i class="bi bi-person"></i> Profile</a></li>
            <li><a href="#"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
        </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <!-- Header -->
        <div class="content-header">
            <div class="header-title">
                <h1>Instructor Dashboard</h1>
                <p>Welcome back, Professor!</p>
            </div>
        </div>

        <!-- Cards -->
        <div class="cards">
            <div class="card">
                <div class="card-icon courses">
                    <i class="bi bi-book"></i>
                </div>
                <h3>4</h3>
                <p>Active Courses</p>
            </div>
            <div class="card">
                <div class="card-icon students">
                    <i class="bi bi-people"></i>
                </div>
                <h3>120</h3>
                <p>Total Students</p>
            </div>
            <div class="card">
                <div class="card-icon assignments">
                    <i class="bi bi-file-text"></i>
                </div>
                <h3>8</h3>
                <p>Active Assignments</p>
            </div>
            <div class="card">
                <div class="card-icon submissions">
                    <i class="bi bi-inbox"></i>
                </div>
                <h3>25</h3>
                <p>Pending Reviews</p>
            </div>
        </div>

        <!-- Course Table -->
        <div class="table-card">
            <div class="table-header">
                <h2 class="table-title">My Courses</h2>
                <button class="action-button">Add New Course</button>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Course Name</th>
                        <th>Students</th>
                        <th>Start Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Java Programming</td>
                        <td>45 Students</td>
                        <td>Jan 15, 2024</td>
                        <td><span class="status status-active">Active</span></td>
                        <td class="action-icons">
                            <i class="bi bi-pencil-square"></i>
                            <i class="bi bi-eye"></i>
                            <i class="bi bi-trash"></i>
                        </td>
                    </tr>
                    <tr>
                        <td>Web Development</td>
                        <td>38 Students</td>
                        <td>Jan 10, 2024</td>
                        <td><span class="status status-active">Active</span></td>
                        <td class="action-icons">
                            <i class="bi bi-pencil-square"></i>
                            <i class="bi bi-eye"></i>
                            <i class="bi bi-trash"></i>
                        </td>
                    </tr>
                    <tr>
                        <td>Database Management</td>
                        <td>37 Students</td>
                        <td>Jan 20, 2024</td>
                        <td><span class="status status-pending">Upcoming</span></td>
                        <td class="action-icons">
                            <i class="bi bi-pencil-square"></i>
                            <i class="bi bi-eye"></i>
                            <i class="bi bi-trash"></i>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Assignments Table -->
        <div class="table-card">
            <div class="table-header">
                <h2 class="table-title">Recent Assignments</h2>
                <button class="action-button">Create Assignment</button>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Assignment</th>
                        <th>Course</th>
                        <th>Due Date</th>
                        <th>Submissions</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Final Project</td>
                        <td>Java Programming</td>
                        <td>Feb 15, 2024</td>
                        <td>32/45</td>
                        <td><span class="status status-active">Active</span></td>
                        <td class="action-icons">
                            <i class="bi bi-pencil-square"></i>
                            <i class="bi bi-eye"></i>
                            <i class="bi bi-trash"></i>
                        </td>
                    </tr>
                    <tr>
                        <td>Database Design</td>
                        <td>Database Management</td>
                        <td>Feb 10, 2024</td>
                        <td>35/37</td>
                        <td><span class="status status-graded">Graded</span></td>
                        <td class="action-icons">
                            <i class="bi bi-pencil-square"></i>
                            <i class="bi bi-eye"></i>
                            <i class="bi bi-trash"></i>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Scripts -->
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script>
        // Initialize AOS
        AOS.init();
    </script>
</body>
</html>
