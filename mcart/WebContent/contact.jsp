<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <style>
        .banner {
            background-image: url('path_to_your_banner_image.jpg');
            background-size: cover;
            color: white;
            padding: 100px 0;
            text-align: center;
        }
        .enquiry-form {
            background-color: #f8f9fa;
            padding: 50px 20px;
            border-radius: 8px;
            margin-top: 50px;
        }
        .google-map {
            height: 400px; /* Adjust height as needed */
            margin-top: 50px;
        }
    </style>
</head>
<body>
   
	<section class="banner">
        <div class="container">
            <h1>Contact Us</h1>
            <p>Get in touch with us for any queries or feedback!</p>
        </div>
    </section>

    <!-- Enquiry Form Section -->
    <section class="enquiry-form">
        <div class="container">
            <h2>Enquiry Form</h2>
            <form action="submit_form.jsp" method="POST">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="contact">Contact Number</label>
                    <input type="text" class="form-control" id="contact" name="contact" required>
                </div>
                <div class="form-group">
                    <label for="subject">Subject</label>
                    <input type="text" class="form-control" id="subject" name="subject" required>
                </div>
                <div class="form-group">
                    <label for="message">Message</label>
                    <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </section>

    <!-- Google Map Section -->
    <section class="google-map">
        <!-- Replace with your Google Maps iframe embed code -->
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3237.497096795785!2d-122.40646868476504!3d37.78542179353084!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808580d4e0ebf1b1%3A0x6fc3a47c09f4f8e8!2sGolden%20Gate%20Bridge!5e0!3m2!1sen!2sus!4v1625550748316!5m2!1sen!2sus" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </section>
	
</body>
</html>