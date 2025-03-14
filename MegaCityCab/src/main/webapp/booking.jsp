<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <title>Book a Ride</title>
</head>
<body>
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <h1>Mega City Cab Booking</h1>
            <form method="POST" action="BookingServlet">

                <div class="mb-3">
                    <label for="customerName" class="form-label">Customer Name</label>
                    <input type="text" class="form-control" id="customerName" name="customerName" placeholder="Enter your name">
                </div>
                
                <div class="mb-3">
                    <label for="customerContact" class="form-label">Contact Number</label>
                    <input type="text" class="form-control" id="customerContact" name="customerContact" placeholder="Enter your contact number">
                </div>
                
                <div class="mb-3">
                    <label for="pickupLocation" class="form-label">Pickup Location</label>
                    <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" placeholder="Enter pickup location">
                </div>
                
                <div class="mb-3">
                    <label for="dropLocation" class="form-label">Drop Location</label>
                    <input type="text" class="form-control" id="dropLocation" name="dropLocation" placeholder="Enter drop location">
                </div>
                
                <div class="mb-3">
                    <label for="carType" class="form-label">Car Type</label>
                    <select class="form-select" name="carType" id="carType" aria-label="Default select example">
                        <option value="Sedan">Sedan</option>
                        <option value="SUV">SUV</option>
                        <option value="Mini">Mini</option>
                    </select>
                </div>
                
                <div class="mb-3">
                    <label for="driverID" class="form-label">Assign Driver</label>
                    <select class="form-select" name="driverID" id="driverID">
                        <option value="1">Driver 1</option>
                        <option value="2">Driver 2</option>
                        <option value="3">Driver 3</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Additional Notes</label>
                    <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                </div>

                <div class="mb-3">
                    <label for="date" class="form-label">Booking Date</label>
                    <input type="date" class="form-control" id="date" name="date">
                </div>
                
                <div class="mb-3">
                    <input type="SUBMIT" class="btn btn-primary" value="Submit">
                    <input type="RESET" class="btn btn-success" value="Reset">
                </div>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
</body>
</html>
