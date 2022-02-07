/**
 * 
 */

		function today() {
			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
			var yyyy = today.getFullYear();
			var yyyy1 = today.getFullYear() - 90;
			mindate = yyyy1 + '-' + mm + '-' + dd;
			maxdate = yyyy + '-' + mm + '-' + dd;
			document.getElementById("dob").setAttribute("max", maxdate);
			document.getElementById("dob").setAttribute("min", mindate);
		}
		function dayBefore(){
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
        var yyyy = today.getFullYear();
        var yyyy1= today.getFullYear()+10;
    maxdate =yyyy1 + '-' + mm + '-'+ dd  ;
    mindate =yyyy + '-' + mm + '-'+ dd  ;
    document.getElementById("date").setAttribute("max",maxdate);
    document.getElementById("date").setAttribute("min",mindate);
    }

function popupMessages(infoMessage) {

	const message = infoMessage;

	switch (message) {

		case "Added successfully":
			Swal.fire({
				icon: 'success',
				title: message,
				showConfirmButton: false,
				timer: 1500
			})
			break;
			
			case "Updated successfully":
			Swal.fire({
				icon: 'success',
				title: message,
				showConfirmButton: false,
				timer: 1500
			})
			break;
			
			case "Booked successfully":
			Swal.fire({
				icon: 'success',
				title: message,
				showConfirmButton: false,
				timer: 3000
			})
			break;
			
			case "Registered successfully":
			Swal.fire({
				icon: 'success',
				title: message,
				showConfirmButton: false,
				timer: 3000
			})
	break;

			case "Deleted successfully":
Swal.fire({
				icon: 'success',
				title: 'Successfully deleted',
				showConfirmButton: false,
				timer: 1500
			})
break;

		case "Wrong Ticket Number":
		var toastMixin = Swal.mixin({
 	   		toast: true,
 	   		icon: 'failure',
 	   		title: 'General Title',
 	   		animation: false,
 	   		position: 'center',
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
 	        	title: message
 	        	});
 	         }
	break;

case "Ticket Already Cancelled":
var toastMixin = Swal.mixin({
 	   		toast: true,
 	   		icon: 'failure',
 	   		title: 'General Title',
 	   		animation: false,
 	   		position: 'center',
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
 	        	title: message
 	        	});
 	         }
break;

case "Bus Departure Date Ended" :
var toastMixin = Swal.mixin({
 	   		toast: true,
 	   		icon: 'failure',
 	   		title: 'General Title',
 	   		animation: false,
 	   		position: 'center',
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
 	        	title: message
 	        	});
 	         }
break;

case "Error":
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
		title : 'Error',
		icon : 'error'
		});
		}
		break;

	case "Seats are unavailable":
	Swal.fire({
		title: "Oops!",
		text: "Seats are unavailable",
	    position: "center",
	    /* background: "linear-gradient(red, brown)", 
	    color: "white",*/
	    allowOutsideClick: false,
	    allowEscapeKey: false,
	    allowEnterKey: false,
	    showConfirmButton: false,
	    showCancelButton: false,
	    timer: 3000
	  });
break;

	case "This account already register":
	console.log("kkjijsjsjs");
		var toastMixin = Swal.mixin({
 	   		toast: true,
 	   		icon: 'failure',
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
 	        	title: message
 	        	});
 	         }
	break;

	}
}