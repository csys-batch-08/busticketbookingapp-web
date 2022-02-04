<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

<script
src="https://cdn.jsdelivr.net/npm/sweetalert2@11.3.10/dist/sweetalert2.all.min.js"></script>
<link rel='stylesheet'
href='https://cdn.jsdelivr.net/npm/sweetalert2@10.10.1/dist/sweetalert2.min.css'>

<link rel="stylesheet" type="text/css"
href="https://cdn.datatables.net/1.11.4/css/jquery.dataTables.min.css">
<script
src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<title>Operator List</title>
<link rel="stylesheet" href="css/NavigationAdmin.css">
<link rel="stylesheet" href="css/AdminPages.css">

<style>
    
    </style>
</head>
<body>
	
	<c:set var="update" scope="session" value="${param.updateOperator}" />
	<c:set var="delete" scope="session" value="${param.deleteOperator}" />
	<c:set var="error" scope="session" value="${param.updateError}" />
	<c:set var="error" scope="session" value="${param.deleteError}" />
	
	<c:choose>
	
	<c:when test="${update!=null}">
	<script>
		Swal.fire({
 		icon: 'success',
 		title: 'Updated',
 		showConfirmButton: false,
 		timer: 1500})

	</script>
	</c:when>

	<c:when test="${delete!=null}">
	<script>

		var toastMixin = Swal.mixin({
   		toast: true,
   		icon: 'success',
   		title: 'General Title',
   		animation: false,
   		position: 'top-right',
   		showConfirmButton: false,
   		timer: 3000,
   		timerProgressBar: true,
   		didOpen: (toast) => {
     	toast.addEventListener('mouseenter', Swal.stopTimer)
     	toast.addEventListener('mouseleave', Swal.resumeTimer)
   		}
 		});
   		deleted();
		function deleted(){
			toastMixin.fire({
        	animation: true,
        	title: 'Successfully deleted'
        	});
         }
     </script>
	</c:when>
	
	<c:when test="${deleteerror!=null}">
	<script>
		var toastMixin = Swal.mixin({
   		toast: true,
   		icon: 'success',
   		title: 'General Title',
   		animation: false,
   		position: 'top-right',
   		showConfirmButton: false,
   		timer: 3000,
   		timerProgressBar: true,
   		didOpen: (toast) => {
     	toast.addEventListener('mouseenter', Swal.stopTimer)
     	toast.addEventListener('mouseleave', Swal.resumeTimer)
   		}
 		});
		deleteError();
		function deleteError() {
		toastMixin.fire({
		title : 'cannot be deleted',
		icon : 'error'
		});
		}
	</script>
	</c:when>
	
	</c:choose>

    <div id="homeadmin">
       <ul>
            <li><a href="adminHome.jsp">Home</a></li>
            <li><a href="addBus.jsp">Add Bus</a></li>
            <li><a href="addOperator.jsp">Add Operator</a></li>
            <li><a href="BusList">Bus list</a></li>
            <li><a href="OperatorList">Operator list</a></li>
            <li><a href="UserList">User list</a></li>
            <li><a href="BookingList">Booking list</a></li>
            <li><a href="SeatList">Seat list</a></li>
        </ul>
    </div>

    
        <h1 class="title-heading">Operator Details</h1>
    <div id="operatorlistdiv">
        <table id="table_id">
            <thead>
            	<th>S.No</th>
                <th>Operator Id</th>
                <th>Operator Name</th>
                <th>Operator Email</th>
                <th>Operator Contact</th>
                <th>Operator Age</th>
                <th>Operator Status</th>
                <th>Actions</th>
            </thead>
            <tbody>
           <c:forEach items="${OperatorListAdmin}" var="operator" varStatus="loop">
                <tr>
                	<td>${loop.count }</td>
                	<td>${operator.getOperatorId() }</td>
                    <td>${operator.getOperatorName() }</td>
                    <td>${operator.getOperatorEmail() }</td>
                    <td>${operator.getOperatorContact() }</td>
                    <td>${operator.getOperatorAge() }</td>
                    <td>${operator.getOperatorStatus() }</td>
                    
                    <c:if test="${operator.getOperatorStatus().equals('active') }">
                    <td><button id="editbutton" onclick="editOperator(${operator.getOperatorId()})">Edit</button> / <button id="deletebutton" onclick="deleteOperator(${operator.getOperatorId()})" >Delete</button></td>
                    </c:if>	
                    
           			<c:if test="${operator.getOperatorStatus().equals('inactive') }">
           			<td></td>
           		    </c:if>
                </tr>
                </c:forEach>
                </tbody>
        
        </table>
  </div>
  


	<script type="text/javascript">
	
	function deleteOperator(OperatorId) {
		Swal.fire({
		title: "Are you sure about \n deleting this Operator?",
		   type: "info",
		   showCancelButton: true,
		   confirmButtonText: "Delete It",
		   confirmButtonColor: "#ff0055",
		   cancelButtonColor: "#999999",
		   focusConfirm: false,
		   focusCancel: true
		}).then((result) => {
		 if (result.isConfirmed) {
		   window.location.replace("operatorDelete?info=&operatorId=" + OperatorId);
		 }
		})
		}

	function editOperator(OperatorId){
		window.location.replace("OperatorUpdate?info=&operatorId="  + OperatorId);
	}
	/* function check() {
		var result = confirm("Do you want to delete this operator?");

		if (result == false) {
			event.preventDefault();
		}
	} */
	
	$(document).ready(function() {
		$('#table_id').DataTable();
		});
	</script>

</body>
</html>