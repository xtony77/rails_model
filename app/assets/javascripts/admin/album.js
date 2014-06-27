function ckeck_all_photos(obj){
	var checkAll = obj.checked
	for(var i=0; i< document.form1.elements.length; i++){
		if(document.form1.elements[i].type == "checkbox"){
			document.form1.elements[i].checked = checkAll;
		}
	}
}

function delete_checked_photos(){
	var img_checked = false;
	$("input[name='delete_id_array[]']").each(function(){
		if($(this).prop("checked")){
			img_checked = true;
		}
	});

	if(img_checked){
		var aaa;
		aaa = confirm("Are you sure?");
		if(aaa){
			$("#form1").submit();
		}
	}else{
		alert('please select least one!');
	}
}