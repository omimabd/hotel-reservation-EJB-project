	<%@ include file="header.jsp" %>


    <div class="bg-img">
    	<div class="header-container">
    		<h1>Welcome!</h1>
    		<p>You can reserve rooms online via this website.</p>
    	</div>

        <form class="form-inline check-date-form-container" onsubmit="return checkForms();" method="GET" action="Home">
            <div class="form-group mx-sm-3 mb-2">
                  <label class="check-lbl">Check-in date</label>
              <input type="date" name="checkInDate" class="form-control" placeholder="Check-in date">
            </div>

            <div class="form-group mx-sm-3 mb-2">
                  <label class="check-lbl">Check-out date</label>
              <input type="date" class="form-control" name="checkOutDate" placeholder="Check-out date">
            </div>
            <button type="submit" class="btn btn-success mb-2">Check Rooms</button>
          </form>
    </div>
	<%@ include file="footer.jsp" %>

    <script>
        function checkForms() {
            var checkInDate = document.forms[0].elements["checkOutDate"],
                checkOutDate = document.forms[0].elements["checkOutDate"];
            if(checkInDate.value.length === 0) {
                window.alert("Please type the check in date");
                return false;
            }
            if(checkOutDate.value.length === 0) {
                window.alert("Please type the check out date");
                return false;
            }
            
            var checkInDateArray = checkInDate.value.split("-"),
	            checkInDateDays = Number.parseInt(checkInDateArray[0]) * 365 + Number.parseInt(checkInDateArray[1]) * 31 + Number.parseInt(checkInDateArray[2]),
            	dateNow = new Date(),
	         	nowDays = dateNow.getFullYear() * 365 + (dateNow.getMonth() + 1) * 31 + dateNow.getDate(),
	         	diffDate = checkInDateDays - nowDays;

            if (diffDate < 0) {
                result.innerText = "Check in Date is invalid!";
                return false;
            }
            
            var checkOutDateArray = checkOutDate.value.split("-"),
	            checkOutDateDays = Number.parseInt(checkOutDateArray[0]) * 365 + Number.parseInt(checkOutDateArray[1]) * 31 + Number.parseInt(checkOutDateArray[2]);
            diffDate = checkOutDateDays - checkInDateDays;
            
            if (diffDate < 0) {
                result.innerText = "Interval reservation Date is invalid!";
                return false;
            }
            
            return true;
        }
    </script>

