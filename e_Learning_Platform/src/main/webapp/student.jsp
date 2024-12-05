<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - E-Learning Platform</title>
    
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

        .card-icon.assignments {
            background: #dcfce7;
            color: var(--success);
        }

        .card-icon.grades {
            background: #fef3c7;
            color: var(--warning);
        }

        .card-icon.deadlines {
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

        .status-completed {
            background: #e0e7ff;
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
                <h1>Student Dashboard</h1>
                <p>Welcome back, Student!</p>
            </div>
        </div>

        <!-- Cards -->
        <div class="cards">
            <div class="card">
                <div class="card-icon courses">
                    <i class="bi bi-book"></i>
                </div>
                <h3>5</h3>
                <p>Enrolled Courses</p>
            </div>
            <div class="card">
                <div class="card-icon assignments">
                    <i class="bi bi-file-text"></i>
                </div>
                <h3>3</h3>
                <p>Active Assignments</p>
            </div>
            <div class="card">
                <div class="card-icon grades">
                    <i class="bi bi-graph-up"></i>
                </div>
                <h3>85%</h3>
                <p>Average Grade</p>
            </div>
            <div class="card">
                <div class="card-icon deadlines">
                    <i class="bi bi-calendar"></i>
                </div>
                <h3>2</h3>
                <p>Upcoming Deadlines</p>
            </div>
        </div>

        <!-- Course Table -->
        <div class="table-card">
            <div class="table-header">
                <h2 class="table-title">My Courses</h2>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Course Name</th>
                        <th>Instructor</th>
                        <th>Progress</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Java Programming</td>
                        <td>John Doe</td>
                        <td>75%</td>
                        <td><span class="status status-active">In Progress</span></td>
                    </tr>
                    <tr>
                        <td>Web Development</td>
                        <td>Jane Smith</td>
                        <td>100%</td>
                        <td><span class="status status-completed">Completed</span></td>
                    </tr>
                    <tr>
                        <td>Database Management</td>
                        <td>Mike Johnson</td>
                        <td>30%</td>
                        <td><span class="status status-pending">Just Started</span></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Assignment Table -->
        <div class="table-card">
            <div class="table-header">
                <h2 class="table-title">Recent Assignments</h2>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Assignment</th>
                        <th>Course</th>
                        <th>Due Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Java Project</td>
                        <td>Java Programming</td>
                        <td>2024-01-20</td>
                        <td><span class="status status-pending">Pending</span></td>
                    </tr>
                    <tr>
                        <td>HTML/CSS Assignment</td>
                        <td>Web Development</td>
                        <td>2024-01-25</td>
                        <td><span class="status status-active">In Progress</span></td>
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
