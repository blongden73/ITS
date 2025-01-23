function SetLang(lang) {
	var exdate=new Date();
	exdate.setDate(exdate.getDate() + 7);
	var c_value=escape(lang) + 
	  ("; expires="+exdate.toUTCString() + "; path=/");
    document.cookie="sclang=" + c_value;
	location.reload();
}

function LoadCalTransl() {
	var currentLocation = new String(window.location);
	var n = currentLocation.search('&loadcal=1');
	var newurl = '';
	
	if (n == '-1') {
		newurl = currentLocation + '&loadcal=1';
	} else {
		newurl = currentLocation;
		//newurl = currentLocation.replace("&loadcal=1","");
	}
	if (window.history.pushState) {
		window.history.pushState({path:newurl},'',newurl);
	} else {
		window.history.go(newurl);
	}
	//window.location.href=window.location + '&loadcal=1';
}