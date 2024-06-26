<!DOCTYPE html>
<html lang="en">
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
}

.bill-container {
    width: 800px;
    margin: 20px auto;
    background-color: #fff;
    border: 1px solid #ddd;
    padding: 20px;
}

header {
    display: flex;
    align-items: center;
    border-bottom: 2px solid #000;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

.logo {
    width: 100px;
}

.header-text {
    flex: 1;
    text-align: center;
}

.header-text h1 {
    font-size: 1.5em;
    margin: 0;
}

.section {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.box {
    width: 48%;
    border: 1px solid #000;
    padding: 10px;
    box-sizing: border-box;
}

.box h2 {
    margin-top: 3px;
    font-size: 1.2em;
    margin-bottom: 10px;
    color:black;
    border-bottom: 1px solid #ddd;
    padding-bottom: 5px;
}

.box p {
    font-size: 0.9em;
    margin: 5px 0;
}

.barcode img {
    width: 150px;
    display: block;
    margin: 0 auto;
}

</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electricity Bill</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="bill-container">
        <header>
            <img src="images/MSEDCLlogo.png" alt="Company Logo" class="logo">
            <div class="header-text">
                <h1>Maharashtra State Electricity Distribution Co. Ltd.</h1>
            </div>
        </header>
        
        <div class="section">
            <div class="box">
                <h2>Billing Unit</h2>
                <p>4505/Khed SUB Alandi</p>
            </div>
            <div class="box">
                <h2>Bill Date</h2>
                <%= request.getAttribute("BillDate")%>
            </div>
            <div class="box">
                <h2>Bill Period</h2>
                <p> <%= request.getAttribute("fromdate")%> to <%= request.getAttribute("todate")%></p>
            </div>
        </div>

        <div class="section">
            <div class="box">
                <h2>Consumer No.</h2>
                <p><%= request.getAttribute("consumerNumber") %></p>
            </div>
            <div class="box">
                <h2>Consumer Name</h2>
                <p><%= request.getAttribute("FullName") %></p>
            </div>
            <div class="box">
                <h2>Address</h2>
                <p><%= request.getAttribute("Address") %></p>
            </div>
        </div>

        <div class="section">
            <div class="box">
                <h2>Due Date</h2>
                <p><%= request.getAttribute("BillDueDate") %></p>
            </div>
            <div class="box">
                <h2>Due Amount</h2>
                <p>Rs. <%= request.getAttribute("totalBillAmount") %>.00</p>
            </div>
            <div class="box">
                <h2>After Due Date</h2>
                <p>Rs. <%= request.getAttribute("totalBillAmountAfterDueDate") %>.00</p>
            </div>
        </div>

        <div class="section">
            <div class="box">
                <h2>Meter Details</h2>
                <p>Current Reading: <%= request.getAttribute("currentReading") %></p>
                <p>Previous Reading: <%= request.getAttribute("previousReading") %></p>
                <p>Units Consumed: <%= request.getAttribute("unitsConsumed") %></p>
            </div>
            <div class="box">
                <h2>Charges</h2>
                <p>Fixed Charges: 0.00</p>
                <p>Energy Charges: <%= request.getAttribute("totalBillAmount") %>.00</p>
                <p>Wheeling Charges: 0.00</p>
                <p>Electricity Duty: 0.00</p>
                <p>FAC: 0.00</p>
                <p>Other Charges: 0.00</p>
                <p>Total Charges: <%= request.getAttribute("totalBillAmount") %></p>
            </div>
        </div>

        <div class="section">
            <div class="box">
                <h2>Payment Information</h2>
                <p>If Paid by Due Date: <%= request.getAttribute("totalBillAmount") %>.00</p>
                <p>If Paid After Due Date: <%= request.getAttribute("totalBillAmountAfterDueDate") %>.00</p>
            </div>
            <div class="box barcode">
                <h2>Scan to Pay</h2>
                <img src="images/ScanQRDBMS.jpg" alt="QR Code">
            </div>
        </div>
         <!--  <form action="GenerateBillServlet" method="post">
            <input type="hidden" name="month" value="<%= request.getParameter("month") %>">
            <input type="hidden" name="year" value="<%= request.getParameter("year") %>">
            <button type="submit">Download PDF</button>
        </form> -->
    </div>
</body>
</html>