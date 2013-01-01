/*
 * SimpleModal Confirm Modal Dialog
 * http://www.ericmmartin.com/projects/simplemodal/
 * http://code.google.com/p/simplemodal/
 *
 * Copyright (c) 2007 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Revision: $Id: confirm.js 97 2008-01-18 06:07:03Z emartin24 $
 *	$('#confirmDialog input:eq(1)').click(function (e) {
 */
var deleteurl;
 function sendurl(id)
	{
		var confirmDialogId="#delurl"+id;
		 deleteurl=$(confirmDialogId).val();		
	}

$(document).ready(function () {
	
		$("a").filter(".confirmDialog").click(function (e){
			e.preventDefault();
			// example of calling the confirm function
			// you must use a callback function to perform the "yes" action
            console.log(deleteurl);
			confirmBox('?', function () {			
					window.location.href = deleteurl;
			});
		});		
});

function confirmBox(message, callback) {	
	$('#confirm').modal({
		close:false, 
		overlayId:'confirmModalOverlay',
		containerId:'confirmModalContainer', 
		onShow: function (dialog) {
			dialog.data.find('.message').append(message);
			
			// if the user clicks "yes"
			dialog.data.find('.yes').click(function () {

				// call the callback
				if ($.isFunction(callback)) {
					callback.apply();
				}
				// close the dialog
				$.modal.close();
			});
		}
	});
}

function validate(message) {	
	$('#validate').modal({
		close:true, 
		overlayId:'confirmModalOverlay',
		containerId:'confirmModalContainer', 
		onShow: function (dialog) {
			dialog.data.find('.message').append(message);
			
			// if the user clicks "yes"
			
		}
	});
}