
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/main.dwt.asp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- #BeginEditable "doctitle" -->
<title>Availability and bookings for In the Stix</title>
<!-- #EndEditable -->
<link href="../css/availability_styles.css" rel="stylesheet" type="text/css" />
<link href="../css/availability_styles_print.css" rel="stylesheet" type="text/css" media="print" />
<!-- #BeginEditable "head" -->
<script type="text/javascript" src="../js/availability_calendars.js"></script>
<script type="text/javascript" src="../js/scriptaculous-js-1.8.2/lib/prototype.js"></script>
<script type="text/javascript" src="../js/scriptaculous-js-1.8.2/src/scriptaculous.js"></script>
<script type="text/javascript" src="../js/scriptaculous-js-1.8.2/src/slider.js"></script>
<link rel="stylesheet" href="../js/dhtmlwindow/dhtmlwindow_grid.css" type="text/css" />
<script type="text/javascript" src="../js/dhtmlwindow/dhtmlwindow.js"></script>
<script type="text/javascript" src="../js/DateFormat.js"></script>

<script src="/js/alertify/alertify.min.js"></script>
<link rel="stylesheet" href="/js/alertify/alertify.core.css" type="text/css" />
<link rel="stylesheet" href="/js/alertify/alertify.default.css" type="text/css" />


<script type="text/javascript">
function sd(dDate,cottageID) {
	$("startdate").value = dDate;
	$('cottageID').value = cottageID;

	var url = "/ajax/avail_grid_price.asp?cottageID="+cottageID+"&startdate="+$("startdate").value+"&enddate="+$("enddate").value+"&adults="+$("grid_adults").value+"&children="+$("grid_children").value+"&infants="+$("grid_infants").value+"&siteID=" + $('siteID').value+"&ownerID=" + $('ownerID').value;

	if (typeof(ga) != 'undefined') {
	    ga('send', 'pageview', escape(url));
	    if ($('numbernights')) {
	        if ($('numbernights').value != '0') {
	            ga('send', 'event', 'sc-date-check', $('startdate').value, $('numbernights').value + ' nights', Number($('numbernights').value));
	        }
	    }
	}

	if (typeof (_gaq) != 'undefined') {
	    _gaq.push(['_trackPageview', escape(url)]);
	    if ($('numbernights')) {
	        if ($('numbernights').value != '0') {
	            _gaq.push(['_trackEvent','sc-date-check', $('startdate').value, $('numbernights').value + ' nights', Number($('numbernights').value)]);
	        }
	    }
	}

	var ajaxwin=dhtmlwindow.open("ajaxbox", "ajax",url + "&ga_a=" + $('ga_a').value + "&ga_b=" + $('ga_b').value + "&ga_c=" + $('ga_c').value + "&ga_z=" + $('ga_z').value + "&ga_v=" + $('ga_v').value, "Your date selection", "width=400px,height=400px,resize=0,scrolling=1,center=1", "recal")

	ajaxwin.onclose=function() {
		$("cottageID").value = '';
		$("startdate").value = '';
		$("enddate").value = '';
		$("pax").value = '0';
		$("sDate").value = '';
		$("cottageID").value = '';
		$("numbernights").selectedIndex = 0;
		return true;
	}
}
</script>
<link rel="stylesheet" href="../css/grid.css" type="text/css" />

<link rel="stylesheet" href="../css/availability_calendar_2.css" type="text/css" />


<style type="text/css">

#showprogress {
	text-align: center;
	padding: 25px;
}

.b_b_n div.y, .a_a_n div.y { border-bottom: 3px solid #D35146; position:relative; top: -6px; visibility: hidden; }

div#grid_frame {
	float: left;
	width: 500px;
	height:256px;
	border: 1px solid #ccc;
	overflow: hidden;
	margin-bottom:0;
	}

.cottage_list {
	border-collapse: collapse;
	font-size: 10px;
	font-family: Arial, Helvetica, sans-serif;
}

.cottage_list td {
	border: 1px solid silver;
	border-right: none;
}

.cottage_list th {
	border-top: 2px solid #FFF;
	padding: 4px 0;
	font-size: 10px;
}

.cottage_list th.col_top {
	padding: 3px 0;
	border-top: 1px solid #FFF;
}

.cottage_list td.spacer {
	border-left: none;
}

.cottage_list td.spacer img {
	display: block;
}

.grid_header {
	padding: 5px 0;
	font-size: 10px;
}

#sc_property_info {
	text-align:  left;
}

#info_box {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	text-align: left;
	padding: 6px;
}

#info_box h1 {
	font-size: 14px;
	padding: 6px 0;
	font-family: Arial, Helvetica, sans-serif;
}

#grid_selected {
	background-color: yellow;
	padding: 5px;
}

.scroll_td {

}

.scrolllinks {

}
</style>
<style type="text/css">
img { border: none;	}

#track1 {
	width: 100%;
	height: 15px;
	background-color:#ccc;
	background: transparent url(slider/t1-background.gif) repeat-x;
	border:1px solid #cccccc;
	}

#track2 {
	width: 100%;
	height: 15px;
	background-color:#ccc;
	background: transparent url(slider/t1-background.gif) repeat-x;
	border:1px solid #cccccc;
	}

#handle1 {
	width: 20px;
	height: 15px;
	/*background-color: #333333;*/
	/*cursor: move;*/
	cursor: pointer; cursor: hand;
	}

#handle2 {
	width: 20px;
	height: 15px;
	/*background-color: #333333;*/
	/*cursor: move;*/
	cursor: pointer; cursor: hand;
	}

#sc_title { margin: 0; }
#sc_pagewidth { border: none; }


/* Cheap fix for purple bar being a few pixels off top */

.a_a_y div.y,
.a__y div.y,
.a_b_y div.y,
.b_a_y div.y,
.bp_a_y div.y,
.a_bp_y div.y,
.a_as_y div.y,
.as_as_y div.y,
.as_a_y div.y,
.as__y div.y,
.as_b_y div.y,
.b_as_y div.y,
.as_bp_y div.y,
.bp_as_y div.y,
.a_a_y div.y_d,
.a__y div.y_d,
.a_b_y div.y_d,
.b_a_y div.y_d,
.bp_a_y div.y_d,
.a_bp_y div.y_d,
.a_as_y div.y_d,
.as_as_y div.y_d,
.as_a_y div.y_d,
.as__y div.y_d,
.as_b_y div.y_d,
.b_as_y div.y_d,
.as_bp_y div.y_d,
.bp_as_y div.y_d,
.b__ div.y,
.b_b_ div.y
{
	position:relative;top:0;
}
</style>

<!--[if lt IE 7]><style>
/* style for IE6 + IE5.5 + IE5.0 */
.gainlayout { height: 0; }
</style><![endif]-->
<!--[if IE 7]><style>
.gainlayout { zoom: 1; }
</style><![endif]-->

<style type="text/css">
@import url(https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css);
@import url("//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css");
@import url('https://fonts.googleapis.com/css?family=Karla|Roboto|Playfair+Display');

@font-face {
	font-family: 'AvantGardeLT-Book';
	font-style: normal;
	src: url('/fonts/AvantGardeLT-Book.eot');
	src: local('AvantGardeLT-Book'), url('/fonts/AvantGardeLT-Book.eot') format('eot'), url('/fonts/AvantGardeLT-Book.ttf') format('ttf'), url('/fonts/AvantGardeLT-Book.woff') format('woff'), url('/fonts/AvantGardeLT-Book.woff2') format('woff2'); 
}

body{
	overflow: visible;
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    background-color: #fff;
    letter-spacing: 0;
    position: relative;
    font-weight: 300;
    margin: 0px;
    padding: 0px;
    min-width: 700px;
    font-weight: normal;
    font-size: 16px;
    line-height: 1.4;
    color: #565a5c;
    font-family: AvantGardeLT-Book;
}

div#sc_wrapper{
	width: 100%;
	margin: auto;
	height: 100%;
    left: 0;
    top: 0;
}

div#sc_content{
	width: 950px;
	margin: auto;
}

#sc_grid_table {
width: 900px;
margin: 0 auto;
}

.sc_grid_track_container {
max-width: 800px;
}

#sc_grid_outer {
max-width: 800px;
}

div#grid_frame {
width: 100%;
}

div#sc_ownerheader{
	margin: auto;
	overflow: visible;
	position: relative;
	background-color: transparent;
	width: 100%;
	height: 50vh;
}

div#sc_ownerfooter{
	margin: auto;
	overflow: visible;
	position: relative;
	width: 100%;
}
		
div#sc_footer{
	margin: auto;
	position: relative;
	background: #FFF;
	border: none;
	color: #000;
	text-align: center;
	font-weight: normal;
	font-size: 60%;
}

div#sc_footer a{
	color: #000;
}

div#sc_pagewidth{
	width: 100%;
	background-color: transparent;
	border: none;
	margin-top: 0px;
	font-size: 100%;
}

div#sc_maincol{
	margin: auto;
	background-color: white;
	overflow-x: auto;
	position: relative;
	width: 100%;
	font-size: 80%;
}

div#sc_title{
	background-color: transparent;
	border: none;
	margin: 60px 0px 0px 0px;
}

div#sc_ssl_logo{
	display: none;
}

#sc_maincol h1{
	color: #a15e3b;
	font-weight: 500;
	font-size: 30px;
	font-family: AvantGardeLT-Book;
	text-align: center;
	margin-top: 30px !important;
}

td#key_text{
	font-family: AvantGardeLT-Book;
	color: #444444;
	font-size: 17px;
	font-weight: bold;
}

div#sc_select_date_cal{
	font-family: AvantGardeLT-Book;
	color: #444444;
	font-size: 17px;
	font-weight: bold;
}

form#date_form{
	background-color: transparent;
	border: none;
}

div#sc_trans_icons{
	display: none;
}

div#loading{
	padding-bottom: 50px;
}

div#paymentSecurityWrap{
	position: relative;
	background: transparent;
	padding-left: 10px;
}

.nav-open #menu {
    height: 500px;
}

#menu {
    height: 0;
    overflow: hidden;
    background: url(https://c621446.ssl.cf3.rackcdn.com/temp/20331/menu-background.gif) no-repeat bottom center;
    background-size: cover;
    transition: 0.5s height cubic-bezier(0.175, 0.885, 0.32, 1.275);
    position: relative;
}

#menu .menu-items ul {
    padding: 0;
    text-align: center;
    margin: 0;
    position: absolute;
    top: 50%;
    left: 0;
    width: 100%;
    transform: translateY(-60%);
}

#menu .menu-items ul li {
    display: inline-block;
    margin: 0 15px;
    font-size: 16px;
    font-weight: 700;
    letter-spacing: 0.1em;
}


#menu .menu-items ul li a {
    color: #a15e3b;
    text-transform: uppercase;
    transition: .25s color ease-in-out 0s;
}

.menu-item a.menu-image-title-above, .menu-item a.menu-image-title-below {
    text-align: center;
}

#menu .menu-items ul li a:hover {
    color: #3e1600;
    text-decoration: none;
}

.menu-item a.menu-image-title-below.menu-image-not-hovered img, .menu-item a.menu-image-hovered.menu-image-title-below .menu-image-hover-wrapper {
    display: block;
    padding-bottom: 10px;
    margin: 0 auto;
}

#menu .menu-items ul li img {
    width: 100px;
    height: auto;
}

/*.menu-item a.menu-image-hovered img.hovered-image, .menu-item a.menu-image-hovered:hover img.menu-image {
    opacity: 0;
    transition: opacity 0.25s ease-in-out 0s;
}*/

.menu-item a img {
    border: none;
    box-shadow: none;
    vertical-align: middle;
    width: auto;
    display: inline;
}

#menu .menu-items ul li img {
    width: 100px;
    height: auto;
}

.menu-item a.menu-image-hovered:hover img.hovered-image {
    opacity: 1;
}

.menu-item a.menu-image-hovered img.hovered-image, .menu-item a.menu-image-hovered:hover img.menu-image {
    fill: #FFF;
    transition: .25s fill ease-in-out 0s;
}

.menu-item a img {
    border: none;
    box-shadow: none;
    vertical-align: middle;
    width: auto;
    display: inline;
}

.menu-item a.menu-image-title-above, .menu-item a.menu-image-title-below {
    text-align: center;
}

#main {
    min-height: 100vh;
    position: relative;
}

header {
    padding-top: 30px;
    position: relative;
}

header .logo {
    margin-top: 40px;
    display: block;
}

svg {
    display: block;
    height: 100% !Important;
    vertical-align: top;
    max-height: 800px;
    margin: auto;
}

.background {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: -1;
    background: black;
}

.slick-slider {
    box-sizing: border-box;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-touch-callout: none;
    -khtml-user-select: none;
    -ms-touch-action: pan-y;
    touch-action: pan-y;
    -webkit-tap-highlight-color: transparent;
}

.slick-list {
    overflow: hidden;
    margin: 0;
    padding: 0;
}

.slick-slider .slick-list, .slick-slider .slick-track {
    -webkit-transform: translate3d(0,0,0);
    -moz-transform: translate3d(0,0,0);
    -ms-transform: translate3d(0,0,0);
    -o-transform: translate3d(0,0,0);
    transform: translate3d(0,0,0);
}

.slick-list, .slick-slider, .slick-track {
    position: relative;
    display: block;
}

.slick-track {
    top: 0;
    left: 0;
}

.slick-list, .slick-slider, .slick-track {
    position: relative;
    display: block;
}

.slick-slide {
    display: none;
    height: 100%;
    min-height: 1px;
}

.slick-initialized .slick-slide {
    display: block;
}

.background .slide-image {
    background-size: cover;
    background-attachment: fixed;
    height: 100vh;
    background-position: top center;
}

svg {
    max-height: 800px;
    margin: auto;
}

.btn-group-vertical>.btn-group:after, .btn-group-vertical>.btn-group:before, .btn-toolbar:after, .btn-toolbar:before, .clearfix:after, .clearfix:before, .container-fluid:after, .container-fluid:before, .container:after, .container:before, .dl-horizontal dd:after, .dl-horizontal dd:before, .form-horizontal .form-group:after, .form-horizontal .form-group:before, .modal-footer:after, .modal-footer:before, .nav:after, .nav:before, .navbar-collapse:after, .navbar-collapse:before, .navbar-header:after, .navbar-header:before, .navbar:after, .navbar:before, .pager:after, .pager:before, .panel-body:after, .panel-body:before, .row:after, .row:before {
    display: table;
    content: " ";
}

.background.slick-initialized.slick-slider{
	position: absolute;
	top: 0px;
}

.burger {
    cursor: pointer;
    position: absolute;
    top: 30px;
    right: 30px;
    z-index: 11;
    width: 40px;
    height: 30px;
    background: url(https://c621446.ssl.cf3.rackcdn.com/temp/20331/burger.png) no-repeat top right;
    background-size: contain;
}

.close_burger {
    cursor: pointer;
    position: absolute;
    top: 30px;
    right: 30px;
    z-index: 11;
    width: 40px;
    height: 30px;
    background: url(https://c621446.ssl.cf3.rackcdn.com/temp/20331/burger-close.png) no-repeat top right;
    background-size: contain;
    display: none;
}

#menu .menu-items ul li a:hover {
    color: #3e1600;
    text-decoration: none;
}

.row path{
	fill: #FFF;
}

</style>

<script type="text/javascript">
function FrameSrc() {
$('track1table').hide();
$('track2table').hide();

$("startdate").value = '';
$("enddate").value = '';

var data = 'startdate='+escape($('startmonth').value);
data += '&siteID='+escape($('siteID').value);
data += '&ownerID='+escape($('ownerID').value);
data += '&highlight=false';
data += '&cottageID=';
data += '&managerID='+escape($('managerID').value);
data += '&typeID='+escape($('typeID').value);
data += '&groupID='+0;

var cacheURL = '/site-cache/' + $('siteID').value + '/availability_grid_frame/' + escape($('startmonth').value) + '_' + escape($('siteID').value) + '_' + escape($('ownerID').value) + '_false_0_' + escape($('managerID').value) + '_' + escape($('typeID').value) + '_0.htm';

//new Ajax.Updater('t1', 'availability_grid_frame.asp', { method: 'get', parameters: data,  onLoading: SearchLoading(), onComplete: getResponse, evalScripts: true });
new Ajax.Updater('t1', cacheURL, { method: 'get',  onLoading: SearchLoading(), onComplete: getResponse, evalScripts: true });

}

/////////////////////// Loading spinner ///////////////////

function SearchLoading() {
$('t1').innerHTML = '<div id="showprogress"><img src="../images/loading.gif" /><br />Searching for availability</div>';
}

/////////////////////// Process Ajax response ///////////////////

function getResponse(oReq) {
  $('t1').innerHTML = oReq.responseText;

	//var contentDiv = document.getElementById("sc_maincol");
	//var curr_width = contentDiv.style.width;
	//alert(curr_width);
	//document.getElementById("grid_frame").style.width = curr_width - 20;

	//setWidth('sc_content','grid_frame')
	//setWidth('sc_content','t1c')
	//setWidth('sc_content','t2c')


	$('track1table').show();
	$('track2table').show();

	// Set slider values to zero
	slider1.setValue(0);
	slider2.setValue(0);

	// Scroller
	hookEvent('grid_frame', 'mousewheel', printInfo);

}

function setWidth(whichDiv,toDiv){
    var theDiv = document.getElementById(whichDiv);
    var currWidth = parseInt(getStyle(theDiv, "width"));
    var newWidth = currWidth - 170 //+ parseInt(addToWidth);
    setStyle(toDiv, "width", newWidth + "px");
}

function getStyle(el, style) {
   if(!document.getElementById) return;

     var value = el.style[toCamelCase(style)];

    if(!value)
        if(document.defaultView)
            value = document.defaultView.
                 getComputedStyle(el, "").getPropertyValue(style);

        else if(el.currentStyle)
            value = el.currentStyle[toCamelCase(style)];

     return value;
}

function setStyle(objId, style, value) {
    document.getElementById(objId).style[style] = value;
}

function toCamelCase( sInput ) {
    var oStringList = sInput.split('-');
    if(oStringList.length == 1)
        return oStringList[0];
    var ret = sInput.indexOf("-") == 0 ?
       oStringList[0].charAt(0).toUpperCase() + oStringList[0].substring(1) : oStringList[0];
    for(var i = 1, len = oStringList.length; i < len; i++){
        var s = oStringList[i];
        ret += s.charAt(0).toUpperCase() + s.substring(1)
    }
    return ret;
}

function PropertyInfo(id,name) {

  var ajaxwin=dhtmlwindow.open("ajaxbox", "ajax", "../ajax/avail_grid_info.asp?cottageID="+id+'&siteID=42540&transDate='+$('startdate').value+'&ownerID=20331', "Property information", "width=400px,height=400px,resize=0,scrolling=1,center=1", "recal")

}

function FrameDates() {
	var nights = parseInt($('numbernights').value);
	var cottageID = $('cottageID').value;

	var sDate = $('startdate').value;
	var date1 = sDate.split("-");
	var startDate = new Date(date1[0], date1[1]-1, date1[2]);

	var dDate = startDate.setDate( startDate.getDate() + nights );

	var xDate = startDate.format("yyyy-mm-dd");

	$('enddate').value = xDate;

	sd(sDate,cottageID);
}
</script>
<script type="text/javascript">
function MaxPax(sleeps) {

	var totalPax = parseInt(document.getElementById('adults').value)

	if ($('children')) {
		totalPax += parseInt(document.getElementById('children').value);
	}

	if (totalPax > sleeps) {
		if ($('children')) {
			if ($('infants')) {
				alertify.alert('This property only sleeps a total of ' + sleeps + ' people.  \n\nYou have selected a total of ' + totalPax + ' adults and children. \n\nPlease amend the total number of adults and children (infants do not count towards the total).');
			} else {
				alertify.alert('This property only sleeps a total of ' + sleeps + ' people.  \n\nYou have selected a total of ' + totalPax + ' adults and children. \n\nPlease amend the total number of adults and children.');
			}
			document.getElementById('children').value = 0;
		} else {
			if ($('infants')) {
				alertify.alert('This property only sleeps a total of ' + sleeps + ' people.  \n\nYou have selected a total of ' + totalPax + ' adults. \n\nPlease amend the total number of adults (infants do not count towards the total).');
			} else {
				alertify.alert('This property only sleeps a total of ' + sleeps + ' people.  \n\nYou have selected a total of ' + totalPax + ' adults. \n\nPlease amend the total number of adults.');
			}
		}
		return false;
	}
}

function SetPax() {

	$('grid_adults').value = $('adults').value;

	if ($('children')) {
		$('grid_children').value = $('children').value;
	}

	if ($('infants')) {
		$('grid_infants').value = $('infants').value;
	}

	sd($('startdate').value,$('cottageID').value);
}
</script>
	
		<style type="text/css">
		.a_a_n .diaggradientback, .a_as_n .diaggradientback, .a__n .diaggradientback, .as_as_n .diaggradientback, .as_a_n .diaggradientback, .as__n .diaggradientback {
			/* available */
			background: #038503;


			position:absolute;
			top: 0;
			left: 0;
			width:20px!important;
			height:20px!important;
			overflow:hidden;
		}
		.a_a_n .diaggradientfront, .a_as_n .diaggradientfront, .a__n .diaggradientfront, .as_as_n .diaggradientfront, .as_a_n .diaggradientfront, .as__n .diaggradientfront {
			position:absolute;
			top: 0px;
			left: 0;
			width:20px!important;
			height:20px!important;
			overflow:hidden;

			filter: progid:DXImageTransform.Microsoft.gradient(GradientType='0', startColorstr='#038503', endColorstr='#038503');
		}

		.a_a_y .diaggradientback, .a_as_y .diaggradientback, .a__y .diaggradientback, .as_as_y .diaggradientback, .as_a_y .diaggradientback, .as__y .diaggradientback {
			/* solo Green gradiant - available*/
			background: #038503;


			position:absolute;
			top: 0px;
			left: 0;
			width:20px!important;
			height:20px!important;
			overflow:hidden;
		}
		.a_a_y .diaggradientfront, .a_as_y .diaggradientfront, .a__y .diaggradientfront, .as_as_y .diaggradientfront, .as_a_y .diaggradientfront, .as__y .diaggradientfront {
			position:absolute;
			top: 0px;
			left: 0;
			width:20px!important;
			height:20px!important;
			overflow:hidden;

			filter: progid:DXImageTransform.Microsoft.gradient(GradientType='0', startColorstr='#038503', endColorstr='#038503');
		}

		.b_b_n .diaggradientback, .b_bp_n .diaggradientback, .b__n .diaggradientback, .b_b_y .diaggradientback, .b_bp_y .diaggradientback, .b__y .diaggradientback, .b__ .diaggradientback, .b_b_ .diaggradientback  {
			/* booked */
			background: #AB0000;


			position:absolute;
			top: 0px;
			left: 0;
			width:20px!important;
			height:20px!important;
			overflow:hidden;
		}
		.b_b_n .diaggradientfront, .b_bp_n .diaggradientfront, .b__n .diaggradientfront, .b_b_y .diaggradientfront, .b_bp_y .diaggradientfront, .b__y .diaggradientfront, .b__ .diaggradientfront, .b_b_ .diaggradientfront {
			position:absolute;
			top: 0px;
			left: 0;
			width:20px!important;
			height:20px!important;
			overflow:hidden;

			filter: progid:DXImageTransform.Microsoft.gradient(GradientType='0', startColorstr='#AB0000', endColorstr='#AB0000');
		}


		.bp_bp_n .diaggradientback, .bp__n .diaggradientback, .bp_bp_y .diaggradientback, .bp__y .diaggradientback  {
			/* solo blue gradient - provisionally booked */
			background: #3894C5;

			position:absolute;
			top: 0px;
			left: 0;
			width:20px!important;
			height:20px!important;
			overflow:hidden;
		}
		.bp_bp_n .diaggradientfront, .bp__n .diaggradientfront, .bp_bp_y .diaggradientfront, .bp__y .diaggradientfront {
			position:absolute;
			top: 0px;
			left: 0;
			width:20px!important;
			height:20px!important;
			overflow:hidden;

			filter: progid:DXImageTransform.Microsoft.gradient(GradientType='0', startColorstr='#3894C5', endColorstr='#3894C5');
		}

		/* Key */
		.cal_sample_cell span#key_available, .cal_sample_cell span#key_start, .cal_sample_cell span#key_sb {
			background: #038503;
		}

		.cal_sample_cell span#key_booked  {
			/* booked */
			background: #AB0000;
		}

		.cal_sample_cell span#key_sb_break {
			background: #3894C5;
		}

		.cal_sample_cell span#key_changeover {
			background: #038503;
			background-image: url(../images/gradientcalendars/sites/42540-b_a.jpg);
			background-position: center;
			background-repeat: no-repeat;
		}


		/* Mixed colour images */
		.as_b_n, .a_b_n {
			/* Top-left red, bottom-right green */
			background-image: url(../images/gradientcalendars/sites/42540-a_b.jpg);
			background-position: center;
			background-repeat: no-repeat;

			text-align: center;
		}
		.as_b_y {
			/* Top-left red, bottom-right green */
			background: url(../images/gradientcalendars/sites/42540-a_b.jpg) center no-repeat;
			text-align: center;
			cursor: pointer;
		}
		.a_b_y {
			/* Top-left red, bottom-right green */
			background-image: url(../images/gradientcalendars/sites/42540-a_b.jpg);
			background-position: center;
			background-repeat: no-repeat;
			text-align: center;
			cursor: pointer;
		}

		.as_bp_n, .a_bp_n {
			background-image: url(../images/gradientcalendars/sites/42540-a_bp.jpg);
			background-position: center;
			background-repeat: no-repeat;
			text-align: center;
		}
		.as_bp_y, .a_bp_y  {
			background-image: url(../images/gradientcalendars/sites/42540-a_bp.jpg);
			background-position: center;
			background-repeat: no-repeat;
			text-align: center;
			cursor: pointer;
		}

		.b_as_n, .b_a_n {
			background-image: url(../images/gradientcalendars/sites/42540-b_a.jpg);
			background-position: center;
			background-repeat: no-repeat;
			text-align: center;
		}
		.b_as_y, .b_a_y {
			/* Top-Left green, bottom-right red */
			background-image: url(../images/gradientcalendars/sites/42540-b_a.jpg);
			background-position: center;
			background-repeat: no-repeat;
			text-align: center;
			cursor: pointer;
		}

		.b_bp_n {
			background-image: url(../images/gradientcalendars/sites/42540-b_bp.jpg);
			background-position: center;
			background-repeat: no-repeat;
			text-align: center;
		}

		.bp_as_n, .bp_a_n {
			background-image: url(../images/gradientcalendars/sites/42540-bp_a.jpg);
			background-position: center;
			background-repeat: no-repeat;
			text-align: center;
		}
		.bp_as_y, .bp_a_y {
			background-image: url(../images/gradientcalendars/sites/42540-bp_a.jpg);
			background-position: center;
			background-repeat: no-repeat;
			text-align: center;
			cursor: pointer;
		}

		.bp_b_n, .bp_b_y {
			background-image: url(../images/gradientcalendars/sites/42540-bp_b.jpg);
			background-position: center;
			background-repeat: no-repeat;
			text-align: center;
		}
		</style>
	<script src="/js/trans_2.js"></script>
<meta http-equiv="Content-Type" content="text/html;" />
<!-- #EndEditable -->
<script type="text/javascript" src="../highslide/highslide-full.packed.js"></script>
<link rel="stylesheet" type="text/css" href="../highslide/highslide.css" />
<meta name="author" content="SuperWebs Ltd" />
<meta name="copyright" content="SuperWebs Ltd" />
<!-- InstanceParam name="onload" type="text" value="" -->

<!-- SuperControl Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-K7NVWG5');</script>
<!-- End  SuperControl Google Tag Manager -->

<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<meta name="robots" content="noindex, nofollow" /> 

    
</head>

<body id="availability_availability_grid">

<div id="sc_wrapper" data-role="page">
<div id="sc_pagewidth" >
<div id="sc_ownerheader"><!-- InstanceBeginEditable name="ownerheader" -->
<div class="burger"></div>
<div class="close_burger"></div>


<section id="menu">
	<div class="container">
		<div class="menu-items">
			<div class="menu-header-nav-container">
				<ul id="menu-header-nav" class="menu">
					<li id="menu-item-65" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-home menu-item-65">
						<a href="https://www.inthestix.co/" class="menu-image-title-below menu-image-hovered">
							<span class="menu-image-hover-wrapper">
								<img width="250" height="250" src="https://c621446.ssl.cf3.rackcdn.com/temp/20331/1.png" class="menu-image menu-image-title-below" alt="" sizes="(max-width: 250px) 100vw, 250px">
							</span>
							<span class="menu-image-title">Home</span>
						</a>
					</li>
					<li id="menu-item-64" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-64">
						<a href="https://www.inthestix.co/about/" class="menu-image-title-below menu-image-hovered">
							<span class="menu-image-hover-wrapper">
								<img width="250" height="250" src="https://c621446.ssl.cf3.rackcdn.com/temp/20331/2.png" class="menu-image menu-image-title-below" alt="" sizes="(max-width: 250px) 100vw, 250px">
							</span>
							<span class="menu-image-title">About</span>
						</a>
					</li>
					<li id="menu-item-63" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-63">
						<a href="https://www.inthestix.co/our-domes/" class="menu-image-title-below menu-image-hovered">
							<span class="menu-image-hover-wrapper">
								<img width="250" height="250" src="https://c621446.ssl.cf3.rackcdn.com/temp/20331/3.png" class="menu-image menu-image-title-below" alt="" sizes="(max-width: 250px) 100vw, 250px">
							</span>
							<span class="menu-image-title">Our Domes</span>
						</a>
					</li>
					<li id="menu-item-261" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-261">
						<a href="https://www.inthestix.co/field-kitchen/" class="menu-image-title-below menu-image-hovered">
							<span class="menu-image-hover-wrapper">
								<img width="250" height="250" src="https://c621446.ssl.cf3.rackcdn.com/temp/20331/its-kitchen-1.png" class="menu-image menu-image-title-below" alt="" sizes="(max-width: 250px) 100vw, 250px">
							</span>
							<span class="menu-image-title">Field<br>Kitchen</span>
						</a>
					</li>
					<li id="menu-item-62" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-62">
						<a href="https://www.inthestix.co/local-attractions/" class="menu-image-title-below menu-image-hovered">
							<span class="menu-image-hover-wrapper">
								<img width="250" height="250" src="https://c621446.ssl.cf3.rackcdn.com/temp/20331/4.png" class="menu-image menu-image-title-below" alt="" sizes="(max-width: 250px) 100vw, 250px">
							</span>
							<span class="menu-image-title">Local <br>Attractions</span>
						</a>
					</li>
					<li id="menu-item-118" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-118">
						<a href="http://holiday.booking-system.net/ChooseStartDate_Compact.asp?odta=bVQ%3DGKEI%26PVQ%3DEFKKL" class="menu-image-title-below menu-image-hovered">
							<span class="menu-image-hover-wrapper">
								<img width="250" height="250" src="https://c621446.ssl.cf3.rackcdn.com/temp/20331/7.png" class="menu-image menu-image-title-below" alt="" sizes="(max-width: 250px) 100vw, 250px">
							</span>
							<span class="menu-image-title">Availability<br>& Bookings</span>
						</a>
					</li>
					<li id="menu-item-61" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-61">
						<a href="https://www.inthestix.co/faqs/" class="menu-image-title-below menu-image-hovered">
							<span class="menu-image-hover-wrapper">
								<img width="250" height="250" src="https://c621446.ssl.cf3.rackcdn.com/temp/20331/5-h.png" class="menu-image menu-image-title-below" alt="" sizes="(max-width: 250px) 100vw, 250px">
							</span>
							<span class="menu-image-title">FAQ’s</span>
						</a>
					</li>
					<li id="menu-item-1160" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1160">
						<a href="https://www.inthestix.co/gallery/" class="menu-image-title-below menu-image-hovered">
							<span class="menu-image-hover-wrapper">
								<img width="250" height="250" src="https://c621446.ssl.cf3.rackcdn.com/temp/20331/Gallery_icon_off-copy.png" class="menu-image menu-image-title-below" alt="" sizes="(max-width: 250px) 100vw, 250px">
							</span>
							<span class="menu-image-title">Gallery</span>
						</a>
					</li>
					<li id="menu-item-1101" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1101">
						<a href="https://www.inthestix.co/blog/" class="menu-image-title-below menu-image-hovered">
							<span class="menu-image-hover-wrapper">
								<img width="250" height="250" src="https://c621446.ssl.cf3.rackcdn.com/temp/20331/Birdy-icon.png" class="menu-image menu-image-title-below" alt="" sizes="(max-width: 250px) 100vw, 250px">
							</span>
							<span class="menu-image-title">Blog</span>
						</a>
					</li>
					<li id="menu-item-60" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-60">
						<a href="https://www.inthestix.co/contact/" class="menu-image-title-below menu-image-hovered">
							<span class="menu-image-hover-wrapper">
								<img width="250" height="250" src="https://c621446.ssl.cf3.rackcdn.com/temp/20331/6.png" class="menu-image menu-image-title-below" alt="" sizes="(max-width: 250px) 100vw, 250px">
							</span>
							<span class="menu-image-title">Contact</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</section>


<section id="main">
	<header>
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-4 col-md-offset-4 col-sm-offset-3 col-xs-8 col-xs-offset-2 text-center">
					<a href="/" class="logo">
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" x="0px" y="0px" viewBox="0 0 1234.5 370.6" enable-background="new 0 0 1234.5 370.6" xml:space="preserve">
							 <style>
								svg { display: block; height:100% !Important; vertical-align:top}
							 </style>
							<defs></defs>
	<g>
		<path fill="#4C3C2C" d="M199.1,331.1c0-4-1.1-7.7-3.1-10.7c-1.7-2.1-1.9-2.8-5.6-5.3c-2.4-1.4-5.1-2.3-8.3-2.3h-18.9v56.9h12v-22.2
			h0.2l12.6,22.2h13.7l-14.3-23C195.7,345.5,199.1,337.4,199.1,331.1z M179.1,337.9h-3.9v-14.2h3.9c4.9,0,7.7,2.4,7.7,7.1
			C186.8,335.6,184,337.9,179.1,337.9z"></path>
		<path fill="#4C3C2C" d="M260.9,327.9c-1.6-0.8-3,0-1.6-2.5c0.9,0.2,1.2,0.9,1.6,1.7v-14.3h-12v38.7c0,5.7-1.9,8.2-7.2,8.2
			c-5.3,0-7.2-2.5-7.2-8.2v-11.5c-3.3,0.3-3.9-1.6,0-1.3v-25.9h-12v6.3c0.4,0,0.4,0.5,1,0.6c-0.8,0.3-0.8,0.9-1,2.1v3.2
			c0.2,0.4,0.7,0.2,1.5-1.7c2.8-1.8-0.2,4.6-1.5,3.9v26c0,10.1,5.2,17.3,19.2,17.3c14,0,19.2-7.2,19.2-17.3V327.9z"></path>
		<path fill="#4C3C2C" d="M349.7,312.7h-12v0.3c0.1,0,0.2,0,0.4,0c0,0.5-0.2,0.8-0.4,1v55.7h17c1.2-0.9,2.6-1.3,4.2-0.7
			c0,0.3-0.2,0.5-0.2,0.7h6.3v-11h-15.2V312.7z"></path>
		<path fill="#4C3C2C" d="M399,312.7l-15.9,56.9h12.1l2.8-10.8h13.4l3,10.8h12.1L410,312.7H399z M401,347.8l3.6-18.4h0.2l3.7,18.4
			H401z"></path>
		<path fill="#4C3C2C" d="M458.2,331.8h0.1l16.9,37.9h10.1v-25.8c0,0.7,0.4-0.5-1,0.3c-1.7-0.4,0.3-0.5-1.8-0.5
			c0.8-3.6,2.5-2.1,2.8,0v-30.9h-10.6v34.9h-0.2l-15.7-34.9h-11.2v56.9h10.5V331.8z"></path>
		<path fill="#4C3C2C" d="M50.2,323.7l-2.2,2.6l4.6,6.2l-24.5,2.1l-0.2,8.1c0,0,21.6,0.2,27.4,0.6c5.8,0.5,24.3-0.6,24.3-0.6
			s12.6,0.2,17.4-0.8c4.9-1,13.9,1.8,15.5,0.5c1.7-1.3,1.7-9.8,1.7-9.8H77.5H64.3L50.2,323.7z M49.6,338.5
			C44.4,344.8,43.9,333.4,49.6,338.5L49.6,338.5z"></path>
		<path fill="#4C3C2C" d="M1164.6,323.7l-13.6,8.8l-9-0.8c0,0-7.7,0-9.5,0.2c-1.7,0.1-3.9,0.2-5.3-0.2c-1.3-0.3-4.3-0.1-4.3-0.1
			s-10.1,0-11.9,0.1c-1.8,0.2-1.2,10.9-1.2,10.9s21-0.8,24-0.4c2.9,0.3,15.8,0.4,15.8,0.4h5.8c0,0,4.4-1.2,7.5-0.6
			c3,0.6,31.1,1.4,33.4,0.6c2.3-0.7,2.4-10,0-10.1c-2.4-0.2-16.5,0-16.5,0h-5.4c0,0-4-0.3-5.8,0c-1.9,0.3-6.8,0-6.8,0l6.8-5.7
			L1164.6,323.7z"></path>
		<path fill="#4C3C2C" d="M880.7,312.7h-16.5v19.3c2.5,0.1,0.3-1.8,1.8-0.9c-0.4,5.7,0.4,1.8-1.8,2.4v36.1h12v-19.8h4.6
			c11,0,19-6.6,19-18.5C899.7,319.3,891.7,312.7,880.7,312.7z M880.5,338.9h-4.4v-15.1h4.2c-0.2-0.9-0.3-1.8-0.7-2.4
			c1.6,0.5,2.7,1.6,3.6,2.8c2.8,0.8,4.2,3,4.2,7.2C887.4,336.6,885.2,338.9,880.5,338.9z M896.2,327.5c-0.7,2.7,2.4-0.8,1.9,2.2
			C892.9,328.8,892,325.7,896.2,327.5z"></path>
		<path fill="#4C3C2C" d="M529,312.7h-17.9v6.6c0.4,0,0.8-0.1,1.3-0.1c-0.3,0.9-0.8,1.6-1.3,2.2v48.3H529c14.7,0,22.6-12.9,22.6-28.5
			C551.7,325.6,543.8,312.7,529,312.7z M534.8,357.5c-1.2,3-1,1.4-4,0.9c-0.6,0.1-1.3,0.2-1.9,0.2h-5.8v-3.4c-4.5,2-2.5,1.1,0,0
			v-31.5h5.8c6.8,0,10.5,7.1,10.5,17.4c0,7.7-2,13.7-5.9,16.2C534.2,358.4,533.5,357.2,534.8,357.5z"></path>
		<path fill="#4C3C2C" d="M923.1,351.5c1-0.8,0,0.2,1.8,0.2c-0.7,2,0.4,2-1.8,2.6v15.4h2.5c-0.3-0.8,1.4-0.1,1.4-1.2
			c1.5,0.5,0.9-0.1,1.6,1.2h6.4v-56.9h-11.9V351.5z"></path>
		<path fill="#4C3C2C" d="M971.5,356.2c-0.9,0.2-0.1-2.1-1.1-2.1c-1.2-3.5-1.2-1.8,1.1-1.8v-20.5h0.2l16.9,37.9h10V354
			c-1.5,2.1-1.7,1.3-4.7,1.8c-0.6-5.5,4.6,3.2,2.7-3.4c1.6,0.4,1.5-1.1,1.9-0.6v-39.1H988v34.9h-0.1l-15.7-34.9H961v29
			c0.5,0.1,1,0.3,1.6,0.3c-0.7,0.2-1.2,0.6-1.6,0.9v26.8h10.5V356.2z"></path>
		<path fill="#4C3C2C" d="M812.4,350.9h-0.2l-8.4-38.2h-17v4.1c0.4,0.4,0.8,0.6,1.5,0.3c-0.4,1.7-0.9,2.3-1.5,2.3v50.2h10.6v-44.2
			h0.2l10.4,44.2h8.7l10.4-44.2h0.2v44.2h10.5v-56.9h-16.9L812.4,350.9z"></path>
		<path fill="#4C3C2C" d="M749.3,312.7h-11l-1.9,6.9c0.4,0.9,1,1.6,2.2,1.7c0.3,1.6-1.3,1.8-3,1.1l-3.2,11.4c0.5,0.7,0.2,1-0.3,1
			l-9.7,34.8h2.7c0.3-0.1,0.6-0.1,0.9,0h8.5l2.8-10.8h6.3c-0.6,0,2,0,1.1-0.2c3.9-3.7-2.9-1.2,1.6-5.5c2,0,0,0.1,0.5,1.7
			c-0.8,5,4.7-4.2,1.4,3.2c-3.4-3.4,2,0.7-2.4,0.8h4.8l3,10.8h12.1L749.3,312.7z M738.6,325.4c8.5-0.6,0-0.4,1,3.6
			C736.7,328.3,738.9,328.5,738.6,325.4z M740.2,347.8l3.6-18.4h0.1l3.6,18.4H740.2z"></path>
		<path fill="#4C3C2C" d="M631.4,322.8c5.8,0,8.7,4.6,8.8,10h12.3c-0.8-12.9-9-21.1-21.1-21.1c-9.1,0-15.9,5-19.1,15.1
			c1.1,1.1,1.9,2.5,1.8,4.8c-1-0.4-1.9-0.9-2.6-1.7c-0.7,3.3-1.2,7-1.2,11.2c0,19.8,8.3,29.4,21.1,29.4c13.4,0,21.1-9.1,21.1-20.9
			v-11.2h-22.3v11h1.1c-0.6-0.7,0.6,0.6,1-2.4c5.1,0.7,2.6,1.2,1,2.4h6.8c0.1,4.6-2,10-8.8,10c-4.6,0-8.8-4.9-8.8-18.4
			C622.6,327.7,626.8,322.8,631.4,322.8z M625.9,316.4c0.9,0.6,1.8,1.1,3.2,1.1c-0.6,2.2-1.7,2.3-3.2,1.1
			C625.9,317.9,625.9,317.2,625.9,316.4z"></path>
		<path fill="#4C3C2C" d="M305,323.8h9.8v-11h-31.5v11h9.7v45.9h12V323.8z M301.9,317.5c2,0.1,1.1,0.2,1.6,1.8
			c6.4-0.5-0.8-3.7,8.2-1.7c-1.5,4.7-3.6-4.2-4,1.7C303.1,319.7,301.5,322.1,301.9,317.5z"></path>
		<path fill="#4C3C2C" d="M689,315.1c-0.8,0-1.5,0-2.3,0c0-0.8,0-1.5,0-2.3h-9.6v56.9h27.2v-11H689V315.1z M680.4,356.9
			c-4.4-0.1,2.6-4.1-1.3-3.7C681.2,348.8,682.8,356.1,680.4,356.9z"></path>
		<g>
		<path fill="#4C3C2C" d="M234.5,120.4c0-1,0.8-8.4,0.4-12.2c-0.3-2.5-1.9-7.5-2.2-10.1c-0.3-2.6,0.8-3.7,1.1-5.2c0.2-1,0-2,0-3.2
			c0.1-3,0.7-6.6,0.7-9.7c0-2.6,0.3-5.3,0.2-7.7c0-0.9-0.5-1.8-0.7-2.7c-0.4-3.3,0.7-7.9,0.3-11.7c-0.3-2.4-1.2-4.7-1.1-6.5
			c0.2-1.9,1.2-3.5,1.3-5.2c0.2-3.1,0.2-9.3,0.1-10.7c-0.2-1.3,0.2-2.7-0.3-5c-0.5-2.3-0.7-3.6-0.5-5.3c0.2-1.7,1.2-2.7,1-4.8
			c-0.2-2.1-0.2-3.6-0.2-3.6c0-0.1,0-0.2,0-0.3c-0.8,0-1.2-0.4-1.2-1.2c0.6,0,1,0.1,1.2,0.4c0-2.6,0.4-6.1,0.4-8.3
			c0-0.6,0.5-1.2,0.4-1.7c-0.2-1.7-0.5-3.6-1.2-4.1c-0.9-0.6-2.2-1.4-2.9-0.5c-4.8-1.9-7.6-0.3-11.9-0.2c-1.5,0-3.2-0.1-4.6,0.6
			c0,0-0.5,0.7-2.9,0.2c-2.4-0.6-1.8-0.4-3-0.4c-1.2,0-2,0-3.5,0s-1.6,0.8-1.6,0.8c0.1,4-0.4,5-0.5,9c-0.1,5.9,0.1,11.8-0.9,17.5
			c1.7,1.6,0.8,3.3,0.8,6.2c0,0.3,0.5,0.7,0.5,1.1c0,0.1,0,0.1,0,0.2c0.1-1.5,0,1.8,0,0c0,0.1,0,0.3,0,0.6
			c-0.2,2.6-0.6,9.3-0.3,12.4c0.3,3.2-0.1,6.5-0.4,9.7c-0.8-0.5-1.6-1-2.3-1.4c-0.1,0-0.3,0-0.4,0c0-0.1,0-0.2-0.1-0.3
			c-0.3-0.2-0.6-0.3-0.8-0.5c-1.4-1.1-2.6-1.8-3.5-2.4c-0.8-0.6-1.6-1.2-2.7-1.6l-0.1,0.2c-0.3-0.1-0.4-0.1-0.4-0.1
			c-0.1,0-0.2,0-0.3-0.1c-0.6,1-0.1,1.8-1.5,2.3c1.1-1.5-0.1-2-0.9-3c-1.5-0.6-1.8-1.4-3-2.3c-1.3-0.9-2.8-1.4-4.4-2
			c0.1-0.1,0.1-0.2,0.2-0.3c0.4-0.5-0.1-0.6-0.4-1c-0.4-0.4-0.1-0.4-0.6-0.3c-0.5,0.1-1.4-0.7-1.4-0.7c-1-0.6-2-1.2-3.5-2
			c0,0-0.1-0.1-0.1-0.1c-0.4-0.3-1.1-0.6-1.7-0.9c-1-0.6-2.1-1.2-3.5-2.1c-2.5-1.5-6.9-5.1-9-6.3c-1.2-0.7-2.7-1.4-3.9-2
			c0-0.1,0-0.2,0-0.3c-0.2,0-0.5-0.1-0.9-0.2c-0.5-0.2-1-0.5-1.3-0.6c-2.1-1.2-5.8-3.5-8.9-5.2c-0.3,0.2-0.5,0.4-1-0.3
			c0-0.1,0.1-0.2,0.1-0.3c-3.6-2.9-6.9-4.9-8.7-5.5c0-0.3,0-0.6,0-0.9c0.1-1.1,0.5-2.1,0.6-3.2c0.1-1.1-0.3-2.4-0.4-3.8
			c-0.1-3.2,0.7-4.9,0.3-6.9c-0.1-0.5-0.2-1.2-0.2-1.9c0,0,0.1,0,0.1,0c0,0,0.6-0.7,0.6-1.2c0-0.5-0.1-1.1-0.5-1.1
			c-0.3,0-0.3,0-1.4,0.1c-1,0.1-1.5,0.3-1.5,0.3c-0.1,0-0.3,0-0.4,0c-0.5-0.2-1-0.3-1.4-0.1c-0.4,0-0.8-0.1-1.2-0.2
			c-2-0.7-3.7-0.6-5.3-0.4c-3.1,0.1-6.7,0.2-9,0c-2.1-0.2-4.3,1.1-6.2,0c0,0-0.5,0.1-1.3,0.1c-0.2,0-0.4,0-0.6-0.1
			c0.2,0.7-0.5,1-1.3,1.1c0,0,0-0.1,0-0.1c-1,0.1-1,0.7-1,0.7c0.1,4-0.4,5-0.5,9c0,0.3,0,0.6,0,0.9c0.1,0.2,0,0.4,0,0.6
			c-0.1,4.9,0,9.8-0.6,14.5c0.1,0.1,0.2,0.2,0.3,0.3c0,0.4-0.2,0.6-0.4,0.7c0,0.1,0,0.2,0,0.4c0.4,0.4,0.7,0.9,0.8,1.4
			c1-0.2,1.8-0.4,2.1-1.6c1.7,0.3,0.9,1.5,0.6,2.7c-0.9-0.5-1.5,0.2-2.1,0.9c-0.1-0.1-0.3-0.2-0.4-0.3c0,0.9-0.2,1.9-0.2,3.1
			c0,0.3,0.5,0.7,0.5,1.1c0,0.1,0,0.1,0,0.2c0.1-1.5,0,1.8,0,0c0,0.1,0,0.3,0,0.6c-0.1,1.6-0.3,4.5-0.4,7.3c1.1-0.4,0.1,1.3,0.8,1.2
			c0,0.7-0.5,0.4-0.9,0.4c0,1.3,0,2.6,0.1,3.5c0.5,5.6-0.9,11.4-0.8,16.9c0,1.5-0.5,3-0.5,4.4c0,2,1,4.2,0.9,6.2
			c-0.1,2.3-1.2,4.2-0.1,6c-0.5,4.2,0.3,9,0.2,14.1c0,4.7-0.2,8.8-0.1,12.9c0,0,0,0,0,0c0,0,0,0.1,0,0.1c0,0.4,0,0.7,0,1.1
			c0.2,0,0.4,0,0.6,0c-0.1,0.4-0.3,0.7-0.6,0.9c0.1,1.5,0.1,2.9,0.3,4.4c0.1,1.8-0.4,3.5-0.4,5.5c0,1.4,0.7,2.5,0.8,3.9
			c0.1,1-0.4,2.1-0.4,3.2c0,1.4,0.6,2.8,0.6,4.1c0,1.6-0.5,3.1-0.6,4.7c-0.2,4,0.5,8.6,0.7,13c0.1,2.8-0.6,5.8-0.6,8.7
			c0,3.6,1,7.1,0.8,11c-0.1,1.1-0.4,2.3-0.4,3.5c0,5.2,1.6,9.6,0.9,15.3c-0.3,2.5-0.1,5.5-0.1,8c0,2.2-0.1,4.4,0.1,6.6
			c0.3,4.7-0.3,7.9-0.5,13.5c-0.2,6.6,0.9,12.3,0.5,18.9c-0.1,1.1-0.5,2.1-0.6,3.2c-0.1,1.1,0.3,2.4,0.4,3.8
			c0.1,3.2-0.7,4.9-0.2,6.9c0.1,0.5,0.2,1.2,0.2,1.9c0,0-0.1,0-0.1,0c0,0-0.6,0.7-0.6,1.2c0,0.5,0.1,1.1,0.5,1.1
			c0.3,0,0.3,0,1.4-0.1c1-0.1,1.5-0.3,1.5-0.3c0.1,0,0.3,0,0.4,0c0.5,0.2,1,0.3,1.4,0.1c0.4,0,0.8,0.1,1.2,0.2
			c2,0.7,3.7,0.6,5.3,0.4c3.1-0.1,6.7-0.2,9,0c2.1,0.2,4.3-1.1,6.2,0c0,0,0.5-0.1,1.3-0.1c0.8,0,1.3,0.6,1.4-0.2
			c0-0.2,0-0.4,0.1-0.7c0,0,0,0,0,0c1.4,0,1.5-0.8,1.5-0.8c-0.1-4,0.4-5,0.5-9c0.1-5.9-0.1-11.8,0.8-17.5c-0.4-0.4-0.6-0.8-0.8-1.3
			c-0.1,0.1-0.3,0.1-0.4,0.2c-0.1-0.5,0.1-0.6,0.3-0.8c0-0.3-0.1-0.5,0-0.8c-0.7-0.4-2,0.2-2.4-1.1c1.1-0.1,1.8,0.1,2.4,0.5
			c0-0.3,0.1-0.7,0.1-1.1c-0.3-0.2-0.4-0.4-0.7-0.6c0.1-0.5,0.4-0.9,0.8-1.2c0,0,0,0,0,0c0-0.3-0.5-0.7-0.5-1.1c0-0.1,0-0.1,0-0.2
			c-0.1,1.5,0-1.8,0,0c0-0.1,0-0.3,0-0.6c0-0.8,0.1-1.9,0.2-3.2c-0.6-0.3-1-0.7-1.1-1.3c0.4,0.1,0.8,0.1,1.2,0c0-0.5,0-1,0.1-1.5
			c0,0,0,0-0.1,0c0,0,0-0.1,0.1-0.1c0-0.3,0-0.7,0-1c-0.3-0.3-1.1-0.4-1.6-0.7c0.3-0.6,0.9-0.5,1.6-0.4c0-1.6,0-3.1-0.1-4.2
			c0-0.6-0.1-1.1-0.1-1.7c-0.9,0.5-2.3,0.9-3.6,0.3c0.6-1.6,2-1.5,3.6-2c0.1-4.6,1-9.1,0.9-13.5c0-0.4,0-0.7,0.1-1.1
			c-0.3-0.2-0.5-0.4-0.7-0.4c0.1-0.5,0.4-0.5,0.8-0.3c0.1-0.9,0.3-1.7,0.3-2.6c0-2-1-4.2-0.9-6.2c0.1-2.3,1.2-4.2,0.1-6
			c0.5-4.2-0.3-9-0.2-14.1c0.1-7.2,0.3-13-0.2-19.4c-0.1-1.8,0.4-3.5,0.4-5.5c0-1.4-0.7-2.5-0.8-3.9c-0.1-1,0.4-2.1,0.4-3.2
			c0-1.4-0.6-2.8-0.6-4.1c0-1.6,0.5-3.1,0.6-4.7c0.1-1.5,0-3.1-0.1-4.7c-1-0.3-2.1-0.9-2.2-1.7c0.6-0.1,0.8,0.2,1.2,0.3
			c0.5-0.3-1.5-1.7-0.3-2.7c0.4,0.2,0.7,0.4,1.1,0.6c-0.1-1.6-0.3-3.2-0.3-4.8c-0.1-2.8,0.6-5.8,0.6-8.7c0-3.6-1-7.1-0.8-11
			c0.1-1.1,0.4-2.3,0.4-3.5c0-4.4-1.1-8.2-1.1-12.7c-0.5,0.1-1,0.2-1.4,0.1c0.1-0.7-0.2-1-0.9-0.9c0-1.1,1.2-1,1.8-1.5
			c1.4,0-0.3,0.4,0,1.2c0.2,0,0.4,0,0.6,0c0-0.5,0.1-1,0.1-1.4c0.3-2.5,0.1-5.5,0.1-8c0-0.4,0-0.9,0-1.4c0.9,0.6,1.8,1.1,2.6,1.6
			c1.4,1.1,2.6,1.8,3.5,2.4c0.8,0.6,1.6,1.2,2.7,1.6l0.1-0.2c0.3,0.1,0.4,0.1,0.4,0.1c4.1,0.7,3.9,1.8,5.8,3.1
			c1.3,0.9,2.8,1.4,4.4,2c-0.1,0.1-0.1,0.2-0.2,0.3c-0.4,0.5,0.1,0.6,0.4,1c0.4,0.4,0.1,0.4,0.6,0.3c0.5-0.1,1.4,0.7,1.4,0.7
			c1,0.6,2,1.2,3.5,2c0,0,0.1,0.1,0.1,0.1c0.4,0.3,1.1,0.6,1.7,0.9c1,0.6,2.1,1.2,3.5,2.1c0.8,0.5,1.7,1.1,2.7,1.9
			c0.4-0.4,1.9,0.1,1.7,1c-0.1,0.1-0.1,0.1-0.2,0.2c1.8,1.3,3.6,2.7,4.7,3.3c1.2,0.7,2.7,1.4,3.9,2c0,0.1,0,0.2,0,0.3
			c0.2,0,0.5,0.1,0.9,0.2c0.5,0.2,1,0.5,1.3,0.6c2.2,1.3,6.2,3.7,9.4,5.4l0,0c4.2,3.5,8.1,5.7,9.8,6c0,0,0.1,0,0.3,0
			c0,0.6,0,1.2,0,1.8c-0.1,7.2-0.4,13,0.2,19.4c0.2,1.8-0.4,3.5-0.5,5.5c0,1.4,0.7,2.5,0.8,3.9c0.1,1-0.4,2.1-0.4,3.2
			c0,1.4,0.6,2.8,0.6,4.1c0,1.6-0.5,3.1-0.6,4.7c-0.2,4,0.5,8.6,0.7,13c0.1,2.8-0.7,5.8-0.7,8.7c0,3.6,1,7.1,0.8,11
			c-0.1,1.1-0.4,2.3-0.4,3.5c0,5.2,1.7,9.6,1,15.3c-0.3,2.5-0.1,5.5-0.1,8c0,2.2-0.1,4.4,0.1,6.6c0.4,4.7-0.3,7.9-0.5,13.5
			c-0.2,6.6,1,12.3,0.5,18.9c-0.1,1.1-0.5,2.1-0.6,3.2c-0.1,1.1,0.4,2.4,0.4,3.8c0.1,3.2-0.7,4.9-0.3,6.9c0.1,0.5,0.2,1.2,0.2,1.9
			c0,0-0.1,0-0.1,0c0,0-0.7,0.7-0.7,1.2c0,0.5,0.1,1.1,0.5,1.1c0.3,0,0.3,0,1.5-0.1c1.1-0.1,1.6-0.3,1.6-0.3c2.5-0.1,5,0.7,7.3,0.7
			c3.6,0,8.4-0.2,11.3,0c2.2,0.2,4.6-1.1,6.6,0c0,0,0.5-0.1,1.4-0.1s1.4,0.6,1.5-0.2c0.1-0.8,0.3-2.3,0-2.6c-0.3-0.3,1-0.2,0.3-0.5
			c-0.1-0.1-0.3-0.2-0.5-0.4c-0.3-0.4-0.4-0.5-0.2-1.4c0.2-1,0.3-2.3,0.2-3.4c-0.1-1,0.1-5.3-0.3-6.1c-0.4-0.8,0-1-0.2-2.2
			c-0.2-1.2-0.2-1.6-0.3-2.2c-0.1-0.6,0.5-2.4,0.6-3.8c0.1-1.4,0.5-4.3,0.4-6.9c-0.1-2.5,0.5-15.3-0.1-18.7
			c-0.6-3.5-0.9-5.2-0.4-6.7c0.6-1.5,0.9-3.5,0.9-5c0-1.4,0.2-9.8-0.1-12.2c-0.3-2.4-0.6-10-0.3-12c0.3-2.1-0.7-11.2-0.4-13
			c0.3-1.8,0.4-2.7,0.5-3.5c0.2-0.9,0.6-3.6,0.2-5.4c-0.4-1.9-0.6-2.1-0.5-3.2c0.1-1.1-0.1-2.5,0.3-3.8c0.4-1.3,0.5-2.8,0.5-3.5
			c0.1-0.7-0.3-9.9-0.7-12.1S234.5,121.5,234.5,120.4z M107.2,109.1c0-0.3,0-0.6,0-0.9c0.4-0.4,1.7-0.4,2.1,0
			C109,109,108.3,109.2,107.2,109.1z M124.2,11.1c-0.4,1.5-1.9,0.6-3,0.3C121.3,10.5,123.7,10.7,124.2,11.1z M122.1,12.9
			c-0.7,0.1-1.1,0-1.5-0.3C120.7,11.7,122.4,11.8,122.1,12.9z M122.1,14.7c0-0.4,0.5-0.3,0.9-0.3c-0.2,0.8,0.4,0.8,0.3,1.5
			c-1.3,0-1.4,1.2-2.7,1.2C119.9,15.2,123.7,15.6,122.1,14.7z M109.9,1.3c0.9-0.1,1.3,0.3,1.2,1.2C110.1,2.6,109.7,2.2,109.9,1.3z
			 M107.5,22.5c0-0.5,0.4-0.6,0.3-1.2c0.3,0,0.6,0,0.9,0C108.9,22.3,108.2,22.4,107.5,22.5z M108.7,4c0-0.8,1.2-0.4,1.2-1.2
			c0.5,0.1,0.7,0.5,0.6,1.2C109.9,4,109.3,4,108.7,4z M111.7,29.1c-0.9,0.1-0.1-1.5-1.2-1.2c0.7-0.8,2.1,0,3,0
			C113.3,28.8,112,28.5,111.7,29.1z M114.4,25.8c-1,0.2-1.1-0.5-1.2-1.2c0.5,0,1,0,1.5,0C114.4,24.9,114.3,25.3,114.4,25.8z
			 M114.7,28.5c-0.5,0.3,0.2,2-1.2,1.5C113.4,29,113.8,28.5,114.7,28.5z M112.6,33.9c-0.6-0.6,0-0.8,0-1.5
			C113.8,32.1,113.8,34.2,112.6,33.9z M113.2,105.2c0.4-0.9,1,0.3,1.8,0C114.7,106.3,113.7,105.4,113.2,105.2z M117.3,107.3
			c1,0.2,1.1-0.4,2.1-0.3C119.1,107.6,117.4,109,117.3,107.3z M119.1,24.3c-2.2,0-3.5-0.4-5.1-1.5c0.1-0.3,0.6-0.2,0.6-0.6
			c-0.5-0.6-2-0.2-1.8-1.5c0.8-0.8,2.5-0.8,3.3,0c0.1-0.7-0.5-0.6-0.3-1.5c0.9-0.1,1.2,0.4,1.8,0.6c-0.8,1.2,1.8,1.1,2.1,2.1
			c0.2-0.9-0.8-0.6-0.6-1.5c1-0.7,2.7,0.2,3,1.2c0.7-0.1,1.1-0.5,2.1-0.3c-0.5,1.2-2.4,1-3.3,2.4c-0.4-0.2-0.8-0.4-1.2-0.6
			C119.2,23.1,119.6,24.1,119.1,24.3z M122.4,51.7c0.6,0,1.2,0,1.8,0C124.6,53.5,122.3,52.9,122.4,51.7z M122.1,92.9
			c0,0.3,0,0.6,0,0.9c-0.3,0.3-1.5,0.3-1.5-0.6C121.4,93.4,121.3,92.7,122.1,92.9z M121.5,109.4c-0.9-0.1-1.4-0.6-1.5-1.5
			c0.7-0.7,1.2,0.1,2.1,0C122.4,108.8,121.7,108.8,121.5,109.4z M124.8,108.8c-1.1,0-1.4-0.8-2.4-0.9c0.2-0.7,1.7-0.1,2.4-0.3
			C124.8,108,124.8,108.4,124.8,108.8z M125.1,50.8c-0.6-0.2-1.2-0.9-0.6-1.5C125.5,49,125,50.2,125.1,50.8z M125.4,14.7
			c-0.9,0-2,0.2-1.8-0.9C124.5,13.8,125.6,13.7,125.4,14.7z M138.3,21.9c0.3,0,0.2,0.4,0.3,0.6c0.7-0.2,1.4-0.5,1.5,0.6
			c-1.1,0.5-1.5-1-1.8-0.3c-0.3,0-0.2-0.4-0.3-0.6C138.2,22.3,138.3,22.1,138.3,21.9z M139.5,24c0.3,1.2-0.9,1.5-1.5,0.9
			C138.2,24.3,138.8,24.1,139.5,24z M135.6,12.3c0.5-0.5,1.5-0.3,1.8,0.3c0.1,0.9-0.6,1-1.5,0.9C135.9,13,135.5,12.9,135.6,12.3z
			 M134.1,28.8c0.4,0,0.8,0,1.2,0c0.1,1-0.1,1.7-1.2,1.5C134.1,29.8,134.1,29.3,134.1,28.8z M129.6,11.4c0.3,1.2-1,0.8-0.6,2.1
			C126.9,13.8,128.2,11.2,129.6,11.4z M127.2,61.2c0-0.8,0.5-1.2,0.6-2.1c1.1-0.1,1.4,0.6,2.1,0.9C129.5,60.9,128.5,61.2,127.2,61.2
			z M128.4,120.1c-0.6-0.6-0.2-1.4,0.9-1.2c0.1,0.3-0.1,0.3-0.3,0.3c0,0.4,0.5,0.3,0.9,0.3C129.5,120.5,129.3,119.7,128.4,120.1z
			 M129.9,93.5c-0.4-0.1-0.5-0.5-0.9-0.6c0.2-0.4,0.6-0.6,1.2-0.6C130.3,93,130,93.1,129.9,93.5z M129.9,11.1
			c1.1-0.3,1.3-1.5,2.7-1.5c0.5,0.9-0.2,1.3-0.3,2.4C130.9,12.3,130.6,11.5,129.9,11.1z M136.8,183.6c-0.8,0.6-2.3,1.7-3.6,0.9
			C134.1,183.5,135.4,182.4,136.8,183.6z M136.5,116.6c-1.1,2-2.5-0.7-4.2,0.6c0.4-0.4,0.2-1.4,0.6-1.8c0.7,0.1,1.6,0.7,1.8-0.3
			C135.5,115.4,135.7,116.3,136.5,116.6z M135.3,60c-0.4-1-1.7-1.1-2.1-2.1c1.4-0.1,2.4,0.2,3.3,0.6C136.7,59.7,135.3,59.2,135.3,60
			z M138.9,30.6c-1.1,0.2,0.4,1.8-1.5,1.5c0.8-1.3-0.4-1.6-1.5-1.8c0.3-1.1,0.6-0.8,0.3-2.1c0.2-0.7,2.1,0.3,1.8-0.9
			c0.5,0.5,0.8,1.2,1.8,1.2c-1.1,1.4,0.4,2.2,0.9,3C139.4,31.9,139.6,30.8,138.9,30.6z M141,39.8c1-0.5,1.6,0.2,1.8,1.2
			C141.9,41.4,140.9,41.2,141,39.8z M142.5,37.9c0.4,0,0.8,0,1.2,0C143.9,39.1,142.2,39.1,142.5,37.9z M147,31.6
			c0.9,0,1.4,0.4,2.1,0.6C148.7,33,146.5,33.2,147,31.6z M163.7,58.8c0.2-0.3,0.3-0.7,0.3-1.2c1.7,0.3,1.7-1.1,2.4-1.8
			c2.1,1.3,1.6,2.7,1.5,4.8c-0.5-0.3-1-0.6-0.9-1.5C166,59.6,164.4,59.5,163.7,58.8z M166.7,63.9c-0.1-0.6,0.2-0.8,0.3-1.2
			c0.5,0,0.6,0.4,1.2,0.3C168.3,64,167.5,64,166.7,63.9z M170.9,63c-0.6,0.1-0.8-0.2-1.2-0.3c0.1-0.5,0.5-0.7,1.2-0.6
			C170.9,62.4,170.9,62.7,170.9,63z M171.5,60.9c1.4-0.3,1.4,0.7,2.7,0.6C173.5,62.3,171.5,62.3,171.5,60.9z M184.3,59.7
			c0.8-0.2,2.1-0.1,2.7,0.9C185.4,61,185.2,60.6,184.3,59.7z M190,55.8c0,0.4,0,0.8,0,1.2c-1.1,0-1.3-0.9-1.8-1.5
			C189,54.8,188.9,56.2,190,55.8z M189.1,59.1c1.2-0.3,1.1,0.7,1.8,0.9C190.6,60.6,188.7,60.2,189.1,59.1z M191.2,78.9
			c0.2-1.1,1.2-0.2,1.8,0C192.8,80,191.8,79.1,191.2,78.9z M191.5,70.2c0.7,0,1.4,0,1.8,0.3C193.2,71.5,191.4,71.2,191.5,70.2z
			 M192.4,55c0.5-0.8,1.2-2.6,2.1-1.2C194.2,54.6,193.4,54.8,192.4,55z M199.9,68.4c0-0.8,1-0.6,1.8-0.6
			C201.5,69,200.9,68.4,199.9,68.4z M225,175.8C227.7,175.8,225.4,178.1,225,175.8L225,175.8z M224.4,159.9
			c-0.3-1.1,1.2-0.4,1.8-0.6C226.2,160.1,225.2,159.9,224.4,159.9z M226.2,156.3c-0.9,0.1-1.2-0.4-1.8-0.6
			C224.7,155.1,226.6,155.3,226.2,156.3z M222.9,7.1c0.4-0.5,1.7-0.4,1.5,0.6C223.8,7.6,222.6,8.1,222.9,7.1z M223.2,224.5
			c-1-0.2-0.9,0.6-1.5,0C221.6,223.3,223.5,222.8,223.2,224.5z M219.6,153.3c-0.3,1.3,0,0.8,0.3,1.8c-0.8-0.4-1.9-0.5-1.8-1.8
			C218.6,153.3,219.1,153.3,219.6,153.3z M218.4,133.9c0,0.5,0.4,0.6,0.3,1.2c-0.2,0.4-1.2,0-1.2,0.6c-0.6-0.4-0.8-1.2-1.2-1.8
			C217.2,134.2,217.6,134.2,218.4,133.9z M217.8,168.6c0,1.1-1,1.2-2.1,1.2C215.6,168.6,217,168,217.8,168.6z M215.4,135.4
			c-0.9,0-2,0.2-1.8-0.9C214.7,134.4,215.6,133.8,215.4,135.4z M213.3,25.6c0.8,0.2,0.8-0.4,1.5-0.3c0,1.1-1.4,0.2-0.6,1.5
			C213.5,26.9,213.3,26.4,213.3,25.6z M213.3,121.3c0,0.8-0.7,0.9-1.5,0.9C212.1,121.7,212.4,121.2,213.3,121.3z M211,164.7
			c-0.9,0.8,1.3,0.6,0.3,1.5c-0.8,0.1-0.6-1-1.8-0.6C209.3,164.7,210.1,164.7,211,164.7z M212.1,183.9c-0.2,0.7-1.7,2-1.8,0.3
			C211.1,184.2,211.2,183.6,212.1,183.9z M211.8,173.4c0.8-0.1,1,0.4,0.9,1.2c-0.4,0-0.8,0-1.2,0C211.4,174,211.8,173.8,211.8,173.4
			z M210.4,190.7c-1-0.1-1.9-0.3-2.1-1.2c0.7,0,0.9-0.5,1.8-0.3C209.9,190,210.6,189.9,210.4,190.7z M207.7,27.1
			c0.8,0.7,1.5,0.9,2.4,0.9c0,0.8-1.4,0.7-1.8,0.3C208.6,27.4,207.3,28.1,207.7,27.1z M208.9,54.1c0.1,0.9-0.6,1-1.5,0.9
			c0-0.3-0.1-0.5-0.3-0.6C207.6,53.4,207.9,54,208.9,54.1z M204.1,46.3c0.3-0.8,2.2-1.2,3-0.6C206.5,46.7,205.2,46.5,204.1,46.3z
			 M205.6,155.1c0.9,0.2,0.9-0.5,1.8-0.3C207.9,156.3,205.3,156.5,205.6,155.1z M207.1,197.3c1.7,0.5,1.8,0.2,3,0.3
			C209.9,198.8,206.9,198.8,207.1,197.3z M207.4,207.5c0.9-1.3,2.2,0.1,3,0c0,0.4,0,0.8,0,1.2C208.8,208.2,208.7,207.9,207.4,207.5z
			 M209.2,231.4c0.4,0.5,1.5,0.3,2.4,0.3c-0.3,1.2-2.6,1.7-3.6,1.2C208.3,232.3,209.5,232.7,209.2,231.4z M209.8,244.9
			c-0.8,0.1-1.3-0.1-1.2-0.9c0.3,0.1,0.3-0.1,0.3-0.3C209.6,243.6,209.8,244.1,209.8,244.9z M211,245.5c1.3-0.3,1.7,0.3,2.1,0.9
			C212.4,247.1,211,246.2,211,245.5z M211.3,142.3c0.3-0.5,1.1-0.5,1.2-1.2c0.3,0.4,0.9,0.7,0.9,1.5
			C212.7,143.3,211.8,142.6,211.3,142.3z M213.3,137.5c-0.5,0-0.6-0.4-1.2-0.3c0.5-0.4,1.1-1.3,1.8-0.6
			C213.8,137,213.4,137.1,213.3,137.5z M214.5,219.1c-0.4-0.4-0.4-1.1,0-1.5c0.3,0,0.6,0,0.9,0C215.5,218.5,215.5,219.3,214.5,219.1
			z M215.7,217.6c0-0.8-0.5-0.6,0-1.2C216.9,216.2,216.9,217.9,215.7,217.6z M217.2,235.9c-0.4,0-0.3-0.5-0.3-0.9
			c0.3-0.3,0.8-0.4,1.5-0.3C218.6,235.7,217.3,235.2,217.2,235.9z M219.6,233.2c-1.4,0.6-2.4-1-3.6-1.5c0.9-1.2,3.2,0.9,3.6-0.6
			c0.8-0.1,0.8,0.6,0.9,1.2C219.4,231.9,219.2,232.1,219.6,233.2z M222,25c-0.3,0.5-0.7,0.9-0.9,1.5C220,26.5,221.1,23.9,222,25z
			 M223.8,244.9c0.7-1.8-2.7-1.8-3-3.6c2.9-0.1,4.7,0.9,5.7,2.7C225.6,244.3,224.9,244.8,223.8,244.9z M225,224.5
			c0.4-0.8,0.9-1.5,2.1-1.5C226.9,224.1,225.6,224,225,224.5z M227.4,198.8c-1.3,0-1.5-1.1-2.4-1.5
			C225.7,195.9,227.8,197.2,227.4,198.8z M227.4,196.7c1.1-0.2,1.5,0.3,1.5,1.2C227.9,198,227.5,197.6,227.4,196.7z M230.1,211.4
			c-0.2,0.2-0.3,0.5-0.3,0.9c-0.5,0-1,0-1.5,0C228.5,211.5,229.4,210.7,230.1,211.4z M228.6,219.7c0-0.9,1.7-0.7,2.1-0.3
			C230.7,220.3,229,220.1,228.6,219.7z"></path>
		<path fill="#4C3C2C" d="M942.3,20.8c-0.1-0.8-0.5-1.6-0.6-2.4c-0.1-1.7,0.6-3.4,0.5-5c0-0.6-0.4-1-0.5-1.7
			c-0.2-1.6,0.4-3.5,0.5-5.2c0.1-1.8-0.5-3.5-0.4-5.3c0-0.7-0.4-0.5-0.9-0.6c-0.5-0.2-0.3-0.2-0.6,0.1c-0.3,0.3-1.6,0.1-1.6,0.1
			c-2.2-0.1-4.3,0.2-10.2,0.2c-2.9,0-8.5-0.8-11-0.8c-2.5,0-5.6,0.6-6.7,0.6c-2.6,0-7.2,0-10.8,0.2c-2.5,0.1-5-0.7-7.3-0.7
			c-3.6,0-8.4,0.2-11.3,0c-2.2-0.2-4.6,1.1-6.6,0c-1.1,0.4-3.8,1.1-4.4,0c-1,0.7-7.3,1.6-12.6,0.8c-5.6-0.9-10.4-0.8-11.9-0.1
			c0,0-0.2,0.4-0.9-0.1c-0.7-0.4-1-0.6-1.2-0.5c-0.2,0.2-0.6,0.2-0.6,0.7l-0.3,0c-0.6,2.5,0.8,4.6,1.4,6.5c-0.9,3,0.4,5.8-1.1,8.2
			c1.6,5-2.6,12.6,2.7,15.9l0,0c1.6,0.5,4.1,0.1,6.9,0.2c1.5,0.1,17.2,0,18.9,0.1c1.3,0.1,2.8,0.5,4.5,0.1c0.1,0,0.3,0.2,0.5,0.4
			c0.3,0.4,0.4,0.4,0.2,1.3c-0.2,0.9-0.3,2-0.2,3c0.1,0.9-0.1,4.7,0.3,5.4c0.4,0.7,0,0.9,0.2,1.9c0.2,1.1,0.2,1.4,0.3,1.9
			c0.1,0.5-0.5,2.1-0.6,3.4c-0.1,1.3-0.5,3.8-0.4,6.1c0.1,2.3-0.5,13.5,0.1,16.6c0.6,3.1,0.9,4.6,0.4,5.9c-0.6,1.3-0.9,3.1-0.9,4.4
			c0,1.3-0.2,8.7,0.1,10.8c0.3,2.1,0.6,8.8,0.3,10.7c-0.3,1.8,0.7,9.9,0.4,11.5c-0.3,1.5-0.4,2.3-0.5,3c0.7,0.3,1.3,0.4,2.6,0.6
			c-0.1,0.2-0.7,1.2,0,1.2c-0.1,0.3-0.3,0.2-0.3,0c-1.1,0.6-1.8,0.4-2.6,0.3c-0.1,0.9-0.1,1.9,0.1,2.8c0.4,1.6,0.6,1.9,0.5,2.9
			c-0.1,1,0.1,2.2-0.3,3.4c-0.4,1.2-0.5,2.5-0.5,3.1c0,0.2,0,1.6,0.1,3.3c0,0,0,0,0,0c1.3,0,1.5,1,3,0.9c0,0.7,0,1.4-0.3,1.8
			c0.2,0.7,0.8-0.6,1.5-0.3c0.1,0.7,0,1.1-0.3,1.5c-1.3-0.3-2.6-0.5-3.7-0.4c0.1,1.7,0.3,3.2,0.4,3.9c0.5,1.9,0.4,2.8,0.4,3.7
			c0,0.9-0.8,7.4-0.4,10.8c0.3,2.2,1.9,6.6,2.2,9c0.3,2.3-0.8,3.3-1.1,4.6c-0.2,0.9,0,1.8,0,2.9c-0.1,2.6-0.7,5.9-0.7,8.6
			c0,2.3-0.3,4.7-0.2,6.8c0,0.8,0.5,1.6,0.7,2.4c0.4,2.9-0.7,7-0.3,10.4c0.3,2.1,1.2,4.2,1.1,5.7c-0.2,1.6-1.2,3.1-1.3,4.6
			c-0.2,2.7-0.2,8.3-0.1,9.5c0.2,1.2-0.2,2.4,0.3,4.4c0.5,2,0.7,3.2,0.5,4.7c-0.2,1.5-1.2,2.4-1,4.2c0.2,1.9,0.2,3.2,0.2,3.2
			c0.1,2.4-0.4,6.1-0.4,8.3c0,0.5-0.5,1.1-0.4,1.5c0.2,1.5,0.5,3.2,1.2,3.6c0.9,0.5,2.2,1.2,2.9,0.5c4.8,1.7,7.6,0.3,11.9,0.2
			c1.5,0,3.2,0.1,4.6-0.5c0,0,0.5-0.7,2.9-0.2c2.4,0.5,1.8,0.3,3,0.3c1.2,0,2,0,3.5,0c1.5,0,1.6-0.7,1.6-0.7c-0.1-3.5,0.4-4.4,0.5-8
			c0.1-5.3-0.1-10.4,0.9-15.5c-1.7-1.4-0.8-3-0.8-5.5c0-0.2-0.5-0.7-0.5-1c0-0.1,0-0.1,0-0.1c-0.1,1.3,0-1.6,0,0c0-0.1,0-0.3,0-0.5
			c0.2-2.3,0.6-8.3,0.3-11c-0.5-5,0.9-10.1,0.9-14.9c0-1.4,0.5-2.6,0.6-3.9c0-1.8-1.1-3.7-1-5.5c0.1-2,1.2-3.8,0.1-5.3
			c0.5-3.7-0.3-8-0.2-12.5c0.1-6.3,0.4-11.5-0.2-17.2c-0.2-1.6,0.4-3.1,0.5-4.8c0-1.2-0.7-2.2-0.8-3.5c-0.1-0.9,0.4-1.9,0.4-2.8
			c0-1.2-0.6-2.5-0.6-3.7c0-1.4,0.5-2.8,0.6-4.2c0.2-3.6-0.5-7.6-0.7-11.5c-0.1-2.5,0.7-5.1,0.7-7.7c0-0.5,0-1.1-0.1-1.6
			c-0.5-0.3-1-0.8-1.4-1c0.1-0.3,0.6-0.2,0.6-0.6c0.2,0.2,0.5,0.4,0.7,0.5c-0.3-2.3-0.8-4.6-0.6-7.1c0.1-1,0.4-2,0.4-3.1
			c0-4.6-1.7-8.5-1-13.5c0.3-2.2,0.1-4.9,0.1-7.1c0-1.9,0.1-3.9-0.1-5.8c-0.4-4.1,0.3-7,0.5-11.9c0-0.2,0-0.4,0-0.6
			c-0.7-0.1-1.1-0.6-1.1-1.5c0.5,0.3,0.8,0.3,1.1,0.2c0-5.1-1-9.6-0.6-14.8c0.1-0.9,0.5-1.9,0.6-2.8c0.1-1-0.4-2.1-0.4-3.4
			c-0.1-2.9,0.7-4.3,0.3-6.1c0-0.2-0.1-0.4-0.1-0.5c-0.1,0-0.2,0-0.3,0c0-0.2,0.1-0.4,0.2-0.6c0-0.2,0-0.4,0-0.5c0,0,0.1,0,0.1,0
			l0.7,0.2c0.5-0.1,1,0,1.3,0.3c7.2,1,9.9,0,9.9,0c3.9-1.5,4.3-0.5,6.5-0.4c2,0.1,3.8-0.4,5.8-0.7c0.9-0.1,5.5,0.8,6.3,1
			c0.9,0.1,2.6-0.2,3.5-0.2l0.4-0.7C941.4,27.4,942.6,23.5,942.3,20.8z M903.4,7.8c0.1,0.8-0.1,1.3-0.9,1.2
			C902.4,8.3,902.6,7.7,903.4,7.8z M903.7,7.2c0.3-0.6,0.7-1.1,1.8-0.9c0.1,0.6,0.6,0.8,0.6,1.5C904.9,7.9,904.4,7.5,903.7,7.2z
			 M906.6,26.7c0.1,0.8-1.1,0.3-1.2,0.9C904.5,26.8,906,26.1,906.6,26.7z M904,39.5c0.1-0.5,0.5-0.7,1.2-0.6c0,0.3,0,0.6,0,0.9
			C904.5,40,904.4,39.6,904,39.5z M905.1,43.1c1,0,1.4,1.2,0.9,1.8c-1.1,0.2-0.7-1.1-1.8-0.9C904.3,43.5,905.2,43.8,905.1,43.1z
			 M903.4,22.5c0-0.8,1-0.6,0.6-1.8c0.3,0,0.6,0,0.9,0c-0.2,0.8,0.4,0.8,0.3,1.5C904.8,22.5,904.1,22.5,903.4,22.5z M905.1,13.8
			c-0.3,0.7-1.5,1.4-2.1,0.9C903.6,14,903.9,14.2,905.1,13.8z M902.2,4.2c-0.4,0.4-0.3,1.3-1.2,1.2c0.1-0.3-0.1-0.5-0.3-0.6
			C901,3.9,901.3,4.7,902.2,4.2z M900.4,43.1c-0.6,0.1-0.8-0.2-1.2-0.3c0.1-0.4,0.5-0.5,0.6-0.9C900.3,42,900.4,42.4,900.4,43.1z
			 M900.7,57.5c0.5-0.1,0.5,0.3,0.9,0.3c-0.3,0.4-0.2,1.2-1.2,0.9C900.2,58.1,900.6,57.9,900.7,57.5z M900.4,193.7
			c0.5-0.5,2-0.5,1.8,0.6C901.5,194.1,900.1,194.8,900.4,193.7z M900.7,46.7c0.8,0,1.5,0.1,1.5,0.9C901.3,48,900.8,47.8,900.7,46.7z
			 M901,11.7c-0.7,0-1.4,0-1.8-0.3C899.2,11,901.4,10.8,901,11.7z M899.5,9.6c0,0.7-1.3,0.1-1.8,0.3C897.7,9.1,899.1,9.2,899.5,9.6z
			 M895.3,52.4c1-0.9,2.2,0.6,3.6,0.3c0.3,1.2,0.4,1.9-0.3,2.7c-1.1,0.2-1.4-0.3-2.1-0.6c-0.3-0.9-0.1-0.8,0.3-1.5
			C896.4,52.9,895.6,52.8,895.3,52.4z M887.5,200c0-0.5-0.4-0.6-0.3-1.2c1.3,0.7,3.8,0.2,4.8,1.2c0.3-0.1-0.4-1.6,1.2-1.2
			C892.7,202.2,889.6,199.1,887.5,200z M889,206.3c-0.1,0.7-1.8,0.4-1.2-0.6C888.7,205.3,888.5,206.1,889,206.3z M884.5,151.8
			c0.3,0,0.6,0,0.9,0c0,0.3,0,0.6,0,0.9c-0.4,0-0.8,0-1.2,0C884.4,152.5,884.5,152.3,884.5,151.8z M884.2,105.2
			c0.5,0.3,1.2,0.7,0.6,1.2C883.9,106.5,883.7,105.6,884.2,105.2z M887.5,203.6c0.4,1.6-1.2,1.2-2.4,1.2
			C885.3,203.7,886.1,203.4,887.5,203.6z M890.8,137.2c-0.9,0.7-2.2-0.2-1.5-1.2c0.7-0.1,1.1,0,1.5,0.3
			C890.8,136.6,890.8,136.9,890.8,137.2z M891.4,139.6c-0.9,0.5-1-0.5-2.7,0C889.3,137.9,890.4,139.2,891.4,139.6z M887.2,111.5
			c0.1-0.3,0.3-0.2,0.3,0c1.5-0.4,2.2-1.4,2.7,0.6C888.5,112.2,888.2,112.4,887.2,111.5z M892.6,134.5c-0.7-0.6-0.1-1.3,0.3-1.8
			c0.4,0.3,0.9,0.5,1.2,0.9C894.2,134.5,893.1,134.2,892.6,134.5z M893.5,116.6c0.7,0.1,1.4,0.2,1.2,1.2
			C893.7,117.9,893.3,117.5,893.5,116.6z M895.3,9.9c0-0.3,0-0.6,0-0.9c0.9-0.2,0.6-0.2,1.5,0C896.3,9.3,896.3,10.1,895.3,9.9z
			 M897.1,43.1c-0.9,0.1-1.3-0.3-1.2-1.2C896.6,42,897,42.4,897.1,43.1z M896.2,43.1c-0.2,1.1,0.3,1.5,1.2,1.5c-0.1,1-1,1.2-1.8,1.5
			c-0.8-1.4,0.2-1.6-0.9-3C895.2,43.1,895.7,43.1,896.2,43.1z M895.6,48.5c-0.6,0-1.2,0-1.8,0c-0.3-1,0.8-0.6,0.9-1.2
			C895.5,47.2,895.5,47.9,895.6,48.5z M894.7,134.2c0.3,0,0.6,0,0.9,0c0.1,0.6-0.2,0.8-0.3,1.2C894.7,135.3,894.6,134.9,894.7,134.2
			z M898,10.5c0.4,1.3-0.8,1.9-1.5,1.2C896.5,10.9,897,10.4,898,10.5z M897.4,7.5c-1.1,0.3-2.3,0.6-2.4-0.9
			C895.7,6,897.4,6.4,897.4,7.5z M895.3,8.1c-0.4,1.7-2.7,0.4-3.3-0.3C892.5,7.4,895.2,7.2,895.3,8.1z M894.4,44.6
			c0.7,0.8-1.4,1.7-2.4,0.9C892.3,44.3,894,46,894.4,44.6z M890.8,45.8c0.9-0.1,1.6,0,1.5,0.9C892.1,46.1,890.5,46.9,890.8,45.8z
			 M892.6,57.5c0.3,1.8-0.4,2.6-2.1,2.4C889.4,58.6,890.3,57,892.6,57.5z M889.6,14.7c-0.8-0.2-0.9-1-1.5-1.5
			C889.3,12.4,889.6,13.9,889.6,14.7z M890.2,45.2c-0.3,0.6-0.9,0.9-1.8,0.9c-0.2-0.3-0.3-0.7-0.3-1.2
			C889.2,45.2,889.5,44.9,890.2,45.2z M883.6,17.1c0.1-0.4,0.9-0.1,0.9-0.6c0-0.3,0-0.6,0-0.9c1.1,0.2,2,0.8,3,0.3
			C886.8,16.9,884.9,16.7,883.6,17.1z M883.3,19.8c0.4-0.4,1.1-0.4,1.5,0C884.6,20.7,883.4,21,883.3,19.8z M883.6,21.6
			c0,0.4,0,0.8,0,1.2C882.5,23,882.5,21.4,883.6,21.6z M883.3,14.1c0.1-1.6,0.9-0.3,1.8-0.3C885.1,14.5,883.8,13.9,883.3,14.1z
			 M885.1,10.8c1.2-0.1,1.9,0.3,2.1,1.2C886.1,12,884.8,12.3,885.1,10.8z M882.4,12.6c0.4-0.2,2.3-1.4,2.4,0
			c-0.9-0.4-1.4-0.2-1.5,0.9c-0.9-0.5-2.3-0.5-2.4-1.8C882,11.5,882.2,12,882.4,12.6z M879.1,12.6c1.3,0.2,1.4,1.8,3,1.8
			c0.3,1.4-1,2-0.9,2.7c-1.6,0.7-4.2-0.1-5.1-1.8C876.2,13.5,879.5,14.9,879.1,12.6z M870.2,9.9c0.8,0,1.2,0.4,1.2,1.2
			c-0.5,0-0.6,0.4-1.2,0.3C869.8,11,869.8,10.3,870.2,9.9z M866,17.1c1.1-0.1,1.4,0.6,2.1,0.9c0.8-0.6,1.3-2.7,3-1.5
			c-1,1.8-2,2.2-4.5,2.1C867.4,17.8,865.7,18.2,866,17.1z M869.3,20.7c0.2-0.4,0.4-0.8,0.6-1.2c0.3,0,0.6,0,0.9,0
			C871,20.6,870.3,20.8,869.3,20.7z M869.6,23.1c-0.1,0.6-2.2,1.2-1.8-0.3C868.5,22.8,869.2,22.7,869.6,23.1z M870.8,29.7
			c-1.1-0.5-2.8-0.1-3.6,0.6c-0.2,1.2,1.9,0.1,1.5,1.5c-1.4,0.3-1.7-0.5-2.7-0.6c0.3-1.1-0.5-1.6,0-2.1c1.5,0.5,2.7-0.1,3-0.9
			c1.2,0.9,1.4,0.9,3,0.3C872.4,29.7,870.3,28.4,870.8,29.7z M873.7,12.3c0.3-0.4,0.3-1.1,0.6-1.5c0.9-0.1,1.5,0.1,1.8,0.6
			C876.3,12.7,874.7,12.2,873.7,12.3z M876.7,39.5c0-0.5,0-1,0-1.5c0.6-0.1,0.8,0.2,1.2,0.3C878.1,39.3,877.7,39.7,876.7,39.5z
			 M879.1,18.6c-2.2,0.1-3,0.3-4.8-0.3c0-0.8,1.2-0.4,1.2-1.2c1.3,1.2,3.8,0.3,5.1,0.9c-0.8,0.8-1.4,0.4-0.6,1.5
			c-0.4,0-0.8,0-0.9,0.3C878.1,19.5,878.9,19.1,879.1,18.6z M879.1,23.7c0-0.3,0-0.6,0-0.9c0.3-0.3,0.8-0.4,1.5-0.3
			C880.8,23.6,880.2,23.8,879.1,23.7z M878.9,125.6c0.5-0.5,2.4,0.2,2.7,0.9C880.7,126.2,879.8,125.9,878.9,125.6z M883,38.6
			c-0.9-0.1-0.8,0.8-1.2,1.2c-0.6-0.2-0.3-1.8,0-2.1c1.2,1.2,4.2,0.6,4.8,2.4c-1.3,0.4-2.4-0.9-2.7,0.3
			C883.3,40.2,883,39.6,883,38.6z M888.1,236.2c-0.3,0-0.3,0.5-0.3,0.9c-1.2-1.4-2.7,0.2-4.2,0.3c-0.5-1.5,0.9-1,1.5-1.5
			c-0.3-0.5-0.9-0.9-0.3-1.5c1.4,0.4,2.3,1.3,4.5,0.9c0.1,0.8,0.9,0.9,0.9,1.8C888.9,237.4,889.2,236.1,888.1,236.2z M892,237.4
			c-0.4-1.9,2.5-2,2.4-0.3C893.9,237.5,892.8,237.3,892,237.4z M893.8,216.7c-1.6-0.3-0.7-1.4-1.2-2.4c1.1-0.3,0.9,0.7,1.8,0.6
			C894.4,215.8,894.3,216.5,893.8,216.7z M895.3,205.7c-0.9-0.4,0.2-1.1,0.3-1.5c0.4,0.1,0.5,0.5,0.9,0.6
			C896.4,205.4,895.1,204.9,895.3,205.7z M892.9,203.9c0.1,0.6,1.4,0,0.9,1.2c-1.8-0.8-3.1-0.6-3.6-3c0.7,0,1.4,0,2.1,0
			c0.2,0.8-0.4,0.8-0.3,1.5c1.4,0.6,2.9-3.5,4.5-1.8C895.6,202.8,894,203.1,892.9,203.9z M895.9,152.1c-1-0.1-1.1-1.1-2.1-1.2
			c0.2-1.2,3,0.3,1.8-1.5c0.2-0.3,0.7-0.3,0.6-0.9C897.3,149,897.1,150.6,895.9,152.1z M898.3,212c-1.2,0.2-1.2-1.4,0-1.2
			C898.3,211.2,898.3,211.6,898.3,212z M898.3,115.4c0.8-0.1,1.5-0.1,1.2,0.9C898.7,116.3,898.2,116.1,898.3,115.4z M899.5,208.7
			c-0.2-0.3-0.3-0.7-0.3-1.2c0.7,0,0.9-0.6,1.5,0C900.6,208.2,900.2,208.6,899.5,208.7z M901.6,197.9c-0.9,0.1-1.6,0-1.5-0.9
			c1.6,0.3,1.3-0.8,0.3-0.9c0.3-0.7,1.1,0.4,2.1,0C902.6,197.1,901.1,196.6,901.6,197.9z M902.2,26.1c0.4-0.5,3-0.7,2.7,0.6
			C903.9,27.4,903.1,26.2,902.2,26.1z M904.8,50.6c-0.2,0.2-1.5,0.7-1.2-0.3c-0.3,0-0.5,0.1-0.6,0.3C901.9,49.3,905,49.1,904.8,50.6
			z M904,58.1c-0.7,0-0.6-0.8-0.6-1.5C904,56.8,904.6,57.5,904,58.1z M903.1,200.6c0.6,1.3,2.2,0,2.1,1.8
			C903.8,202.5,902.3,201.7,903.1,200.6z M905.4,217c-0.8,0-1.2-0.4-1.2-1.2c0.4-0.4,1.1-0.4,1.5,0
			C905.9,216.5,905.5,216.6,905.4,217z M906,208.1c0.8-0.1,1.3,0.1,1.2,0.9C906.5,209,905.7,209.1,906,208.1z M908.1,233.8
			c-0.8,0-1.5-0.1-1.5-0.9C907.4,232.9,908.2,232.9,908.1,233.8z M907.8,204.2C907.1,206.7,905.4,202.8,907.8,204.2L907.8,204.2z
			 M908.4,202.4c0,0.3-0.4,0.2-0.6,0.3c-0.4,0-0.3,0.5-0.3,0.9c-1.1,0.2-1.1-0.6-2.1-0.6C905.9,201.9,907.3,203.1,908.4,202.4z
			 M906.9,41.3c-1.1,0.1-1.8-0.2-1.8-1.2c0.9,0.2,0.9-0.5,1.8-0.3C906.4,40.4,906.9,40.6,906.9,41.3z M906.6,6c-0.6,0-1.2,0-1.8,0
			c-0.7-0.3-0.2-1.8-1.5-1.5c0.9-0.7,2.7-1,4.5-0.3C907.7,5.1,906.6,5,906.6,6z M907.5,7.5c-0.9-0.5,0.2-2.2,0.9-1.2
			C908.3,7,907.6,6.9,907.5,7.5z M906.6,2.8c0-1.1,0.9-1.3,2.1-1.2c0.4,0.7,0.9,1.3,1.2,2.1C908.5,4.4,908.5,2.4,906.6,2.8z"></path>
		<path fill="#4C3C2C" d="M1043.3,239.5c0,0,0-1.3,0.2-3.2c0.2-1.9-0.8-2.7-1-4.2c-0.2-1.5,0-2.7,0.5-4.7c0.5-2,0.2-3.2,0.3-4.4
			c0.2-1.2-0.2,0.3-2-0.7c-0.4-0.2-0.7-0.3-0.9-0.4c0.1,0,0.3,0.1,0.4,0.2c-0.5,0.3-0.7,0.9-0.9,1.5c-0.2-0.7-0.9-1.3-1.6-1.5
			c-0.3,0.1-0.5,0.1-0.8,0.1c-0.2,0-0.3,0-0.5,0c-0.1,0.2-0.2,0.4-0.1,0.9c-0.7,0.1-0.7-0.5-1-0.9c-0.7,0-1.3,0-1.4-0.1
			c-0.1,0.4-0.3,0.7-0.9,0.6c-0.1-0.1-0.2-0.2-0.2-0.4c-2.1,0.5-4.7,0.8-6.9,0.5c-0.2,0.1-0.3,0.2-0.3,0.5c-1-0.2-1-0.9-2.1-0.3
			c-0.2-0.5-0.6-0.8-0.8-1.3c0,0-0.1,0-0.1-0.1c-0.6-1.6,0.5-5.6,0.2-8.4c0-0.3-0.1-0.6-0.2-1c-0.7,0.2-1.5,0.3-1.5-0.7
			c0.2-0.2,0.8-0.4,1.2-0.3c-0.3-0.9-0.7-1.8-0.8-2.7c-0.2-1.6,0.8-3.6,1.1-5.7c0.5-3.4-0.7-7.5-0.3-10.4c0.1-0.8,0.6-1.6,0.7-2.4
			c0.1-2.1-0.2-4.6-0.2-6.8c0-2.8-0.6-6-0.7-8.6c-0.1-1.1,0.2-2,0-2.9c-0.3-1.4-1.5-2.3-1.1-4.6c0.3-2.3,1.9-6.8,2.2-9
			c0.5-3.4-0.4-9.9-0.4-10.8c0-0.9-0.1-1.8,0.4-3.7c0.5-1.9,0.8-10.1,0.7-10.7c-0.1-0.6-0.2-1.9-0.5-3.1c-0.4-1.2-0.2-2.4-0.3-3.4
			c-0.1-1,0.1-1.2,0.5-2.9c0.4-1.6-0.1-4-0.2-4.8c-0.2-0.8-0.2-1.5-0.5-3.1c-0.3-1.6,0.7-9.7,0.4-11.5c-0.3-1.8,0.1-8.6,0.3-10.7
			c0.3-2.1,0-9.5,0-10.8c0-1.3-0.4-3.1-0.9-4.4c-0.6-1.3-0.2-2.9,0.4-5.9c0.6-3.1,0-14.4,0.1-16.6c0.1-2.3-0.3-4.8-0.4-6.1
			c-0.1-1.3-0.7-2.9-0.6-3.4c0.1-0.5,0.1-0.9,0.3-1.9c0.2-1.1-0.2-1.2,0.2-1.9c0.4-0.7,0.2-4.5,0.3-5.4c0.1-0.9,0.1-2.1-0.2-3
			c-0.2-0.9-0.1-0.9,0.2-1.3c0.2-0.2,0.4-0.3,0.5-0.4c1.6,0.4,3.2,1.1,4.4,1c1.6-0.1,3.2-1.1,4.7-1.2c2.7-0.1,5.2,0.3,6.9-0.2l0,0
			c5.2-3.3,1.1-10.9,2.7-15.9c-1.6-2.3-0.2-5.2-1.1-8.2c0.6-2,2-4,1.4-6.5l-0.3,0c0-0.5-0.3-0.5-0.6-0.7c-0.2-0.2-0.5,0.1-1.2,0.5
			c-0.7,0.4-0.9,0.1-0.9,0.1c-3.1-1.3-8.1,0.7-10.3-0.6c-0.6,1.1-3.3,0.4-4.4,0c-2,1.1-4.4-0.2-6.6,0c-2.9,0.2-7.7,0-11.3,0
			c-2.3,0-4.8,0.8-7.3,0.7c-3.6-0.2-8.3-0.2-10.8-0.2c-4.5-0.1-7.9-0.2-12.1,0c0,0-1.2,0.2-1.6-0.1c-0.4-0.3-0.1-0.2-0.6-0.1
			c-0.5,0.2-0.9,0-0.9,0.6c0.1,1.8-0.5,3.5-0.4,5.3c0.1,1.8,0.7,3.6,0.5,5.2c-0.1,0.7-0.5,1.1-0.5,1.7c-0.1,1.6,0.7,3.3,0.5,5
			c-0.1,0.8-0.5,1.5-0.6,2.4c-0.3,2.7,0.9,6.6,0.6,9.9l0.4,0.7c0.9,0,1.2,0,2.1-0.1c0.8-0.1,1.6-0.8,2.5-0.7c2,0.2,3.9,0.8,5.8,0.7
			c2.2-0.2,4.6-0.5,6.3,1.3c0,0,0.8,0,0.9-0.6l0.7-0.8c0,0,0.1,0,0.1,0c0,0.6-0.1,1.2-0.2,1.6c-0.4,1.8,0.3,3.3,0.3,6.1
			c0,1.3-0.5,2.4-0.4,3.4c0.1,0.9,0.6,1.9,0.6,2.8c0.5,5.9-0.8,10.9-0.5,16.8c0.2,5,0.9,7.8,0.5,11.9c-0.2,1.9,0,3.9-0.1,5.8
			c0,2.2-0.2,4.9,0.1,7.1c0.7,5-0.9,8.9-1,13.5c0,1,0.4,2.1,0.4,3.1c0.2,3.4-0.8,6.5-0.8,9.7c0,2.6,0.8,5.2,0.7,7.7
			c-0.2,3.9-0.9,7.9-0.7,11.5c0.1,1.4,0.6,2.8,0.6,4.2c0,1.2-0.6,2.4-0.6,3.7c0,1,0.5,2,0.4,2.8c-0.1,1.3-0.9,2.2-0.8,3.5
			c0,1.7,0.6,3.2,0.5,4.8c-0.6,5.7-0.3,10.9-0.2,17.2c0.1,4.6-0.7,8.8-0.2,12.5c-1.2,1.6,0,3.3,0.1,5.3c0.1,1.8-1,3.7-1,5.5
			c0,1.3,0.6,2.6,0.6,3.9c0,4.8,1.4,9.9,0.9,14.9c-0.3,2.7,0.2,8.7,0.3,11c0.2,2.5-18.3-1.4-18.3,0.6c0,0.3-0.5,0.7-0.5,1
			c0,2.5,0.9,4-0.8,5.5c1,5.1,0.7,10.2,0.9,15.5c0.1,3.6,0.6,4.5,0.5,8l0.2,1c0,0,1.7,0.3,2.4,0.2c0.7-0.2,1.5-0.7,2.7-0.8
			c1.2-0.2,0.7,0,3.2,0.8c2.5,0.8,1.9,0,4.4,0s1.7-0.5,3.9-0.5c2.2,0,1.7,0,3.2,0s2.4,0,3.5,0c1.2,0,3.5,0.2,5.9-0.3
			c0.3-0.1,0.7-0.1,1-0.2c-0.9-0.1-1.5-0.6-1.7-1.4c0.5,0.1,0.6-0.2,0.6-0.6c0.3,0.3,0.8,0.4,1.5,0.3c-0.1,0.6,0.1,0.9,0.6,0.9
			c-0.1,0.2-0.3,0.4-0.3,0.8c1.5-0.1,2.6,0.2,2.6,0.2c1.6,0.1,3.2,0.7,4.8,0.7c0.8,0,1.7,0,2.5,0c-0.2-0.2-0.3-0.4-0.3-0.8
			c1,0.1,1.4-0.4,1.5-1.2c1.1,0.1,1.1,0.4,2.1,0c-0.7,1.2-0.6,1-0.6,1.9c2.5-0.1,5-0.2,7.5-0.2c4.6-0.1,9.9,2,14.7,0.4
			c0.8,0.7,1.6,1.1,2.5,0.6c0.8-0.4,1.5-3.1,1.6-4.7c0-0.4-0.4-1-0.4-1.5C1043.7,245.6,1043.2,241.9,1043.3,239.5z M1032.3,29.2
			c0.8,0.2,0.8-0.4,1.5-0.3c0,1.1-1.4,0.2-0.6,1.5C1032.5,30.4,1032.3,29.9,1032.3,29.2z M1026.7,30.7c0.8,0.7,1.5,0.9,2.4,0.9
			c0,0.8-1.4,0.7-1.8,0.3C1027.6,30.9,1026.3,31.6,1026.7,30.7z M1019.2,18.4c-0.2,0.4-2.3,0.2-2.1-0.9
			C1018.2,17.4,1018.2,18.4,1019.2,18.4z M1017.1,0.8c-0.2,0.6-1,1.1-1.5,0.6C1015.8,0.8,1016.6,0.3,1017.1,0.8z M1016.5,18.4
			c0.5,0.5,1.4,0.6,1.5,1.5c-1.1-0.4-0.6,0.8-1.5,0.6c0.3-0.9-0.7-0.5-1.2-0.6C1015.2,18.9,1016.2,19,1016.5,18.4z M1016.5,203.2
			c-0.2,1-1.8,0.7-2.4,0.6C1014.2,202.9,1015.6,203.3,1016.5,203.2z M1019.2,211.6c-1.1,1.2-2.8-0.6-4.2-0.9
			C1016,209.1,1018.9,210,1019.2,211.6z M1014.1,220.6c-0.7,0.1-0.7-0.5-1.5-0.3c-0.3-1.1,0.7-0.9,0.6-1.8c0.6-0.1,0.8,0.2,1.2,0.3
			C1013.9,219.4,1013.7,219.7,1014.1,220.6z M1008.1,215.2c-0.3,0-0.6,0-0.9,0c0-0.8-0.3-3.2,1.8-3.3
			C1008.7,213.4,1008,213.8,1008.1,215.2z M1008.1,177.5c0.9,0.1,1.8,0.2,1.8,1.2c-0.4,0.7-2.6-0.4-2.1,1.2c-1,0.1-1.4-0.4-1.5-1.2
			C1006.7,178,1008.6,179,1008.1,177.5z M1005.7,171.2c0.2,0.2,0.5,0.3,0.9,0.3c-0.2,0.2-0.3,0.5-0.3,0.9
			C1005.4,172.6,1005.3,171.7,1005.7,171.2z M1009,199.6c0.8,0.2,1.6,0.4,1.5,1.5C1009.5,201.8,1008.3,200.6,1009,199.6z
			 M1009.3,227.1c0.7,0,0.9-0.6,1.5,0C1011,227.8,1009,228.2,1009.3,227.1z M1009.6,193.7c-0.2-1.6,2.2-1.4,2.7-0.6
			c-0.1,0.4-0.5,0.5-0.6,0.9C1010.6,193.8,1010.6,193.1,1009.6,193.7z M1011.1,47.7c0.5-0.1,0.5,0.3,0.9,0.3
			c-0.2,0.4-0.4,0.8-0.6,1.2C1010.8,49.3,1011.3,48.1,1011.1,47.7z M1011.7,42.6c0.7,0,0.9,0.5,1.5,0.6
			C1013.1,44.2,1011.4,43.8,1011.7,42.6z M1012.6,55.5c-0.7-0.2-1.5-0.3-1.5-1.2C1011.8,54.5,1012.7,54.5,1012.6,55.5z M1011.7,191
			c1.1,0,1.7,0.5,2.1,1.2c0,0.8-0.4,1.2-1.2,1.2C1012.5,192.4,1011,191.8,1011.7,191z M1013.8,202c0.2-1-0.6-0.9,0-1.5
			C1014.9,200.5,1014.9,202.1,1013.8,202z M1014.4,182.3c-0.4,0.7-1.1-0.3-1.2,0.3c-0.9-0.2,0.3-0.6,0-1.2
			C1014,181.3,1014.5,181.5,1014.4,182.3z M1012,18.1c0.5,0,1,0,1.5,0C1013.6,19.3,1011.7,19.8,1012,18.1z M1008.7,34.2
			c1.4-0.1,2,0.6,2.7,1.2c0.4,0,0.3-0.5,0.3-0.9c0.9-0.1,0.7,0.9,1.8,0.6c0,0.5-0.1,1.1,0.3,1.2c-1.2,0.2-2.2-0.2-4.2-0.9
			c-0.5,0.1,0.4,1-0.9,0.9C1008.2,35.5,1009.3,35.6,1008.7,34.2z M1009,46.8c0.3,1.1-1,0.6-1.2,1.2
			C1006.8,47.3,1008.4,46.8,1009,46.8z M1007.2,148.5c0.8-0.1,0.3,1.1,0.9,1.2c-0.2,0.9-0.6-0.3-1.2,0
			C1007.2,149.4,1007.3,149,1007.2,148.5z M1008.7,166.1c-1.1,0.1-1.8-0.2-1.8-1.2C1007.6,164.3,1009.1,164.7,1008.7,166.1z
			 M1006.9,166.7c-0.5,1.4-1.3-0.2-2.4,0C1004.9,166,1006.4,166.7,1006.9,166.7z M1004.8,110.2c-0.2,1.1,0.7,1.4,0,2.1
			c-1.5,0.1-1.2-2.1-3-0.9C1001.8,110,1003.9,110.7,1004.8,110.2z M1003,133.8c-0.1-0.8,0.4-1,1.2-0.9
			C1004.3,133.7,1003.8,133.9,1003,133.8z M1000.6,249.3c0.1-0.7,1.6-0.2,1.8,0C1002.3,249.9,1000.9,249.5,1000.6,249.3z
			 M1001.8,219.7c0.3,0.1,0.3-0.1,0.3-0.3c0.8-0.1,0.8,0.6,0.9,1.2C1002.5,220.4,1001.8,220.5,1001.8,219.7z M1002.7,182.6
			c-1.3-0.1,0.2-1.3-0.6-1.5c0-0.4,0.5-0.3,0.9-0.3C1002.6,181.7,1003.3,181.8,1002.7,182.6z M1002.7,164.3c-0.9-0.5,0-1.7,0.9-1.5
			C1003.8,163.8,1002.8,163.6,1002.7,164.3z M1003.3,168.8c0.6-0.5,1.8-0.1,1.8,0.9C1004.4,169.6,1003.3,169.7,1003.3,168.8z
			 M1007.8,181.4c-0.7,0.7-2.7,0.1-3.9,0.3c0-0.3-0.1-0.5-0.3-0.6C1004.4,179.9,1006.4,180.9,1007.8,181.4z M1004.8,202.9
			c-0.2,0.6-0.7,0.9-0.6,1.8C1003.2,204.5,1003.8,202.8,1004.8,202.9z M1004.2,212.5c0.5-0.7,1.7-1.7,2.7-0.9c0,0.4,0,0.8,0,1.2
			C1005.6,213.4,1005.4,213.2,1004.2,212.5z M1004.8,241.2c-0.1-0.8,0.4-1,1.2-0.9C1006.1,241.1,1005.6,241.3,1004.8,241.2z
			 M1006.6,251.4c0.2-0.7,1.2-0.6,0.9-1.8c1.5,0.3,2.4,0.3,3.9,0c0.7,1.2,0.9,1.1,1.5,2.4C1011,254.3,1008.7,252.4,1006.6,251.4z
			 M1012.3,237c-0.1-0.7,0-1.1,0.3-1.5c0.4,0.3,1.1,0.3,1.5,0.6c0.3,0.8-1.3,1-0.3,1.5C1013.1,238.8,1013.5,236.3,1012.3,237z
			 M1013.8,251.4c0.6-0.6,1,0,1.5,0.3C1015.3,252.6,1013.5,252.5,1013.8,251.4z M1014.7,250.2c0.2-1.1,1.3-1.3,1.5-2.4
			c0.5-0.1,0.5,0.3,0.9,0.3c-1.2,1.5,0.4,1.1,0.6,2.7C1016.3,251,1015.8,250.3,1014.7,250.2z M1016.2,221.5c1.1-0.8,2.5,0.3,3.9,0.3
			C1019.7,223.3,1016.6,222.2,1016.2,221.5z M1015.9,200.2c0.4-1.3,1.3-0.5,2.1,0c0.8-0.4,1.1-1.3,2.4-1.2c0.6,0.7-0.2,1.2,0.3,2.1
			C1019.1,200.1,1017.1,201.3,1015.9,200.2z M1022.2,240c0.2-0.4,0.4-0.8,0.6-1.2c1,0,1.6,0.4,1.8,1.2
			C1023.5,239.8,1022.9,240.7,1022.2,240z M1028.2,234.9c0.4,0.5,1.5,0.3,2.4,0.3c-0.3,1.2-2.6,1.7-3.6,1.2
			C1027.3,235.9,1028.6,236.2,1028.2,234.9z M1028.8,248.4c-0.8,0.1-1.3-0.1-1.2-0.9c0.3,0.1,0.3-0.1,0.3-0.3
			C1028.7,247.1,1028.8,247.6,1028.8,248.4z M1030,249c1.3-0.3,1.7,0.3,2.1,0.9C1031.4,250.7,1030,249.8,1030,249z M1036.2,239.4
			c-0.3,0-0.3-0.5-0.3-0.9c0.3-0.3,0.8-0.4,1.5-0.3C1037.7,239.2,1036.3,238.7,1036.2,239.4z M1038.6,236.7c-1.4,0.6-2.4-1-3.6-1.5
			c0.9-1.2,3.2,0.9,3.6-0.6c0.8-0.1,0.8,0.6,0.9,1.2C1038.4,235.4,1038.2,235.6,1038.6,236.7z"></path>
		<path fill="#4C3C2C" d="M70.6,239.5c0,0,0-1.3,0.2-3.2c0.2-1.9-0.8-2.7-1-4.2c-0.2-1.5,0-2.7,0.5-4.7c0.5-2,0.2-3.2,0.3-4.4
			c0.2-1.2-0.2,0.3-2-0.7c-0.4-0.2-0.7-0.3-1-0.4c-0.2,0.3-0.3,0.6-0.2,1.2c-0.6-0.7-0.9,0.1-1.8,0c0.3-0.3,0.6-0.8,0.9-1.2
			c-0.5,0.1-1,0.3-1.8,0.3c-1.5,0-3-0.1-3-0.1c-3.3,0.9-8.9,1.6-11.3-0.4c-0.6-1.6,0.5-5.6,0.2-8.4c0-0.3-0.1-0.7-0.2-1
			c-0.7,0-1.3-0.1-1.2-0.9c0.4,0,0.7,0,1,0.1c-0.3-0.9-0.8-1.9-0.9-2.9c-0.2-1.6,0.8-3.6,1.1-5.7c0.5-3.4-0.7-7.5-0.3-10.4
			c0.1-0.8,0.6-1.6,0.7-2.4c0.1-2.1-0.2-4.6-0.2-6.8c0-2.8-0.6-6-0.7-8.6c-0.1-1.1,0.2-2,0-2.9c-0.3-1.4-1.5-2.3-1.1-4.6
			c0.3-2.3,1.9-6.8,2.2-9c0.5-3.4-0.4-9.9-0.4-10.8c0-0.9-0.1-1.8,0.4-3.7c0.5-1.9,0.8-10.1,0.7-10.7c-0.1-0.6-0.2-1.9-0.5-3.1
			c-0.4-1.2-0.2-2.4-0.3-3.4c-0.1-1,0.1-1.2,0.5-2.9c0.4-1.6-0.1-4-0.2-4.8c-0.2-0.8-0.2-1.5-0.5-3.1c-0.3-1.6,0.7-9.7,0.4-11.5
			c-0.3-1.8,0.1-8.6,0.3-10.7c0.3-2.1,0.1-9.5,0.1-10.8c0-1.3-0.4-3.1-0.9-4.4c-0.6-1.3-0.2-2.9,0.4-5.9c0.6-3.1,0.1-14.4,0.1-16.6
			c0.1-2.3-0.3-4.8-0.4-6.1c-0.1-1.3-0.7-2.9-0.6-3.4c0.1-0.5,0.1-0.9,0.3-1.9c0.2-1.1-0.2-1.2,0.2-1.9c0.2-0.3,0.2-1.4,0.3-2.5
			c0,0,0,0.1-0.1,0.1c-1.2,0.1-1.9-0.3-1.8-1.5c0.8,0.5,1.3,0.2,1.9-0.1c0-0.7,0-1.2,0-1.5c0.1-0.7,0.1-1.6-0.1-2.4
			c0-0.1,0-0.2,0-0.3c0-0.1,0-0.2-0.1-0.3c-0.2-0.9-0.1-0.9,0.2-1.3c0-0.1,0.1-0.1,0.1-0.1c-0.1,0-0.2,0-0.3,0
			c0.2-0.9-0.8-0.6-0.6-1.5c0.3-0.2,0.7-0.3,1.2-0.3c-0.2,0.8,0.1,1.1,0.9,0.9c0,0.4-0.2,0.6-0.5,0.8c1,0.3,2,0.6,2.9,0.8
			c-0.4-0.3-0.6-0.7-1.2-0.7c-0.1-1,1.3-0.5,0.9-1.8c0.9-0.1,1.2,0.4,1.5,0.9c0.4-0.3,0.6-0.8,0.9-1.2c1.3,0,1.4,1.2,2.7,1.2
			c0,0.3,0,0.5-0.1,0.6c0.4-0.1,0.8-0.2,1.1-0.2c0.1,0,0.1,0,0.2,0c0.3-0.7,0.9-0.2,1.5,0c0.2,0,0.4,0,0.6,0c0.1,0,0.1-0.1,0.2-0.2
			c0-0.1,0-0.2,0.1-0.2c0,0.1-0.1,0.2-0.1,0.2c0,0.1,0,0.1,0,0.2c1.8,0,3.3,0.1,4.4-0.2l0,0c5.2-3.3,1.1-10.9,2.7-15.9
			c-1.6-2.3-0.2-5.2-1.1-8.2c0.6-2,2-4,1.4-6.5l-0.3,0c0-0.5-0.4-0.5-0.6-0.7c-0.2-0.2-0.5,0.1-1.2,0.5c-0.7,0.4-0.9,0.1-0.9,0.1
			c-3.1-1.3-8.1,0.7-10.3-0.6c-0.6,1.1-3.3,0.4-4.4,0C51,1,49.3,0.6,47.7,0.3c0,0.1,0,0.2,0,0.3C47.3,1,46.6,1,45.9,1
			c0-0.4,0.2-0.6,0.4-0.7c-0.1,0-0.2,0-0.4,0c-2.9,0.2-7.6,0-11.3,0c-2.3,0-4.8,0.8-7.3,0.7c-0.4,0-0.8,0-1.2-0.1c0,0.1,0,0.3,0,0.4
			c-0.5,0.1-0.8-0.1-0.8-0.4c-3.2-0.1-6.7-0.1-8.8-0.1C12,0.6,8.7,0.5,4.4,0.7c0,0-1.2,0.2-1.6-0.1C2.5,0.3,2.7,0.4,2.2,0.5
			c-0.5,0.2-0.9,0-0.9,0.6C1.3,3,0.8,4.7,0.9,6.5c0.1,1.8,0.7,3.6,0.5,5.2c-0.1,0.7-0.5,1.1-0.5,1.7c-0.1,1.6,0.7,3.3,0.5,5
			c-0.1,0.8-0.5,1.5-0.6,2.4c-0.3,2.7,0.9,6.6,0.6,9.9l0.4,0.7c0.9,0,1.2,0,2.1-0.1c0.8-0.1,1.6-0.8,2.5-0.7c2,0.2,3.9,0.8,5.8,0.7
			c2.2-0.2,4.6-0.5,6.3,1.3c0,0,0.8,0,0.9-0.6l0.7-0.8c0,0,0.1,0,0.1,0c0,0.6-0.1,1.2-0.2,1.6c-0.4,1.8,0.3,3.3,0.3,6.1
			c0,1.3-0.5,2.4-0.4,3.4c0.1,0.9,0.6,1.9,0.6,2.8c0.5,5.9-0.8,10.9-0.5,16.8c0.2,5,0.9,7.8,0.5,11.9c-0.2,1.9,0,3.9-0.1,5.8
			c0,2.2-0.2,4.9,0.1,7.1c0.7,4.8-0.8,8.6-0.9,12.9c0.7,0,0.9,0.5,1.5,0.6c0,0.2,0,0.4,0,0.6c-0.5,0.1-0.8,0.5-1.3,0.6
			c0.1,0.6,0.3,1.2,0.3,1.8c0.2,3.4-0.8,6.5-0.8,9.7c0,2.6,0.8,5.2,0.7,7.7c-0.2,3.9-0.9,7.9-0.7,11.5c0.1,1.4,0.6,2.8,0.6,4.2
			c0,1.2-0.6,2.4-0.6,3.7c0,1,0.5,2,0.4,2.8c-0.1,1.3-0.9,2.2-0.8,3.5c0,1.7,0.6,3.2,0.5,4.8c-0.6,5.7-0.3,10.9-0.2,17.2
			c0.1,4.6-0.7,8.8-0.2,12.5c-1.2,1.6,0,3.3,0.1,5.3c0.1,1.8-1,3.7-1,5.5c0,1.3,0.6,2.6,0.6,3.9c0,0.3,0,0.7,0,1
			c0.2,0.1,0.4,0.2,0.6,0.4c0,0.3-0.2,0.5-0.5,0.6c0.2,3,0.8,6.2,0.9,9.3c0.7-0.1,1.6,0.3,2,0.4c0.3,0.7,0,1,0.3,2.1
			c-1,0.3-1.6,0.6-2.3,0.7c0,0.2,0,0.3,0,0.5c-0.3,2.7,0.2,8.7,0.3,11c0.2,2.5-18.3-1.4-18.3,0.6c0,0.3-0.5,0.7-0.5,1
			c0,2.5,0.9,4-0.8,5.5c1,5.1,0.7,10.2,0.9,15.5c0.1,3.6,0.6,4.5,0.5,8l0.2,1c0,0,1.7,0.3,2.4,0.2c0.7-0.2,1.5-0.7,2.7-0.8
			c1.2-0.2,0.7,0,3.2,0.8c2.5,0.8,1.9,0,4.4,0c2.5,0,1.7-0.5,3.9-0.5s1.7,0,3.2,0c1.5,0,2.4,0,3.5,0c1.2,0,3.5,0.2,5.9-0.3
			c2.4-0.5,4.3-0.1,4.3-0.1c1.6,0.1,3.2,0.7,4.8,0.7c4.3,0.1,8.4-0.2,12.7-0.3c4.6-0.1,9.9,2,14.7,0.4c0.8,0.7,1.6,1.1,2.5,0.6
			c0.8-0.4,1.5-3.1,1.6-4.7c0-0.4-0.4-1-0.4-1.5C70.9,245.6,70.5,241.9,70.6,239.5z M64.1,27.9c-1,0.3-0.9-0.5-1.5-0.6
			C63,26.5,64.4,26.5,64.1,27.9z M13,226.9c-0.8-0.1-0.4-1.4-1.5-1.2c0.1-0.4,0.5-0.5,0.6-0.9c0.1-0.3-0.1-0.3-0.3-0.3
			c0.7-0.4,1.7,1.3,2.4,1.8C14.4,227.1,12.8,226.1,13,226.9z M48.6,23.4c-1.1,0.2-0.7-1.1-1.8-0.9c0-0.6,1-0.2,0.9-0.9
			C48.6,21.6,49.1,22.8,48.6,23.4z M47.7,17.4c0,0.3,0,0.6,0,0.9c-0.6,0.1-0.8-0.2-1.2-0.3C46.5,17.5,47,17.3,47.7,17.4z M47.4,5.2
			c-0.9,0.8-1.7-0.5-2.7-0.6C45.1,4.1,47.7,3.9,47.4,5.2z M44.7,172.8c-0.6-0.2-2.1,0.5-1.8-0.6C43.3,171.7,44.9,171.7,44.7,172.8z
			 M44.7,26.1c-0.9,0.4-1.4,0.2-1.5-0.9C43.9,25.2,44.7,25.2,44.7,26.1z M44.1,36.3c-0.3,0.4-0.2,1.2-1.2,0.9
			c-0.1-0.6,0.2-0.8,0.3-1.2C43.7,35.9,43.7,36.2,44.1,36.3z M42.3,20.4c0.5,0.1,0.7,0.5,0.6,1.2c-0.6,0.1-0.8-0.2-1.2-0.3
			C41.8,20.9,42.2,20.8,42.3,20.4z M43.5,227.5c-0.8-0.3-1.6-0.3-2.4,0c0-1.5,2.2-2.1,3-1.8C42.7,226.3,43.9,226.7,43.5,227.5z
			 M42,187.1c-0.2-0.3-0.3-0.7-0.3-1.2c0.7,0,0.9-0.6,1.5,0C43.1,186.7,42.7,187.1,42,187.1z M42,94.7c-0.8,0.1-1.3-0.1-1.2-0.9
			C41.6,93.7,42.3,93.7,42,94.7z M41.4,31.2c0.3,1.2,0.4,1.9-0.3,2.7C40,34,39.6,33.5,39,33.3c-0.3-0.9-0.1-0.8,0.3-1.5
			c-0.4-0.4-1.1-0.5-1.5-0.9C38.8,30,40,31.5,41.4,31.2z M38.4,20.4c0.8,0,1.2,0.4,1.2,1.2C38.6,21.7,38.2,21.3,38.4,20.4z
			 M38.7,21.6c-0.2,1.1,0.3,1.5,1.2,1.5c-0.1,1-1,1.2-1.8,1.5c-0.8-1.4,0.2-1.6-0.9-3C37.7,21.6,38.2,21.6,38.7,21.6z M37.2,25.8
			c0.8-0.1,0.8,0.6,0.9,1.2c-0.6,0-1.2,0-1.8,0C36,26,37.1,26.4,37.2,25.8z M34.5,84.6c0.7-0.2,2.1-0.6,2.7,0
			c-0.5,0.9-1.1,1.7-2.4,1.8C35.6,85.6,34.4,85.5,34.5,84.6z M36,95c0.7,0.1,1.4,0.2,1.2,1.2C36.3,96.4,35.9,96,36,95z M36.9,23.1
			c0.7,0.8-1.4,1.7-2.4,0.9C34.8,22.8,36.5,24.5,36.9,23.1z M33.3,24.3c0.9-0.1,1.6,0,1.5,0.9C34.6,24.6,33,25.4,33.3,24.3z
			 M35.1,36c0.3,1.8-0.4,2.6-2.1,2.4C31.9,37,32.8,35.5,35.1,36z M32.7,23.7c-0.3,0.6-0.9,0.9-1.8,0.9c-0.2-0.3-0.3-0.7-0.3-1.2
			C31.7,23.7,32,23.4,32.7,23.7z M30,89.9c1.5-0.4,2.2-1.4,2.7,0.6c-1.7,0.1-2,0.3-3-0.6C29.8,89.6,30,89.8,30,89.9z M29.7,177.3
			c1.3,0.7,3.8,0.2,4.8,1.2c0.3-0.1-0.4-1.6,1.2-1.2c-0.5,3.4-3.6,0.3-5.7,1.2C30.1,177.9,29.6,177.8,29.7,177.3z M24.3,16.2
			c1.2,1.2,4.2,0.6,4.8,2.4c-1.3,0.4-2.4-0.9-2.7,0.3c-0.6-0.3-0.9-0.9-0.9-1.8c-0.9-0.1-0.8,0.8-1.2,1.2
			C23.7,18.1,24.1,16.5,24.3,16.2z M26.4,136c0,0.5,0,1,0,1.5c-0.7-0.1-0.7,0.5-1.5,0.3c-0.3-0.9-0.1-1.3-0.6-2.4
			C25.5,135.1,25.1,136.4,26.4,136z M24,133c0.3-0.7,1.9-0.1,1.5,0.9C24.6,134,24.7,133.1,24,133z M26.1,21.9c0.5-1,0.4-1.9-0.9-1.2
			c0.3-0.3,0.4-0.8,0.3-1.5C26.7,18.9,28,21.9,26.1,21.9z M26.7,83.7c0.5,0.3,1.2,0.7,0.6,1.2C26.4,85,26.3,84.1,26.7,83.7z
			 M23.7,112.7c-1.1,0.3-0.9-0.7-1.8-0.6C22.1,111.1,23.7,111.9,23.7,112.7z M21.6,55c0.8-0.2,0.8,0.4,1.5,0.3c0.3,1-1,0.4-0.9,1.2
			C21.6,56.4,21.6,55.7,21.6,55z M22.8,92c-0.1,0.9-0.2,1.8-1.2,1.8C21,93.1,21.9,92.1,22.8,92z M20.7,99.8c0-0.9,0.8-1,1.5-1.2
			C22.4,99.7,21.8,99.9,20.7,99.8z M20.7,195.8c-1.4,0.1-2.6,0-2.4-1.5c1.5,0,1.5-0.3,2.7,0C21.3,195.2,20.6,195.1,20.7,195.8z
			 M21,133.9c0-0.7,0-1.4,0.3-1.8c1.3,0,1.5,1.1,2.4,1.5C23,134.2,22.1,133.3,21,133.9z M24,211.1c-1,0.8-2.3-0.1-2.4-1.2
			C22.5,209.2,24,210,24,211.1z M21.6,234.4c0.6-0.6,0.8,0,1.5,0c0.4,0.7-0.8,1.1,0,1.2C23,236,21.5,235.2,21.6,234.4z M23.4,248.2
			c-0.8,0.2-0.8-0.4-1.5-0.3C22,246.9,23.5,247.2,23.4,248.2z M23.4,226c0.7-0.1,1.1,0,1.5,0.3C24.9,227.2,23.1,227.1,23.4,226z
			 M23.7,238c1-0.3-0.3-2.1,1.8-1.8C25.6,237.5,24.7,237.8,23.7,238z M23.7,221.8c0.2-0.9,1.1-1.1,2.1-1.2
			C26.4,222.3,24.5,222.5,23.7,221.8z M25.5,203.6c0-0.9,1.7-0.7,2.1-0.3C27.2,203.7,26.1,204.1,25.5,203.6z M27.6,183.3
			c0.2-1,1-1.4,2.4-1.2C30.4,183.6,28.8,183.2,27.6,183.3z M30.3,184.2c0.9-0.3,0.7,0.5,1.2,0.6C31.4,185.4,29.8,185.1,30.3,184.2z
			 M34.8,180.6c0.2,0.8-0.4,0.8-0.3,1.5c1.4,0.6,2.9-3.5,4.5-1.8c-0.9,1-2.5,1.3-3.6,2.1c0.1,0.6,1.4,0,0.9,1.2
			c-1.8-0.8-3.1-0.6-3.6-3C33.4,180.6,34.1,180.6,34.8,180.6z M35.1,192.8c1.1-0.3,0.9,0.7,1.8,0.6c0.1,0.9-0.1,1.5-0.6,1.8
			C34.7,195,35.6,193.9,35.1,192.8z M36.9,215.6c-0.4,0.5-1.5,0.3-2.4,0.3C34.1,214,37,213.9,36.9,215.6z M34.5,230.2
			c1.7,0,3-0.5,2.4,1.2c-1.4-0.2-1.9,0.5-3.3,0.3C33.9,231.2,34.3,230.8,34.5,230.2z M33,235.9c0.9-0.1,1.6,0,1.5,0.9
			C33.7,236.8,33,236.7,33,235.9z M34.5,247c-0.3-0.8-0.3-1.3,0.9-1.2C35.3,246.3,35.3,247,34.5,247z M35.7,234.7
			c0.9,0.1,1.4,0.6,1.5,1.5C36.4,236,35.5,235.9,35.7,234.7z M38.1,182.7c0.4,0.1,0.5,0.5,0.9,0.6c-0.1,0.6-1.3,0.1-1.2,0.9
			C36.9,183.8,38,183,38.1,182.7z M37.8,227.8c0.1-0.8,1.2-1.5,1.8-0.9C39.6,227.9,38.4,228.4,37.8,227.8z M38.4,226.3
			c-0.1-0.9,0.7-0.9,0.6-1.8c0.7,0.2,1.5,0.3,1.5,1.2C40.2,226.4,39.4,226.4,38.4,226.3z M40.2,239.5c-0.1-1.6,2.1-1.4,2.4-0.3
			C42,239.6,40.8,240,40.2,239.5z M44.4,229.9c-0.8,0.1-1.3-0.1-1.2-0.9C44,228.9,44.5,229.1,44.4,229.9z M44.1,176.4
			c-0.9,0.1-1.6,0-1.5-0.9c1.6,0.3,1.3-0.8,0.3-0.9c0.3-0.7,1.1,0.4,2.1,0C45.1,175.6,43.6,175.1,44.1,176.4z M45.6,29.1
			c-1.2-1.3,2-1.5,1.8,0c-0.2,0.2-1.5,0.7-1.2-0.3C45.8,28.7,45.6,28.8,45.6,29.1z M46.5,36.6c-0.7,0-0.6-0.8-0.6-1.5
			C46.5,35.3,47.1,36,46.5,36.6z M48.3,194.3c0.1,0.6-0.2,0.8-0.3,1.2c-0.8,0-1.2-0.4-1.2-1.2C47.2,193.9,47.9,193.9,48.3,194.3z
			 M48.3,230.5c0.5-0.8,1.8,0,2.1,0.3C49.9,231.1,49,231,48.3,230.5z M50.6,225.4c-0.5-0.6,0.2-0.6-0.3-1.2c-0.3,0.1-0.2,0.3,0,0.3
			c-0.4,0.5-1.6-0.4-2.4,0.3c0.2-1.1-1.1-0.7-0.9-1.8c1.5,0.4,1.5-0.7,2.7-0.6c0.1,0.8-1.2,0.2-0.9,1.2c1.3,0.3,3.8-2,5.1,0.3
			c-0.4,0.7-1.2,1-1.5,1.8C51.5,225.9,51.4,225.4,50.6,225.4z M52.1,233.2c0.2-0.4,0.4-0.8,0.6-1.2c0.3,0.6,1.5,0.3,1.5,1.2
			C53,233.3,53.1,232.8,52.1,233.2z M64.1,224.2c0-0.5-0.4-0.6-0.3-1.2c0.9-0.4,1.7-0.2,1.8,0.9C65.3,224.2,64.8,224.3,64.1,224.2z
			 M67.4,232.9c-0.1-0.6,0.2-0.8,0.3-1.2c0.4,0.2,0.8,0.4,1.2,0.6C68.8,233,68.1,232.9,67.4,232.9z M68.3,227.5c0-0.3,0-0.6,0-0.9
			c0.4,0,0.8,0,1.2,0C69.6,227.4,68.9,227.4,68.3,227.5z"></path>
		<path fill="#4C3C2C" d="M1040.2,221.9c-0.6-0.1-1-0.1-1.5,0.1C1039.2,221.9,1039.8,221.8,1040.2,221.9z"></path>
		<path fill="#4C3C2C" d="M834.6,190.8c-0.4-1.6,0-3.3-0.4-4.9c-0.4-1.6-0.8-5.7-1.6-8.2c-0.8-2.5-1.6-8.2-2.5-11
			c-0.8-2.9-2-9-4.5-11c-2.5-2-4.9-9-5.3-10.2c-0.4-1.2-2.9-6.1-4.9-7.4c-2-1.2-4.1-5.7-5.3-7.4c-1.2-1.6-2.5-3.3-3.7-4.9
			c-1.2-1.6-2-2-2.9-3.7c-0.8-1.6-1.6-3.7-2.9-4.9c-1.2-1.2-2-2.9-2.9-4.1c-0.8-1.2-3.3-6.1-4.9-7.4c-1.6-1.2-5.7-5.7-5.7-5.7
			s-2.9-3.3-3.3-5.7c-0.4-2.4-5.6-9.3-7.3-11.4c-0.4,0.8-1.3,1-2.3,1.1c-0.1-0.6-0.6-0.8-0.6-1.5c0.6-0.5,1.8-0.4,2.6-0.1
			c-1.3-1.8-1.5-2.6-3.8-5.3c0,0,0,0,0,0c-0.7,1.3-1.3,0.4-2.7,0.3c0.6-0.7,1.8-0.7,2.7-0.3c-0.8-1-1.4-1.7-1.8-2.4
			c-0.1,0-0.3,0.1-0.6,0c-0.3-0.3-0.4-0.8-0.2-1.2c-0.2-0.4-0.4-0.8-0.7-1.3c0.1,0.5,0,1,0.3,1.4c-1.8,0.2-1.5-1.4-0.9-2.4
			c0,0,0,0,0,0c-1.1-1.7-2.1-2.6-2.6-3.9c-0.3,0-0.7,0-1,0c-0.1-0.9-1.6-1.3-0.6-2.4c0.4,0.1,0.6,0.3,0.9,0.5c-1-2-2.5-4.8-2.2-7
			c0.4-2.9,0.4-1.6,0.4-4.9s-1.2-3.3,0-5.3c1.2-2,1.2-2.5,2-3.7c0.8-1.2,0.8-3.7,0.8-3.7s0.8-1.2,2-2.9c1.2-1.6,2-1.2,2.9-2.9
			c0.8-1.6,2-3.7,3.3-3.7c1.2,0,3.4,0,4.7-0.7c-0.5-0.2-0.9-0.6-1.4-0.7c0.3-0.4,2.1-0.6,2.6,0c1.2-0.6,2.7-1.1,3.9-1.1
			c1.6,0,2.9,0.4,4.5,0c1.6-0.4,2.9-0.4,5.3-0.4c2.5,0,3.7,0,5.7,0c2,0,4.5,0,6.1,0.4c1.6,0.4,2.4,1.6,3.7,1.6c1.2,0,1.2,0,1.2,0
			s1.2-2.9,2-5.3c0.8-2.5,1.2-4.5,1.2-4.5s0-2.5,0.8-3.7c0.8-1.2,0.4-2,1.2-3.7c0.8-1.6,0.4-1.6,1.6-3.3c1.2-1.6,1.2-3.7,1.2-3.7
			s2.5-2.9,0.8-2.9c0,0-2.5,0.8-4.5,0c-2-0.8-2.5-1.6-3.7-1.6c-1.2,0,2.5,0.8-1.2,0c-3.7-0.8-1.2-0.8-3.7-0.8s0.8-0.4-2.5,0
			c-3.3,0.4-3.3,0.4-3.3,0.4s-2,0.4-3.3-0.4c-1.2-0.8-0.8-0.8-4.1-0.8c-3.3,0-4.9-0.4-6.9,0c-2,0.4-6.1,1.6-9,1.2s-4.5-0.4-6.1,0.4
			c-1.6,0.8-6.5,3.3-10.6,5.3c-3.4,1.7-6.8,5.9-9.3,8.3c0,0.5-0.3,0.7-0.8,0.7c-0.2,0.2-0.4,0.3-0.6,0.4c-1.4,0.9-2.7,2.3-3.8,3.7
			c0,0,0.1,0,0.1,0.1c-0.4,0.7-0.8,1.2-1.3,1.5c-0.3,0.5-0.6,0.9-0.7,1.2c-0.8,1.6-4.1,6.5-4.9,9c-0.8,2.5-3.7,12.3-4.1,15.1
			c-0.4,2.9-1.2,5.3-1.2,6.9c0,1.6-0.4,8.2,1.6,11.4c0.8,1.3,1.6,3.1,2.3,5.1c0.2-0.3,0.4-0.6,0.6-0.8c0.3,0.2,0.7,0.3,1.2,0.3
			c-0.2,1.1-0.5,1.7,0.6,2.1c0.1-1,2.1-0.6,1.8,0.6c-1,0.2-1.3-0.3-1.8-0.6c0.1,1.1-0.8,1.1-1.3,1.6c0.7,2.1,1.2,4.1,1.5,5.6
			c0.8,3.7,5.3,10.2,6.5,11.4c1.2,1.2,4.1,4.9,5.3,7.8c1.2,2.9,3.3,6.5,5.3,9c0.4,0.5,0.9,1.2,1.4,1.9c0-0.2,0.1-0.4,0.3-0.5
			c0.5,0.3,1.2,0.7,0.6,1.2c-0.1,0-0.3,0-0.4,0c1.2,1.7,2.5,3.7,3.6,4.9c1.2-0.4,1.7-1,2.2,0.8c-0.6,0-1,0.1-1.4,0.1
			c0.1,0.1,0.2,0.2,0.3,0.2c1.6,1.2,3.7,3.7,4.1,4.9c0.4,1.2,2,4.9,3.7,6.5c1.6,1.6,2.9,1.6,3.3,2.9c0.4,1.2,2,3.3,2,3.3
			s1.2,1.6,2.5,1.6s0.8,2,2,3.7c1.2,1.6,2,2.9,2.5,4.1c0.4,1.2-0.8-0.8,0.4,1.2c1.2,2-1.6,0,1.2,2c2.9,2,3.3,3.7,3.3,3.7l0.8,2
			l1.2,1.6c0,0,2,6.1,4.1,7.8c2,1.6,4.1,6.5,4.1,6.5s1.6,4.9,2.5,6.5c0.8,1.6,2.9,7.4,2.9,7.4s-1.2,6.1,1.2,9.4
			c2.5,3.3,2.9,7.4,2.5,9c-0.4,1.6-0.8,4.9-0.8,6.1c0,1.2-1.2,3.3-1.2,5.3c0,2,0,4.1,0,4.1s-0.4,2-0.8,3.3s-3.3,3.3-4.5,4.1
			c-1.2,0.8-4.9,2.9-6.9,4.1c-2,1.2-2.9,0.4-4.1,1.2c-1.2,0.8-3.7,0.8-3.7,0.8s-3.7-0.4-5.3-1.2c-1.6-0.8-2.9-0.4-4.1-1.2
			c-1.2-0.8-1.6-0.8-3.7-2c-2-1.2-2-0.8-3.7-1.6c-1.6-0.8-1.6-0.8-1.6-0.8s-1.6-0.4-3.7-2.5c-2-2-2.5-0.8-3.7-2.9
			c-1.2-2-2.5-2.9-3.7-3.3c-1.2-0.4-2.5-0.8-2.9,0.4c-0.4,1.2-1.2,2-2.5,3.3c-1.2,1.2,0.4,2.5-2.9,4.1c-3.3,1.6-3.3,1.6-3.3,1.6
			l-1.2,2.5l-2.5,2.5c0,0-1.2,0-2.9,1.6c-1.6,1.6-3.7,1.2-2,3.7c1.2,1.8,2.5,3.2,3.9,4.1c-0.2-0.4-0.3-1-0.2-1.8
			c0.6,0,0.4-0.8,1.2-0.6c0-0.5-0.2-0.8-0.6-0.9c0-0.7,0.8-0.6,1.5-0.6c-1.2,1.7,1.6,0.1,1.5,1.5c-1.3-0.7-1.6,1.3-3,1.5
			c1.9,1.2,3.9,1.1,5.7,2.7c-0.3,0.4-0.3,1-0.8,1.2c0.2,0.2,0.5,0.4,0.7,0.6c0.6,0.6,0.8,1.2,1.2,1.7c0,0,0.1,0.1,0.1,0.1
			c0,0,0,0,0,0c0.1,0.2,0.3,0.4,0.5,0.6c0.2-0.1,0.4-0.1,0.7,0c0-0.3-0.1-0.5-0.3-0.6c0.1-0.6,1,0.3,0.9,0.9
			c-0.1,0.1-0.2,0.2-0.3,0.3c0.1,0.1,0.3,0.2,0.5,0.2c2.5,1.2,2.9,1.6,4.1,2c1.2,0.4,2.5,2.5,4.1,2.5c1.6,0,3.7-1.6,3.7,0
			c0,1.6-2,0.8,0,1.6c2,0.8,3.7,0.8,4.9,1.2c1.2,0.4,1.6,0.8,3.3,1.6c1.6,0.8,0.8,0.8,3.7,1.2c2.9,0.4,2.9-0.4,4.9,0.8
			c2,1.2,2,1.6,3.7,1.6c1.6,0,4.5,0.8,6.1,0c1.6-0.8,3.3-1.6,4.9-1.6c1.6,0,3.7-0.4,5.7-0.4c2,0,3.3,0.4,5.3-0.4c2-0.8,3.7-2,3.7-2
			s0.8,0.4,2.9-0.8c2-1.2,2.9-2,4.1-3.3c1.2-1.2,2.9-1.6,4.1-2.5c1.2-0.8,2.9-3.3,4.1-4.1c1.2-0.8,3.3-5.3,4.5-6.9
			c1.2-1.6,4.9-5.3,4.9-6.9c0-1.6,0.8-6.1,1.2-8.6c0.4-2.5,0.8-5.7,0.8-7.8c0-2,0.8-3.7,0.8-5.3c0-1.6-0.8-6.5-0.8-9
			C835,195.3,835,192.4,834.6,190.8z M771,14c0-0.3,0-0.6,0-0.9c0.9-0.2,0.6-0.2,1.5,0C772,13.4,772,14.2,771,14z M780.9,26.2
			c-0.4,0.3-1.1,0.3-1.8,0.3c-0.1-0.8,1-0.6,0.6-1.8c0.3,0,0.6,0,0.9,0C780.3,25.6,781,25.5,780.9,26.2z M778.8,18.8
			c0.6-0.7,0.8-0.5,2.1-0.9C780.5,18.5,779.3,19.2,778.8,18.8z M779.4,11.3c0.3-0.6,0.7-1.1,1.8-0.9c0.1,0.6,0.6,0.8,0.6,1.5
			C780.7,12,780.1,11.5,779.4,11.3z M783.2,11.6c-0.9-0.5,0.2-2.2,0.9-1.2C784.1,11,783.3,11,783.2,11.6z M784.4,5.6
			c0.4,0.7,0.9,1.3,1.2,2.1c-1.4,0.8-1.5-1.2-3.3-0.9C782.4,5.7,783.2,5.5,784.4,5.6z M783.5,8.3c-0.2,0.8-1.2,0.8-1.2,1.8
			c-0.6,0-1.2,0-1.8,0c-0.7-0.3-0.2-1.8-1.5-1.5C779.9,7.8,781.8,7.6,783.5,8.3z M779.1,11.9c0.1,0.8-0.1,1.3-0.9,1.2
			C778.1,12.3,778.3,11.8,779.1,11.9z M777.9,8.3c-0.4,0.4-0.3,1.3-1.2,1.2c0-0.3-0.1-0.5-0.3-0.6C776.8,7.9,777,8.7,777.9,8.3z
			 M776.7,15.8c-0.7,0-1.4,0-1.8-0.3C774.9,15,777.1,14.8,776.7,15.8z M775.2,13.7c0,0.7-1.3,0.1-1.8,0.3
			C773.4,13.1,774.8,13.3,775.2,13.7z M773.7,14.6c0.4,1.3-0.8,1.9-1.5,1.2C772.2,14.9,772.7,14.5,773.7,14.6z M773.1,11.6
			c-1.1,0.3-2.3,0.6-2.4-0.9C771.4,10.1,773.1,10.4,773.1,11.6z M771,12.2c-0.4,1.7-2.7,0.4-3.3-0.3C768.2,11.4,770.9,11.2,771,12.2
			z M765.3,18.8c-0.8-0.2-0.9-1-1.5-1.5C765,16.5,765.3,17.9,765.3,18.8z M760.8,14.9c1.2-0.1,1.9,0.3,2.1,1.2
			C761.8,16.1,760.5,16.3,760.8,14.9z M756.9,47.8c0.6-0.5,1.6,0.4,1.5,1.5c-0.3,0.3-0.8,0.4-1.5,0.3
			C757.3,48.4,757.5,48.8,756.9,47.8z M758.4,46.3c0.3-0.3,0.4-0.8,0.3-1.5c1.2-0.3,2.5,2.7,0.6,2.7
			C759.8,46.4,759.7,45.6,758.4,46.3z M761.2,64.1c0,0.3,0,0.6,0,0.9c-0.9,0.7-2.2-0.2-1.5-1.2C760.4,63.7,760.8,63.8,761.2,64.1z
			 M761.8,67.3c-0.9,0.6-1-0.5-2.7,0C759.7,65.7,760.8,67,761.8,67.3z M759.6,44.5c-0.6-0.3-0.9-0.9-0.9-1.8
			c-0.9-0.1-0.8,0.8-1.2,1.2c-0.6-0.2-0.3-1.8,0-2.1c1.2,1.2,4.2,0.6,4.8,2.4C761,44.6,759.9,43.3,759.6,44.5z M759.3,25.6
			c0,0.4,0,0.8,0,1.2C758.2,27.1,758.2,25.4,759.3,25.6z M759,18.2c0.1-1.6,0.9-0.3,1.8-0.3C760.8,18.5,759.5,18,759,18.2z
			 M758.1,16.7c0.4-0.2,2.3-1.4,2.4,0c-0.9-0.4-1.4-0.2-1.5,0.9c-0.9-0.5-2.3-0.5-2.4-1.8C757.7,15.5,757.9,16,758.1,16.7z
			 M758.4,52.2c-0.6,0.7-1.3,0.1-1.8-0.3C756.9,51.3,758.6,51,758.4,52.2z M754.8,26.8c0.3-0.3,0.8-0.4,1.5-0.3
			c0.2,1.1-0.5,1.3-1.5,1.2C754.8,27.4,754.8,27.1,754.8,26.8z M756.3,47.2c-0.3,0.4-0.4,0.9-1.2,0.9c-0.2-0.3-0.3-0.7-0.3-1.2
			C755.5,46.8,756,46.9,756.3,47.2z M754.8,49c0.2,1.1-0.9,0.9-1.8,0.9C753.4,49.3,754.1,48.2,754.8,49z M752.4,42.1
			c0.6-0.1,0.8,0.2,1.2,0.3c0.1,0.9-0.3,1.3-1.2,1.2C752.4,43.1,752.4,42.6,752.4,42.1z M751.2,47.2c0.7-0.4,2.1,0.3,3,0.6
			c-0.9,1.1-1.7,0.7-3,0.3C751.2,47.8,751.2,47.5,751.2,47.2z M751.2,54.9c1.1-0.2,0.7,1.1,1.8,0.9c-0.1,1.1-1.7,0.8-0.9,2.1
			C750.3,57.8,751.4,56.5,751.2,54.9z M748,54.6c0.4-0.4,1.7,0,2.4,0.3C750.1,55.9,747.7,56.4,748,54.6z M750.3,76.9
			c0,0.5,0,1,0,1.5c-0.4,0-0.8,0-1.2,0c-0.1-0.7,0-1.1,0.3-1.5C749.8,76.9,750.1,76.9,750.3,76.9z M743.5,79.3
			c-0.3-1,0.5-0.9,0.6-1.5c1.1,1,3,1.4,3.9,2.7C746.6,80,745.3,79.5,743.5,79.3z M747.7,82.9c-0.9-0.6-1.7,0.3-2.4-0.3
			c0.6-0.7,1.3-1.3,2.4-1.5C747.9,81.8,748.1,82.1,747.7,82.9z M747.1,56.1c0.3-0.6,1.7,0.1,1.5,0.9c-0.3,0.2-0.7,0.3-1.2,0.3
			C747.3,56.9,747.5,56.2,747.1,56.1z M747.7,77.5c-0.1-0.8,0.1-1.3,0.9-1.2C748.6,77.1,748.4,77.6,747.7,77.5z M748.3,49.3
			c0.8-0.2,0.6,0.6,1.2,0.6c-0.2,0.2-0.3,0.5-0.3,0.9C747.9,51.1,747.7,49.8,748.3,49.3z M748.3,52.2c-0.1,1-1.9,0.3-2.1,1.2
			C745.4,52.8,747.3,51.2,748.3,52.2z M745.6,23.5c0.3,0,0.6,0,0.9,0c0.2,1.1-0.5,1.3-1.5,1.2C745.1,24.3,745.4,24,745.6,23.5z
			 M743.5,26.8c0.7,0,1.4,0,1.8,0.3C745.1,27.7,743,28.3,743.5,26.8z M746.2,49.3c-0.5,1.2,0.8,0.6,0.9,1.2c-0.2,1.2-1.8,1-2.4,1.8
			c-1-0.2-0.4-2-1.5-2.1C743.5,49.2,745.3,49.6,746.2,49.3z M742,80.8c1.3-0.2,1.2,1,2.1,1.2C743.7,82.5,741.9,81.8,742,80.8z
			 M744.7,85.3c-0.2-0.7-0.8-1.2-0.9-2.1c0.3-0.1,0.5-0.3,0.6-0.6c0.3-0.4,0,1.2,0.6,1.8c0.9-0.2,2.8,0.6,2.4-0.9
			c1.2-0.3,1.1,0.7,1.8,0.9C748.5,85.3,747,85.3,744.7,85.3z M748.9,83.2c0-0.7,0-1.4,0.3-1.8c1.3,0,1.5,1.1,2.4,1.5
			C750.9,83.5,750,82.6,748.9,83.2z M751.8,70.6c-0.4,0-0.8,0-0.9,0.3c-0.9-0.3,0.1-1,0.3-1.2c0.2,0.1,0.3,0.3,0.6,0.3
			C751.8,70.2,751.8,70.4,751.8,70.6z M753.4,83.2c-0.9,0.1-0.8-0.8-1.5-0.9C752.2,81.6,753.8,82.2,753.4,83.2z M754.3,86.8
			c-0.7-0.1-0.7,0.5-1.5,0.3c-0.3-0.9-0.1-1.3-0.6-2.4c1.2-0.3,0.8,1,2.1,0.6C754.3,85.8,754.3,86.3,754.3,86.8z M755.4,82
			c-0.7,0-0.6-0.8-0.6-1.5c0,0,0,0,0.1,0c-0.1,0-0.2,0-0.3,0c0.2-0.2,0.3-0.5,0.3-0.9c0.3,0,0.6,0,0.9,0c0,0.3,0,0.6,0,0.9
			c-0.1,0-0.3,0-0.4,0c0.3,0.1,0.4,0.4,0.9,0.3C756.6,81.8,755.3,81.2,755.4,82z M753.7,75.4c0.4-0.7,2.1-0.1,3-0.3
			c0.3,1-1,0.4-0.9,1.2c0.1,0.2,0.3,0.3,0.3,0.6c0.7,0.1,0.9-0.5,1.2-0.9c0.8,0.4,1.7,0.7,1.8,1.8C756.7,79.6,754.9,76.7,753.7,75.4
			z M762.7,74.8c-1.8-0.4-3.7-0.7-5.1,0c0.7-1.2-0.4-0.9-0.3-2.1c1.5-0.2,1.3-0.7,1.5-1.8c1.3,0,1.5,1,3,0.9c0,0.7,0,1.4-0.3,1.8
			c0.2,0.7,0.8-0.6,1.5-0.3C763.1,74,762.9,74.5,762.7,74.8z M778.5,85.6c-0.5,1.7-4,1.6-4.2-0.3C776.4,85.7,776.5,86.4,778.5,85.6z
			 M766.3,71.8c-0.9-0.3-1.8-0.6-2.7-0.9C764.1,70.4,766,71.1,766.3,71.8z M764.8,75.7c-0.1-2.3,1.3-1.5,2.7-1.2
			C767,76.5,765.5,73.9,764.8,75.7z M768,111.9c0.8-0.8-0.4-0.9-0.3-1.8c0.7-0.2,2.1-0.6,2.7,0C769.9,111,769.3,111.9,768,111.9z
			 M770.4,121.8c-0.9,0.1-1.3-0.3-1.2-1.2C769.9,120.7,770.6,120.8,770.4,121.8z M771.1,89.2c0.7-0.1,1.1,0,1.5,0.3
			C772.3,90.2,771.1,90.2,771.1,89.2z M775.2,120.3c-0.8,0.1-1.3-0.1-1.2-0.9C774.8,119.3,775.5,119.3,775.2,120.3z M778.5,98.4
			c-0.5,0.8-0.7,1.9-2.1,1.8c0.1-0.7,0.6-1.5,0-2.1c-0.8,0.1-0.6,0.4-1.5,0.9c0.1-0.3,0.1-0.5,0.1-0.7c-0.2,0.1-0.4,0.1-0.7,0.1
			c0.2-0.2,0.3-0.4,0.5-0.6c-0.4-0.5-1.3-0.7-2-1.2c0.3-1,1.8-0.3,2.6,0.1c0.2-0.4,0.3-0.8,0.4-1.3c0.8,0.3,1.2,0.3,2.1,0
			c0.3,0.6,0.4,1.4,0.6,2.1c0.6-0.2,0.9-0.7,1.8-0.6c0.3,1-1,0.4-1.2,0.9c0.1,0.6,1.3,0.1,1.5,0.6
			C780.4,100.1,778.9,99.6,778.5,98.4z M782.4,114.6c0.1-0.3,0.6-0.2,0.6-0.6c0.7,0.6,1.7,0.9,2.1,1.8
			C784.2,116.3,783.2,115,782.4,114.6z M784.4,103.5c0-0.5,0.1-1.1-0.3-1.2C785,101,786.2,103.8,784.4,103.5z M760.8,228.9
			c-0.4,0.5-1.5,0.8-2.1,0.3C758.7,228.3,760.4,228.4,760.8,228.9z M751.5,219.9c1.5,0,1.5-0.3,2.7,0c0.2,0.8-0.4,0.8-0.3,1.5
			C752.5,221.5,751.4,221.4,751.5,219.9z M752.1,222.9c-0.2,1-2,0.4-3,0.6C749.2,222.2,751.6,222,752.1,222.9z M749.8,226.8
			c-0.6,1.7,0.5,1.7,0.6,3.3c-0.5,0-1,0-1.5,0c-0.2-2.4-3.1-1.9-3.6-3.3C746.3,226.2,748.7,226.4,749.8,226.8z M744.7,237.2
			c-0.1-0.7,0-1.1,0.3-1.5c1.1,0.3,1.9,0.9,3,1.2c0,0.7-0.5,0.9-0.6,1.5C746.3,238.1,746.1,237.1,744.7,237.2z M751.2,241.4
			c-0.9,0.6-2.4-0.1-3.3-0.3c-0.2-0.7-0.1-1.4-0.3-2.7c0.8,0.3,1.2,0.9,1.8,1.5c1.7-0.8-0.6-1.4-0.6-2.4c0.8-0.8,1.5,0.3,2.4,0.3
			C750.2,238.9,751,240.1,751.2,241.4z M750.6,235.7c0-1-1-1-0.9-2.1c1.6-0.4,0.8,1.5,1.8,1.8c0.3-0.4,0.7-2.2,0.3-2.4
			c0.5-0.7,2.1-0.1,2.7,0c0.3,0.7,0,1,0.3,2.1C753.2,235.7,752.8,236.1,750.6,235.7z M754.8,235.4c0.9-0.7,2.3,0.1,2.4,1.2
			C756.2,237.4,754.9,236.5,754.8,235.4z M757.5,245c0.4-1.7,0.1-0.1-1.2-0.3c0.2-1.6,0.3-1.8,0.3-3.9c0.9,0,1.4,0.4,2.1,0.6
			c-0.1,1-0.7,1.5-1.2,2.1c0.6,0.8,1-0.3,1.8,0.3c0.7-0.1,0-1.6,0.6-1.8c1,0.1,1.7-0.1,2.4-0.3c0.2,0.9-0.8,0.6-0.6,1.5
			c0.5,1.4,3.4-0.6,3.3,1.8C762.1,246,760.1,244.4,757.5,245z M763.8,240.2c-0.4,0-0.3,0.5-0.3,0.9c-1.2-1.4-2.7,0.2-4.2,0.3
			c-0.5-1.5,0.9-1,1.5-1.5c-0.3-0.5-0.9-0.9-0.3-1.5c1.4,0.4,2.3,1.3,4.5,0.9c0.1,0.8,0.9,0.9,0.9,1.8
			C764.6,241.4,764.9,240.1,763.8,240.2z M767.7,241.4c-0.4-1.9,2.5-2,2.4-0.3C769.7,241.6,768.6,241.4,767.7,241.4z M782.4,236.9
			c0.8,0,1.5,0.1,1.5,0.9C783.1,237.8,782.3,237.8,782.4,236.9z"></path>
		<path fill="#4C3C2C" d="M384,225.7c-0.4-0.2-0.8-0.2-1.4,0.2c0.1,0.4,0.4,0.6,0.9,0.6c-0.3,0.9-0.8-0.4-1.5,0
			c-0.1-0.8,0.4-2.2-0.9-1.8c1.2-0.6-0.5-2.3,0.9-2.7c0-0.5-0.4-0.6-0.3-1.2c-1.5-0.2-1.4,1.2-3,0.9c-0.3-1.7,1.6-1.2,1.5-2.7
			c-0.3-0.8-0.8,0.8-1.2,0.9c-1.3-0.8-1.5-0.8-3.6-0.9c-0.2-0.8,0.4-0.8,0.3-1.5c-1.4,0.1-0.4,1.5-2.7,1.2c0.1-0.9-0.4-1.2-0.9-1.5
			c-0.7,0.2-1.5,0.3-1.5,1.2c-0.9-0.5-0.4-1.1,0-1.8c1.6,0.3,1.3-1.3,2.4-1.5c0.7,1.1,3.1,0.5,3,2.4c0.6-0.1,0.6-0.8,0.9-1.2
			c-0.2-1-1.5-0.9-2.4-1.2c2.6-0.1,3.1-1.5,3.6-3c1,0.1,1.1,1.1,2.1,1.2c0,1.3-0.5,1.7,0,2.7c0.7,0,0.9-1.8,0.6-1.8
			c-0.5-0.4,1.3,0.2,2.1-0.3c0-1.8-2.6-1.9-1.8-3.6c-0.9-0.2-0.9,0.5-1.8,0.3c-0.1-0.8-0.7-1.1-1.8-0.9c0.2-0.3,0.3-0.7,0.3-1.2
			c1.3,0.2,1.8-0.4,3-0.3c-0.8,1.8,1,1.5,1.2,3c0.9-0.4,1.2-0.2,1.8,0.3c-0.2,0.4-0.4,0.8-0.6,1.2c0,0.4,0.4,0.6,0.9,0.6
			c0-1,0-1.8-0.1-2.5c-0.5-5,0.9-10.1,0.9-14.9c0-1.4,0.5-2.6,0.6-3.9c0-1.8-1.1-3.7-1-5.5c0.1-2,1.2-3.8,0.1-5.3
			c0.5-3.7-0.3-8-0.2-12.5c0.1-6.3,0.4-11.5-0.2-17.2c-0.2-1.6,0.4-3.1,0.5-4.8c0-1.2-0.7-2.2-0.8-3.5c-0.1-0.9,0.4-1.9,0.4-2.8
			c0-1.2-0.6-2.5-0.6-3.7c0-1.4,0.5-2.8,0.6-4.2c0.2-3.6-0.5-7.6-0.7-11.5c-0.1-2.5,0.7-5.1,0.7-7.7c0-3.2-1-6.3-0.8-9.7
			c0.1-1,0.4-2,0.4-3.1c0-4.6-1.7-8.5-1-13.5c0.3-2.2,0.1-4.9,0.1-7.1c0-1.9,0.1-3.9-0.1-5.8c-0.4-4.1,0.3-7,0.5-11.9
			c0.1-1.5,0-2.9,0-4.2c-0.7-0.1-1.1-0.6-1-1.5c0.4,0.2,0.7,0.3,0.9,0.2c-0.3-3.7-0.7-7.3-0.4-11.3c0.1-0.9,0.5-1.9,0.6-2.8
			c0.1-1-0.4-2.1-0.4-3.4c-0.1-2.9,0.7-4.3,0.3-6.1c-0.1-0.5-0.2-1.1-0.2-1.6c0,0,0.1,0,0.1,0l1.5,0.4c7.5,1.1,10.4,0.1,10.4,0.1
			c3.9-1.5,4.3-0.5,6.5-0.4c2,0.1,3.8-0.4,5.8-0.7c0.9-0.1,5.5,0.8,6.3,1c0.9,0.1,2.6-0.2,3.5-0.2l0.4-0.7c-0.3-3.3,0.9-7.3,0.6-9.9
			c-0.1-0.8-0.5-1.6-0.6-2.4c-0.1-1.7,0.6-3.4,0.5-5c0-0.6-0.4-1-0.5-1.7c-0.2-1.6,0.4-3.5,0.5-5.2c0.1-1.8-0.5-3.5-0.4-5.3
			c0-0.7-0.4-0.5-0.9-0.6s-0.3-0.2-0.6,0.1c-0.3,0.3-1.6,0.1-1.6,0.1c-2.2-0.1-4.3,0.2-10.2,0.2c-2.9,0-8.5-0.8-11-0.8
			c-2.5,0-5.6,0.6-6.7,0.6c-2.6,0-7.2,0-10.8,0.2c-2.5,0.1-5-0.7-7.3-0.7c-3.6,0-8.4,0.2-11.3,0c-2.2-0.2-4.6,1.1-6.6,0
			c-1.1,0.4-3.8,1.1-4.4,0c-1,0.7-7.3,1.6-12.6,0.8c-5.6-0.9-10.4-0.8-11.9-0.1c0,0-0.2,0.4-0.9-0.1c-0.7-0.4-1-0.6-1.2-0.5
			c-0.2,0.2-0.6,0.2-0.6,0.7l-0.3,0c-0.6,2.5,0.8,4.6,1.4,6.5c-0.9,3,0.4,5.8-1.1,8.2c1.6,5-2.6,12.6,2.7,15.9l0,0
			c1.6,0.5,4.1,0.1,6.9,0.2c1.5,0.1,17.2,0,18.9,0.1c1.3,0.1,2.8,0.5,4.5,0.1c0.1,0,0.3,0.2,0.5,0.4c0.3,0.4,0.4,0.4,0.2,1.3
			c-0.2,0.9-0.3,2-0.2,3c0,0.5,0,1.6,0,2.7c0.6,0.1,1.4,0.5,1.9,0.7c-0.6,0.8-1.2,0.8-1.8,0.6c0,0.7,0.1,1.2,0.2,1.4
			c0.4,0.7,0,0.9,0.2,1.9c0.2,1.1,0.2,1.4,0.3,1.9c0.1,0.4-0.2,1.2-0.4,2.1c0.1,0,0.2,0,0.3,0c0,0.3-0.2,0.5-0.4,0.7
			c0,0.2-0.1,0.4-0.1,0.6c-0.1,1.3-0.5,3.8-0.4,6.1c0.1,2.3-0.5,13.5,0.1,16.6c0.6,3.1,0.9,4.6,0.4,5.9c-0.6,1.3-0.9,3.1-0.9,4.4
			c0,1.3-0.2,8.7,0.1,10.8c0.3,2.1,0.6,8.8,0.3,10.7c-0.3,1.8,0.7,9.9,0.4,11.5c-0.3,1.6-0.4,2.4-0.5,3.1c-0.2,0.8-0.6,3.2-0.2,4.8
			c0.4,1.6,0.6,1.9,0.5,2.9c-0.1,1,0.1,2.2-0.3,3.4c-0.4,1.2-0.5,2.5-0.5,3.1c-0.1,0.6,0.3,8.8,0.7,10.7c0.5,1.9,0.4,2.8,0.4,3.7
			c0,0.9-0.8,7.4-0.4,10.8c0.3,2.2,1.9,6.6,2.2,9c0.3,2.3-0.8,3.3-1.1,4.6c-0.2,0.9,0,1.8,0,2.9c-0.1,2.6-0.7,5.9-0.7,8.6
			c0,2.3-0.3,4.7-0.2,6.8c0,0.8,0.5,1.6,0.7,2.4c0.4,2.9-0.7,7-0.3,10.4c0.3,2.1,1.2,4.2,1.1,5.7c-0.2,1.6-1.2,3.1-1.3,4.6
			c-0.2,2.7-0.2,8.3-0.1,9.5c0.2,1.2-0.2,2.4,0.3,4.4c0.5,2,0.7,3.2,0.5,4.7c-0.2,1.5-1.2,2.4-1,4.2c0.2,1.9,0.2,3.2,0.2,3.2
			c0.1,2.4-0.4,6.1-0.4,8.3c0,0.5-0.5,1.1-0.4,1.5c0.2,1.5,0.5,3.2,1.2,3.6c0.9,0.5,2.2,1.2,2.9,0.5c4.8,1.7,7.6,0.3,11.9,0.2
			c1.5,0,3.2,0.1,4.6-0.5c0,0,0.5-0.7,2.9-0.2c2.4,0.5,1.8,0.3,3,0.3c1.2,0,2,0,3.5,0c1.5,0,1.6-0.7,1.6-0.7c-0.1-3.5,0.4-4.4,0.5-8
			c0.1-5.3-0.1-10.4,0.9-15.5C383.9,227.9,383.9,226.9,384,225.7z M326.1,9c-0.2-1,1.2-1.6-0.3-2.7c1.1-0.8,1.5,1.1,3.3,0.6
			c1.3,1.3,0,2.5,0.9,3.9c-0.7,0.1-1.1,0-1.5-0.3C329,9.2,327.1,8.1,326.1,9z M328.5,13.5c0-0.4,0-0.8,0-1.2c0.7-0.1,1.1,0,1.5,0.3
			C330.1,13.5,329.3,13.6,328.5,13.5z M330.9,16.5c0-0.8,1-0.6,1.8-0.6C332.9,17,331.5,16.3,330.9,16.5z M339.5,6.9
			c0.1-1.6,3,0.2,1.8-2.1c1.8-0.7,2.3,0.9,1.8,2.4C341.5,6.6,342.1,7.6,339.5,6.9z M342.8,19.5c-1,0.3-0.9-0.5-1.5-0.6
			C341.5,17.9,343.3,18.2,342.8,19.5z M343.7,19.2c0.7,0,1.4,0,1.8,0.3C345.4,20,343.3,20.7,343.7,19.2z M345.2,17.1
			c0.2-0.4,0.4-0.8,0.6-1.2c0.3,0,0.6,0,0.9,0C346.9,17,346.2,17.2,345.2,17.1z M342.5,15c0.9-0.8-0.9-0.4-0.6-1.5
			c1.1-0.1,1.4,0.6,2.1,0.9c0.8-0.6,1.3-2.7,3-1.5C346,14.7,345,15.1,342.5,15z M346.1,7.8c-0.4-0.4-0.4-1.1,0-1.5
			c0.8,0,1.2,0.4,1.2,1.2C346.8,7.5,346.7,7.9,346.1,7.8z M374.5,51.8c-1.1,0.2-1.4-0.3-2.1-0.6c-0.3-0.9-0.1-0.8,0.3-1.5
			c-0.4-0.4-1.1-0.5-1.5-0.9c1-0.9,2.2,0.6,3.6,0.3C375.1,50.3,375.2,51,374.5,51.8z M375.1,39.2c0.1-0.4,0.5-0.5,0.6-0.9
			c0.5,0.1,0.7,0.5,0.6,1.2C375.7,39.7,375.5,39.3,375.1,39.2z M376.3,55.1c-0.1-0.6,0.2-0.8,0.3-1.2c0.5-0.1,0.5,0.3,0.9,0.3
			C377.2,54.6,377.3,55.3,376.3,55.1z M379.9,54.5c-0.7,0-0.6-0.8-0.6-1.5C379.9,53.2,380.5,53.9,379.9,54.5z M379.6,46.7
			c-0.3,0-0.5,0.1-0.6,0.3c-1.2-1.3,2-1.5,1.8,0C380.6,47.2,379.3,47.8,379.6,46.7z M382,41.3c-1.1,0.2-0.7-1.1-1.8-0.9
			c0-0.6,1-0.2,0.9-0.9C382.1,39.5,382.5,40.8,382,41.3z M379.9,35.9c0.1-0.5,0.5-0.7,1.2-0.6c0,0.3,0,0.6,0,0.9
			C380.5,36.4,380.3,36,379.9,35.9z M403.2,24c-1,0.4-0.2-1-1.2-0.6c0.3-0.4,0.4-0.9,1.2-0.9C402.7,23.1,403.4,23,403.2,24z
			 M405.3,30c-0.2-0.8,0.4-0.8,0.3-1.5c0.6,0.3,1,0.7,1.5,1.2C406.9,30.6,406,30.1,405.3,30z M410.7,24.3c0.5,0.1,0.6-0.2,0.6-0.6
			c0.8-0.2,0.6,0.6,1.2,0.6c0,0.7-0.5,0.9-0.3,1.8C411,26.2,410.6,25.5,410.7,24.3z M409.2,8.1c-0.3,1.2-1.5,1.5-3,1.5
			C406.6,8.5,407.8,8.3,409.2,8.1z M405.6,7.5C405.1,8,405,8.9,404.1,9C403.5,8.3,404.5,7.4,405.6,7.5z M403.2,19.8
			c-1-0.5-1.6-0.1-2.7,0C400.1,17.3,403.9,17,403.2,19.8z M397.5,18c0.8,0,1.7-0.1,2.1,0.3c-0.4,0.3-0.7,0.9-1.5,0.9
			C398.1,18.6,397.3,18.8,397.5,18z M395.5,17.7c-1.3-0.2-0.7,0.5-0.6,1.2c-1.2-0.4-0.5-1-0.6-2.4C395.2,16.4,395.6,16.8,395.5,17.7
			z M394,14.1c1-0.2,1.1,0.5,1.2,1.2C394.2,15.4,393.8,15,394,14.1z M394,31.8c-0.6,0.6-1.8,0.3-1.5-0.9
			C393.3,30.8,394.1,30.8,394,31.8z M391.9,14.4c0.6-0.2,0.9-0.7,1.8-0.6c0,0.9-0.7,1.1-1.2,1.5c0.6,0.2-0.2,1.8,0.9,1.5
			c-0.1,0.2-0.3,0.3-0.3,0.6c-0.3-0.1-0.3,0.1-0.3,0.3c-0.6-0.4-0.4-1.6-1.8-1.2C390.9,15.1,392.7,15.7,391.9,14.4z M388,22.2
			c-0.3,1.5-2,0-2.7,0C385.9,21.5,387.4,21.5,388,22.2z M385.3,28.8c-0.8,0-1.6,0-2.4,0C382.7,27.6,385.6,27.4,385.3,28.8z
			 M382.9,37.7c-1.1,0.1-1.8-0.2-1.8-1.2c0.9,0.2,0.9-0.5,1.8-0.3C382.3,36.8,382.9,37,382.9,37.7z M382.6,23.1
			c0.1,0.8-1.1,0.3-1.2,0.9C380.5,23.2,381.9,22.5,382.6,23.1z M381.1,18.6c-0.4,0.3-1.1,0.3-1.8,0.3c-0.1-0.8,1-0.6,0.6-1.8
			c0.3,0,0.6,0,0.9,0C380.6,17.9,381.2,17.9,381.1,18.6z M381.1,10.2c-0.3,0.7-1.5,1.4-2.1,0.9C379.6,10.4,379.8,10.6,381.1,10.2z
			 M380.8,23.1c-0.9,0.8-1.7-0.5-2.7-0.6C378.5,22,381.2,21.8,380.8,23.1z M378.1,44c-0.9,0.4-1.4,0.2-1.5-0.9
			C377.4,43.2,378.2,43.2,378.1,44z M376.9,8.1c-0.7,0-1.4,0-1.8-0.3C375.1,7.4,377.3,7.2,376.9,8.1z M375.4,6
			c0,0.7-1.3,0.1-1.8,0.3C373.6,5.5,375,5.6,375.4,6z M373.9,6.9c0.4,1.3-0.8,1.9-1.5,1.2C372.5,7.3,372.9,6.9,373.9,6.9z M373,39.5
			c-0.9,0.1-1.3-0.3-1.2-1.2C372.6,38.4,373,38.8,373,39.5z M371.2,5.4c0.9-0.2,0.6-0.2,1.5,0c-0.5,0.3-0.5,1.1-1.5,0.9
			C371.2,6,371.2,5.7,371.2,5.4z M372.1,39.5c-0.2,1.1,0.3,1.5,1.2,1.5c-0.1,1-1,1.2-1.8,1.5c-0.8-1.4,0.2-1.6-0.9-3
			C371.1,39.5,371.6,39.5,372.1,39.5z M366.7,42.2c0.9-0.1,1.6,0,1.5,0.9C368,42.5,366.5,43.3,366.7,42.2z M365.5,11.1
			c-0.7-0.2-0.9-1-1.5-1.5C365.2,8.8,365.5,10.3,365.5,11.1z M361.1,7.2c1.2-0.1,1.9,0.3,2.1,1.2C362,8.5,360.7,8.7,361.1,7.2z
			 M359.3,16.2c0.4-0.4,1.1-0.4,1.5,0C360.6,17.1,359.4,17.4,359.3,16.2z M359.6,18c0,0.4,0,0.8,0,1.2
			C358.4,19.4,358.4,17.8,359.6,18z M359.3,10.5c0.1-1.6,0.9-0.3,1.8-0.3C361,10.9,359.8,10.3,359.3,10.5z M358.4,9
			c0.4-0.2,2.3-1.4,2.4,0c-0.9-0.4-1.4-0.2-1.5,0.9c-0.9-0.5-2.3-0.5-2.4-1.8C357.9,7.9,358.2,8.4,358.4,9z M355.1,9
			c1.3,0.2,1.4,1.8,3,1.8c0.3,1.4-1,2-0.9,2.7c-1.6,0.7-4.2-0.1-5.1-1.8C352.1,9.9,355.4,11.3,355.1,9z M357.2,40.1
			c0.6-0.5,1.6,0.4,1.5,1.5c-0.3,0.3-0.8,0.4-1.5,0.3C357.6,40.7,357.8,41.2,357.2,40.1z M349.7,8.7c0.3-0.4,0.3-1.1,0.6-1.5
			c0.9-0.1,1.5,0.1,1.8,0.6C352.3,9.1,350.7,8.6,349.7,8.7z M352.7,35.9c0-0.5,0-1,0-1.5c0.6-0.1,0.8,0.2,1.2,0.3
			C354,35.7,353.6,36.1,352.7,35.9z M350.3,14.7c0-0.8,1.2-0.4,1.2-1.2c1.3,1.2,3.8,0.3,5.1,0.9c-0.8,0.8-1.4,0.4-0.6,1.5
			c-0.4,0-0.8,0-0.9,0.3c-1-0.3-0.3-0.7,0-1.2C352.9,15.2,352.1,15.3,350.3,14.7z M353.3,42.2c0.4-0.6,1-1.6,1.8-0.9
			C355.3,42.4,354.2,42.2,353.3,42.2z M355.4,40.4c-0.2-0.3-0.3-0.7-0.3-1.2c0.7-0.1,1.1,0,1.5,0.3C356.3,40,356.1,40.5,355.4,40.4z
			 M355.1,20.1c0-0.3,0-0.6,0-0.9c0.3-0.3,0.8-0.4,1.5-0.3C356.8,20,356.1,20.2,355.1,20.1z M358.7,44.6c-0.6,0.7-1.3,0.1-1.8-0.3
			C357.1,43.6,358.9,43.3,358.7,44.6z M359.6,39.8c0.5-1,0.4-1.9-0.9-1.2c0.3-0.3,0.4-0.8,0.3-1.5C360.2,36.8,361.5,39.9,359.6,39.8
			z M359.9,36.8c-0.6-0.3-0.9-0.9-0.9-1.8c-0.9-0.1-0.8,0.8-1.2,1.2c-0.6-0.2-0.3-1.8,0-2.1c1.2,1.2,4.2,0.6,4.8,2.4
			C361.3,36.9,360.2,35.6,359.9,36.8z M359.6,13.5c0.1-0.4,0.9-0.1,0.9-0.6c0-0.3,0-0.6,0-0.9c1.1,0.2,2,0.8,3,0.3
			C362.7,13.3,360.9,13.1,359.6,13.5z M364.4,42.5c-0.2-0.3-0.3-0.7-0.3-1.2c1.1,0.3,1.4,0,2.1,0.3
			C365.9,42.2,365.3,42.5,364.4,42.5z M366.4,56.3c-1.1-1.3-0.2-2.8,2.1-2.4C368.8,55.7,368.1,56.4,366.4,56.3z M367.9,41.9
			c0.3-1.2,2,0.5,2.4-0.9C371.1,41.8,368.9,42.7,367.9,41.9z M370.6,43.7c0.8-0.1,0.8,0.6,0.9,1.2c-0.6,0-1.2,0-1.8,0
			C369.5,44,370.5,44.3,370.6,43.7z"></path>
		<path fill="#4C3C2C" d="M607.3,73.8c-0.2,0-0.4-0.1-0.7-0.1C606.7,73.8,607,73.8,607.3,73.8z"></path>
		<path fill="#4C3C2C" d="M653,99C653,99,653,99,653,99c-0.1,0.7,0.3,0.9,0.5,1.3C653.4,99.8,653.2,99.4,653,99z"></path>
		<path fill="#4C3C2C" d="M544,239.9c-0.1,0.1-0.2,0.2-0.2,0.3c-1.4-0.3,0-1.8-1.5-2.1c0.2-0.7,1-0.9,1.8-1c0-3.9,0.2-7.7,0.8-11.5
			c-1.7-1.6-0.8-3.3-0.8-6.2c0-0.3-0.5-0.7-0.5-1.1c0-0.1,0-0.1,0-0.2c-0.1,1.5,0-1.8,0,0c0-0.1,0-0.3,0-0.6c0-0.7,0.1-1.6,0.2-2.7
			c-0.4-0.2-0.5-0.5-0.6-1c0.2-0.2,0.4-0.3,0.6-0.3c0.2-2.9,0.3-6.4,0.1-8.4c-0.1-1.6-0.1-3.2,0-4.8c-1.3,0-2.6-0.8-1.9-1.8
			c0.5,1,1.6,0.4,1.9,1c0.3-3.8,0.9-7.6,0.9-11.3c0-1.5,0.5-3,0.6-4.4c0-2-1.1-4.2-1-6.2c0.1-2.3,1.3-4.2,0.1-6
			c0.1-1,0.2-2.1,0.2-3.2c-0.5,0.1-0.4,0.4-1.2,0.8c0.1-0.3,0.1-0.5,0.1-0.7c-0.2,0.1-0.4,0.1-0.7,0.1c0.2-0.2,0.3-0.4,0.5-0.6
			c-0.4-0.5-1.3-0.7-2-1.2c0.3-1,1.8-0.3,2.6,0.1c0.2-0.4,0.3-0.8,0.4-1.3c0.1,0,0.1,0.1,0.2,0.1c-0.1-2.6-0.4-5.4-0.3-8.3
			c0-0.2,0-0.4,0-0.6c-0.7-0.2-1.3-0.6-1.4-1.4c0.6,0.1,1,0.3,1.4,0.4c0-0.6,0-1.3,0-1.9c-0.4,0.2-0.9,0.2-1.4,0.3
			c-0.1-0.6-0.6-0.8-0.6-1.5c0.5-0.4,1.4-0.4,2.1-0.2c0.1-5.1,0.1-9.7-0.3-14.5c-0.2-1.8,0.4-3.5,0.5-5.5c0-1.4-0.7-2.5-0.8-3.9
			c-0.1-1,0.4-2.1,0.4-3.2c0-1.4-0.6-2.8-0.6-4.1c0-1.6,0.5-3.1,0.6-4.7c0.2-4-0.5-8.6-0.7-13c-0.1-2.8,0.7-5.8,0.7-8.7
			c0-3.6-1-7.1-0.8-11c0.1-1.1,0.4-2.3,0.4-3.5c0-5.2-1.7-9.6-1-15.3c0.3-2.5,0.1-5.5,0.1-8c0-0.4,0-0.8,0-1.1
			c-0.5-0.1-0.5-0.8-0.5-1.5c0.2,0.1,0.4,0.2,0.5,0.3c0-1.4,0-2.9-0.1-4.2c0-0.6-0.1-1.2-0.1-1.8c-0.1-0.1-0.1-0.3,0-0.5
			c-0.3,0-0.5,0.1-0.6,0.3c-0.6-0.7,0-1.1,0.6-1.1c0-3.1,0.4-5.9,0.6-9.9c-0.1-0.1-0.2-0.1-0.3-0.1c0-0.3,0.2-0.4,0.4-0.5
			c0.1-4.3-0.3-8.2-0.5-12.2c-0.5-0.2-1-0.7-1.6-0.7c0.2-0.2,0.9-0.4,1.6-0.4c0-1.1-0.1-2.1,0-3.2c-0.1,0-0.2,0-0.3,0
			c0-0.4,0.2-0.5,0.3-0.7c0-0.5,0-1,0.1-1.5c0.1-1.1,0.5-2.1,0.6-3.2c0.1-0.7-0.1-1.5-0.3-2.4c-0.4,0.2-0.8,0.2-1.1,0
			c0.4-0.4,0.6-0.5,1-0.6c0-0.3-0.1-0.5-0.1-0.8c-0.1-2.6,0.4-4.1,0.4-5.7c-0.2-0.1-0.5-0.2-0.7-0.3c0.1-0.3,0.3-0.6,0.6-0.8
			c0,0,0-0.1,0-0.1C543,3.9,543,3.3,543,2.7c-0.1-0.1-0.4-0.2-0.7-0.1c0.3-0.3,0.7-0.5,1.2-0.6c0.1-0.2,0.2-0.4,0.2-0.6
			c0-0.5-0.1-1.1-0.5-1.1c-0.3,0-0.3,0-1.5,0.1c-1.1,0.1-1.6,0.3-1.6,0.3c-2.5,0.1-5-0.7-7.3-0.7c-3.6,0-8.4,0.2-11.3,0
			c-2.2-0.2-4.6,1.1-6.6,0c0,0-0.5,0.1-1.4,0.1c-0.9,0-1.4-0.6-1.5,0.2c-0.1,0.8-0.3,2.3,0,2.6c0.3,0.3-1,0.2-0.3,0.5
			c0.1,0.1,0.3,0.2,0.5,0.4c0.3,0.4,0.4,0.5,0.2,1.4c-0.2,1-0.3,2.3-0.2,3.4c0.1,1-0.1,5.3,0.3,6.1c0.4,0.8,0,1,0.2,2.2
			c0.2,1.2,0.2,1.6,0.3,2.2c0.1,0.6-0.5,2.4-0.6,3.8c-0.1,1.4-0.5,4.3-0.4,6.9c0.1,2.5-0.5,15.3,0.1,18.7c0.6,3.5,0.9,5.2,0.4,6.7
			c-0.6,1.5-0.9,3.5-0.9,5c0,1.1-0.1,6.5-0.1,9.9h0c0,0.2,0,0.3,0,0.5c0,0.6,0,1.1,0.1,1.6c-0.8,0-1.6,0-2.5,0
			c-2.9,0-8.5-0.8-11-0.8c-1.4,0-3,0.2-4.3,0.3c-0.1-0.1-0.1-0.1-0.2-0.2c-0.2,0.1-0.5,0.2-0.8,0.3c-0.6,0.1-1.1,0.1-1.4,0.1
			c-2.6,0-7.2,0-10.8,0.2l0,0c-4.9-0.7-9-0.7-10.9-0.2c0,0,0,0,0,0c0-0.9-0.5-1.8-0.7-2.7c-0.4-3.3,0.7-7.9,0.3-11.7
			c-0.3-2.4-1.2-4.7-1.1-6.5c0.2-1.7,1-3.2,1.3-4.8c0-0.1-0.1-0.2-0.1-0.4c0-0.1,0.1-0.1,0.2-0.2c0.2-3.1,0.2-9.3,0-10.6
			c-0.1-1.1,0.1-2.2-0.2-3.9c-0.1,0-0.2,0-0.4,0c0-0.5-0.4-0.6-0.3-1.2c0.1-0.1,0.2-0.2,0.4-0.2c-0.4-2.1-0.6-3.4-0.4-5
			c0.2-1.7,1.2-2.7,1-4.8c-0.2-2.1-0.2-3.6-0.2-3.6c-0.1-2.7,0.4-6.9,0.4-9.4c0-0.6,0.5-1.2,0.4-1.7c-0.2-1.7-0.5-3.6-1.2-4.1
			c-0.9-0.6-2.2-1.4-2.9-0.5c-4.8-1.9-7.6-0.3-11.9-0.2c-1.5,0-3.2-0.1-4.6,0.6c0,0-0.5,0.7-2.9,0.2c-2.4-0.6-1.8-0.4-3-0.4
			c-1.2,0-2,0-3.5,0c-1.5,0-1.6,0.8-1.6,0.8c0.1,4-0.4,5-0.5,9c-0.1,5.9,0.1,11.8-0.9,17.5c1.7,1.6,0.8,3.3,0.8,6.2
			c0,0.3,0.5,0.7,0.5,1.1c0,0.1,0,0.1,0,0.2c0.1-1.5,0,1.8,0,0c0,0.1,0,0.3,0,0.6c-0.2,2.6-0.6,9.3-0.3,12.4
			c0.5,5.6-0.9,11.4-0.9,16.9c0,1.5-0.5,3-0.6,4.4c0,2,1.1,4.2,1,6.2c-0.1,2.3-1.2,4.2-0.1,6c-0.5,4.2,0.3,9,0.2,14.1
			c-0.1,7.2-0.4,13,0.2,19.4c0.2,1.8-0.4,3.5-0.5,5.5c0,1.4,0.7,2.5,0.8,3.9c0.1,1-0.4,2.1-0.4,3.2c0,1.4,0.6,2.8,0.6,4.1
			c0,1.6-0.5,3.1-0.6,4.7c-0.2,4,0.5,8.6,0.7,13c0.1,2.8-0.7,5.8-0.7,8.7c0,3.6,1,7.1,0.8,11c-0.1,1.1-0.4,2.3-0.4,3.5
			c0,5.2,1.7,9.6,1,15.3c-0.3,2.5-0.1,5.5-0.1,8c0,2.2-0.1,4.4,0.1,6.6c0.4,4.7-0.3,7.9-0.5,13.5c-0.2,6.6,1,12.3,0.5,18.9
			c-0.1,1.1-0.5,2.1-0.6,3.2c-0.1,1.1,0.4,2.4,0.4,3.8c0.1,3.2-0.7,4.9-0.3,6.9c0.1,0.5,0.2,1.2,0.2,1.9c0,0-0.1,0-0.1,0
			c0,0-0.7,0.7-0.7,1.2c0,0.5,0.1,1.1,0.5,1.1c0.3,0,0.3,0,1.5-0.1c1.1-0.1,1.6-0.3,1.6-0.3c2.5-0.1,5,0.7,7.3,0.7
			c3.6,0,8.4-0.2,11.3,0c2.2,0.2,4.6-1.1,6.6,0c0,0,0.5-0.1,1.4-0.1c0.9,0,1.4,0.6,1.5-0.2c0.1-0.8,0.3-2.3,0-2.6
			c-0.3-0.3,1-0.2,0.3-0.5c-0.1-0.1-0.3-0.2-0.5-0.4c-0.3-0.4-0.4-0.5-0.2-1.4c0.2-1,0.3-2.2,0.2-3.3c-0.6,0.8-1.1,1.9-1.7,2.8
			c-0.8,0-0.7-1.2-1.2-0.1c-0.3-0.6-0.4-1.6-0.8-2.1c1-0.1,1,0.6,2.1,0.4c0.9-0.5,1-1.9,1.1-3.2c-1.2-0.3-0.3,1.7-1.6,1.4
			c-0.8-1.2,0.9-1.6,1-2.6c0.3,0.5,0.6,0.8,1,0.9c0-0.7,0-1.4,0-2c0,0,0,0,0,0c-3.3-0.2-2.6-3.9-4.8-5.1c0.3-1,1.4,0.1,1.6-1.4
			c0.5,0.9,1.7,0.4,2.1-0.5c0.2,0,0.3,0,0.5,0c0-0.2,0.1-0.4,0.1-0.7c-0.1,0.1-0.2,0.2-0.3,0.4c-0.4-0.8-0.3-2-0.4-3
			c1.9,0.2,0.3-1.8,0.8-3c0.2-0.1,0.4-0.2,0.6-0.2c0.1-1.1,0.1-2.2,0.1-3.3c-0.1-2.5,0.5-15.3-0.1-18.7c-0.6-3.5-0.9-5.2-0.4-6.7
			c0.6-1.5,0.9-3.5,0.9-5c0-1.4,0.2-9.8-0.1-12.2c-0.3-2.4-0.6-10-0.3-12c0.3-2.1-0.7-11.2-0.4-13c0.3-1.8,0.4-2.7,0.5-3.5
			c0.2-0.9,0.6-3.6,0.2-5.4c-0.4-1.9-0.6-2.1-0.5-3.2c0.1-1.1-0.1-2.5,0.3-3.8c0.4-1.3,0.5-2.8,0.5-3.5c0.1-0.7-0.3-9.9-0.7-12.1
			c-0.5-2.2-0.4-3.2-0.4-4.2c0-1,0.8-8.4,0.4-12.2c-0.2-1.3-0.7-3.4-1.2-5.4c0.1,0.1,0.3,0.2,0.5,0.3l0,0c1.6,0.5,4.1,0.1,6.9,0.2
			c1.2,0.1,10.8,0,15.9,0.1c1.7,0.2,3.1,0.2,4.3,0.2c1,0.1,2.1,0.2,3.2-0.1l0-0.2c0.3-0.1,0.4-0.1,0.4-0.1c3.9-1.5,4.3-0.5,6.5-0.4
			c1.8,0.1,3.5-0.4,5.4-0.6c-0.2,1.2-0.3,3,0,4.4c0.4,1.9,0.6,2.1,0.5,3.2c-0.1,1.1,0.1,2.5-0.3,3.8c-0.4,1.3-0.5,2.8-0.5,3.5
			c-0.1,0.7,0.3,9.9,0.7,12.1c0.5,2.2,0.4,3.2,0.4,4.2c0,1-0.8,8.4-0.4,12.2c0.1,0.7,0.3,1.5,0.5,2.5c1.1,1,2.8,1.4,3.8,2.6
			c-1.1-0.4-2.1-0.8-3.4-1c0.3,1,0.5,2.1,0.8,3c0.6-0.7,1.3-1.2,2.3-1.4c0.2,0.7,0.4,1,0,1.8c-0.9-0.6-1.6,0.2-2.3-0.2
			c0.3,1.1,0.5,2.1,0.6,2.9c0.3,2.6-0.8,3.7-1.1,5.2c-0.2,1,0,2,0,3.2c-0.1,1.9-0.3,4-0.5,6.1c0,0.1,0.1,0.2,0.1,0.4
			c0,0-0.1,0.1-0.1,0.1c-0.1,1.1-0.1,2.1-0.1,3.1c0,2.6-0.3,5.3-0.2,7.7c0,0.9,0.5,1.8,0.7,2.7c0.4,3.3-0.7,7.9-0.3,11.7
			c0.3,2.4,1.2,4.7,1.1,6.5c-0.2,1.9-1.2,3.5-1.3,5.2c-0.2,2.4-0.2,6.8-0.1,9.2c0.4-1,2.4-1,2.9-0.3c-0.1,1-1.8,0.5-2.9,0.6
			c0,0.5,0,0.9,0.1,1.2c0.1,0.6,0,1.3,0,2c0.1,0,0.3,0.1,0.4,0.1c-0.6,1.7,0.5,1.7,0.6,3.3c-0.2,0-0.4,0-0.6,0
			c0.3,1.4,0.5,2.5,0.5,3.5c1,0.1,0.5,1.6,1.3,1.9c0.3-0.4,0.7-2.2,0.3-2.4c0.5-0.7,2.1-0.1,2.7,0c0.3,0.7,0,1,0.3,2.1
			c-1.7,0.5-2,1-4.2,0.6c0-0.5-0.2-0.7-0.5-1c0,0.1,0,0.1,0,0.2c-0.1,0.9-0.4,1.6-0.7,2.3c0.6,0,1.1,0.6,1.7,0.6
			c-1.1,1.1-0.2,2.2,0,3.6c-0.5,0.4-1.3,0.3-2,0.1c0.1,1.1,0.1,1.8,0.1,1.8c0,0.1,0,0.3,0,0.4c0.1,0,0.2,0,0.4,0
			c0-0.3-0.1-0.5-0.3-0.6c0.1-0.6,1,0.3,0.9,0.9c-0.3,0.3-0.5,0.6-1,0.7c-0.1,2.6-0.4,5.9-0.4,8c0,0.6-0.5,1.2-0.4,1.7
			c0.2,1.7,0.5,3.6,1.2,4.1c0.9,0.6,2.2,1.4,2.9,0.5c4.8,1.9,7.6,0.3,11.9,0.2c1.5,0,3.2,0.1,4.6-0.6c0,0,0.5-0.7,2.9-0.2
			c2.4,0.6,1.8,0.4,3,0.4c1.2,0,2,0,3.5,0c1.5,0,1.6-0.8,1.6-0.8c-0.1-4,0.4-5,0.5-9C544,242,544,241,544,239.9z M465.7,30
			c-1.4,0.3-1.7-0.5-2.4-0.9c1.1-0.3,1.3-1.5,2.7-1.5C466.5,28.5,465.9,28.9,465.7,30z M462.1,23.1c0.6,0,1.2,0,1.8,0
			c-0.5,0.6-0.3,1.9-1.8,1.5C462.1,24.1,462.1,23.6,462.1,23.1z M454.4,22.5c0.3,0,0.6,0,0.9,0c-0.2,1.2,0,1,0,2.4
			C454,25,453.7,23.3,454.4,22.5z M455.6,30.9c-0.7,0.1-1.1,0-1.5-0.3C454.1,29.7,455.9,29.8,455.6,30.9z M452.6,6.6
			c-0.4,0.7-1.6,1.5-2.4,0.9C450.4,6,451.1,6.7,452.6,6.6z M452,165.5c-0.9,0.5-1-0.5-2.7,0C449.9,163.8,451.1,165.1,452,165.5z
			 M449.9,161.9c0.7-0.1,1.1,0,1.5,0.3c0,0.3,0,0.6,0,0.9C450.5,163.8,449.2,162.9,449.9,161.9z M449.7,125.3c0.8-0.6,2.4,0,2.7,0.9
			C451.3,126.1,449.5,126.7,449.7,125.3z M448.8,116c0.7-0.1,1.1-0.5,2.1-0.3C451.2,117.4,448.7,117.7,448.8,116z M450.8,4.2
			c0.1,0.7,0,1.1-0.3,1.5c-1,0.3-0.6-0.8-1.2-0.9C449.3,4.2,450,4.2,450.8,4.2z M449.9,1.8c-0.5,0.6-1.4,0.8-2.4,0.9
			C447.3,1.4,448.9,1.9,449.9,1.8z M448.1,42.5c-0.2,0.3-0.3,0.7-0.3,1.2c-1,0.2-1.1-0.5-1.2-1.2C447.1,42.5,447.6,42.5,448.1,42.5z
			 M446.9,45.8c-0.1,0.9-1.4,0.6-1.8,1.2c-0.9,0.1-0.1-1.5-1.2-1.2C444.6,45,446,45.9,446.9,45.8z M443.3,19.2
			c0.9-0.1,1.3,0.3,1.2,1.2C443.6,20.5,443.2,20.1,443.3,19.2z M446,51.8c-0.6-0.6,0-0.8,0-1.5C447.2,50,447.2,52.1,446,51.8z
			 M447.6,113.4c0,0.5-2.2,0.7-1.8-0.3C446.5,113,447.2,113,447.6,113.4z M444.8,76.4c-0.3,0.6-0.9,0.9-1.8,0.9
			c-0.1-0.7,0-1.1,0.3-1.5C444.3,75.5,444.3,76.2,444.8,76.4z M445.8,127.4c-0.3,0.9-1.3,1.1-2.4,1.2c-0.1-0.6-0.6-0.8-0.6-1.5
			C443.5,126.5,445.4,126.7,445.8,127.4z M447.6,130.1c-0.5,1.7-4,1.6-4.2-0.3C445.5,130.2,445.5,130.9,447.6,130.1z M446.4,115.1
			c0.5,0,1,0,1.5,0C448,116.2,446.2,116.4,446.4,115.1z M446.9,47.9c-0.1-1,0.4-1.4,1.2-1.5C447.5,46.8,448.2,48.4,446.9,47.9z
			 M443.3,15c2.2,0.2,0.6-0.8,2.7-1.2c0.4,1.4-1.1,3.4-2.7,3.9c0.6,1-0.2,1.3-1.2,1.5C442.5,17.4,442.5,17.2,443.3,15z M443.3,20.7
			c0.5,0.1,0.7,0.5,0.6,1.2c-0.6,0-1.2,0-1.8,0C442.1,21.1,443.3,21.5,443.3,20.7z M442.8,114.3c0.7,0.6,2.1,0.5,1.8,2.1
			c-1.4,0.1-1.9-0.6-3,0c-0.2-0.2-0.3-0.5-0.3-0.9C442,115.3,442.4,114.7,442.8,114.3z M441,117.5c0.7,0,1.4,0,1.8,0.3
			c-1,0.9,1,1.7-0.3,1.8C442.6,118.4,441.1,118.7,441,117.5z M442.2,180.4c0.3-0.7,1.9-0.1,1.5,0.9
			C442.7,181.5,442.9,180.5,442.2,180.4z M444.6,184.9c-0.7-0.1-0.7,0.5-1.5,0.3c-0.3-0.9-0.1-1.3-0.6-2.4c1.2-0.3,0.8,1,2.1,0.6
			C444.6,183.9,444.6,184.4,444.6,184.9z M446.1,178.6c-0.4,0-0.8,0-1.2,0c0.2-0.2,0.3-0.5,0.3-0.9c0.3,0,0.6,0,0.9,0
			C446.1,178,446.1,178.3,446.1,178.6z M444,173.6c0.4-0.7,2.1-0.1,3-0.3c0.3,1-1,0.4-0.9,1.2c0.1,0.2,0.3,0.3,0.3,0.6
			c0.7,0.1,0.9-0.5,1.2-0.9c0.8,0.4,1.7,0.7,1.8,1.8C446.9,177.7,445.2,174.8,444,173.6z M452.9,173c-1.8-0.4-3.7-0.7-5.1,0
			c0.7-1.2-0.4-0.9-0.3-2.1c1.5-0.2,1.3-0.7,1.5-1.8c1.3,0,1.5,1,3,0.9c0,0.7,0,1.4-0.3,1.8c0.2,0.7,0.8-0.6,1.5-0.3
			C453.3,172.2,453.2,172.6,452.9,173z M456.8,33.8c-1.3,0-1.4,1.2-2.7,1.2c-0.7-1.9,3.1-1.5,1.5-2.4c0-0.4,0.5-0.3,0.9-0.3
			C456.2,33.2,456.9,33.1,456.8,33.8z M454.7,29.4c0.1-1,2.5-0.7,3-0.3C457.2,30.5,455.8,29.6,454.7,29.4z M458.9,32.7
			c-0.9,0-2,0.2-1.8-0.9C458,31.7,459,31.6,458.9,32.7z M457.1,27c1.7,0.5,0.4-2,1.2-2.4c1.1,0.9,1.9-1.2,2.1,0.6
			c-1.3-0.4-1.1,0.7-1.8,0.9c0,0.9,1.2,0.5,2.1,0.6C460.4,27.9,457.2,29.1,457.1,27z M458.6,21.3c-0.9,0-1,0.8-2.1,0.6
			c1.5-1.3-0.7-1.7-1.2-2.7c0.7,0.6,3,0.6,2.4,1.5c1-0.3,1.5-1.3,3-1.2c1,0.4-1.2,0.2-1.2,0.6c0.3,0.9,2.1,0.3,2.1,1.5
			C460.5,21.3,457.9,22.7,458.6,21.3z M461.3,187.3c0.7-0.1,1.1,0,1.5,0.3C462.5,188.3,461.3,188.4,461.3,187.3z M462.4,31.5
			c-2.1,0.2-0.8-2.3,0.6-2.1C463.3,30.5,462,30.1,462.4,31.5z M465.2,197.2c0.6-1.6-1.1-1.6-2.1-2.4c0.4-1.2,2.2,0,3,0.3
			c-0.3,0.9-0.2,0.8,0.6,1.2C465.9,196.4,466.1,196.7,465.2,197.2z M467.5,48.2c0-0.5,0-1,0-1.5c0.4,0,0.8,0,1.2,0
			C468.9,47.7,468.6,48.4,467.5,48.2z M506,93.4c0-0.3,0-0.6,0-0.9c0.6-0.1,0.8,0.2,1.2,0.3C507.2,93.3,506.7,93.5,506,93.4z
			 M541,192.4c-0.6-0.2-2.1,0.5-1.8-0.6C539.7,191.3,541.3,191.2,541,192.4z M540.4,55.8c-0.3,0.4-0.2,1.2-1.2,0.9
			c-0.1-0.6,0.2-0.8,0.3-1.2C540,55.5,540.1,55.8,540.4,55.8z M539.5,44.8c0.8,0,1.5,0.1,1.5,0.9C540.2,46.1,539.7,45.8,539.5,44.8z
			 M539.2,41.2c-0.6,0.1-0.8-0.2-1.2-0.3c0.1-0.4,0.5-0.5,0.6-0.9C539.2,40.1,539.3,40.5,539.2,41.2z M541,147.5
			c-0.7,1.4-1.4,0.4-2.7,0.3C538.9,147.1,540.2,147.1,541,147.5z M541,159.8c-0.3,0.7-1.5,0.7-1.5-0.3
			C540.2,159.4,540.7,159.5,541,159.8z M542.2,5.9c0.1,0.8-0.1,1.3-0.9,1.2C541.3,6.3,541.4,5.8,542.2,5.9z M541,2.3
			c-0.4,0.4-0.3,1.3-1.2,1.2c0-0.3-0.1-0.5-0.3-0.6C539.9,2,540.2,2.8,541,2.3z M539.8,9.8c-0.7,0-1.4,0-1.8-0.3
			C538.1,9,540.3,8.8,539.8,9.8z M538.3,7.7c0,0.7-1.3,0.1-1.8,0.3C536.6,7.2,538,7.3,538.3,7.7z M536.9,8.6
			c0.4,1.3-0.8,1.9-1.5,1.2C535.4,9,535.9,8.5,536.9,8.6z M533.6,41.2c0.5,0,1,0,1.5,0c-0.2,1.1,0.3,1.5,1.2,1.5
			c-0.1,1-1,1.2-1.8,1.5C533.6,42.8,534.7,42.6,533.6,41.2z M534.5,46.6c-0.6,0-1.2,0-1.8,0c-0.3-1,0.8-0.6,0.9-1.2
			C534.4,45.3,534.3,46,534.5,46.6z M534.2,8c0-0.3,0-0.6,0-0.9c0.9-0.2,0.6-0.2,1.5,0C535.1,7.4,535.2,8.2,534.2,8z M536,41.2
			c-0.9,0.1-1.3-0.3-1.2-1.2C535.5,40,535.9,40.4,536,41.2z M536.3,5.6c-1.1,0.3-2.3,0.6-2.4-0.9C534.6,4.1,536.3,4.5,536.3,5.6z
			 M534.2,6.2c-0.4,1.7-2.7,0.4-3.3-0.3C531.4,5.4,534.1,5.3,534.2,6.2z M533.3,42.7c0.7,0.8-1.4,1.7-2.4,0.9
			C531.2,42.4,532.9,44.1,533.3,42.7z M529.7,43.9c0.9-0.1,1.6,0,1.5,0.9C531,44.2,529.4,45,529.7,43.9z M531.5,55.6
			c0.3,1.8-0.4,2.6-2.1,2.4C528.3,56.6,529.2,55.1,531.5,55.6z M526.1,109.5c0.1-0.3,0.3-0.2,0.3,0c1.5-0.4,2.2-1.4,2.7,0.6
			C527.4,110.3,527,110.4,526.1,109.5z M529.7,134.4c0,0.3,0,0.6,0,0.9c-0.9,0.7-2.2-0.2-1.5-1.2C528.9,134,529.3,134.1,529.7,134.4
			z M530.3,137.7c-0.9,0.5-1-0.5-2.7,0C528.2,136,529.3,137.3,530.3,137.7z M528.5,12.8c-0.8-0.2-0.9-1-1.5-1.5
			C528.2,10.5,528.5,11.9,528.5,12.8z M529.1,43.3c-0.3,0.6-0.9,0.9-1.8,0.9c-0.2-0.3-0.3-0.7-0.3-1.2
			C528.1,43.3,528.4,43,529.1,43.3z M522.5,15.2c0.1-0.4,0.9-0.1,0.9-0.6c0-0.3,0-0.6,0-0.9c1.1,0.2,2,0.8,3,0.3
			C525.7,14.9,523.8,14.8,522.5,15.2z M520.1,41.8c0.6-0.5,1.6,0.4,1.5,1.5c-0.3,0.3-0.8,0.4-1.5,0.3
			C520.5,42.4,520.7,42.9,520.1,41.8z M523.7,17.9c-0.2,0.9-1.4,1.2-1.5,0C522.6,17.5,523.3,17.5,523.7,17.9z M522.2,12.2
			c0.1-1.6,0.9-0.3,1.8-0.3C524,12.5,522.7,12,522.2,12.2z M522.5,19.7c0,0.4,0,0.8,0,1.2C521.3,21.1,521.3,19.4,522.5,19.7z
			 M525.5,38.2c-1.3,0.4-2.4-0.9-2.7,0.3c-0.6-0.3-0.9-0.9-0.9-1.8c-0.9-0.1-0.8,0.8-1.2,1.2c-0.6-0.2-0.3-1.8,0-2.1
			C521.9,37,524.9,36.4,525.5,38.2z M523.7,104.5c-0.9,0.1-1.1-0.8-0.6-1.2C523.6,103.5,524.2,103.9,523.7,104.5z M521.6,40.3
			c0.3-0.3,0.4-0.8,0.3-1.5c1.2-0.3,2.5,2.7,0.6,2.7C522.9,40.4,522.9,39.6,521.6,40.3z M521.9,153.5c-0.9,0.1-0.8-0.8-1.5-0.9
			C520.7,151.9,522.3,152.5,521.9,153.5z M524,222.9c-0.4,0.5-1.5,0.8-2.1,0.3C521.9,222.3,523.6,222.5,524,222.9z M523.1,150.8
			c0.2-0.2,0.3-0.5,0.3-0.9c0.3,0,0.6,0,0.9,0c0,0.3,0,0.6,0,0.9C523.9,150.8,523.5,150.8,523.1,150.8z M526.4,201.7
			c0.4,1.6-1.2,1.2-2.4,1.2C524.2,201.8,525,201.5,526.4,201.7z M524,8.9c1.2-0.1,1.9,0.3,2.1,1.2C525,10.1,523.7,10.3,524,8.9z
			 M521.3,10.7c0.4-0.2,2.3-1.4,2.4,0c-0.9-0.4-1.4-0.2-1.5,0.9c-0.9-0.5-2.3-0.5-2.4-1.8C520.8,9.6,521.1,10.1,521.3,10.7z
			 M521.6,46.3c-0.6,0.7-1.3,0.1-1.8-0.3C520,45.3,521.8,45,521.6,46.3z M518.6,76c-0.7,0-0.6-0.8-0.6-1.5c0.8-0.2,0.8,0.4,1.5,0.3
			C519.8,75.8,518.5,75.3,518.6,76z M519.2,111.6c-0.1,0.9-0.2,1.8-1.2,1.8C517.3,112.7,518.3,111.7,519.2,111.6z M518.6,118.2
			c0.2,1.1-0.5,1.3-1.5,1.2C517.1,118.5,517.9,118.4,518.6,118.2z M520.1,132.3c-1.1,0.3-0.9-0.7-1.8-0.6
			C518.4,130.7,520,131.4,520.1,132.3z M518,20.9c0.3-0.3,0.8-0.4,1.5-0.3c0.2,1.1-0.5,1.3-1.5,1.2C518,21.5,518,21.2,518,20.9z
			 M519.5,41.2c-0.3,0.4-0.4,0.9-1.2,0.9c-0.2-0.3-0.3-0.7-0.3-1.2C518.7,40.8,519.2,40.9,519.5,41.2z M518,43
			c0.2,1.1-0.9,0.9-1.8,0.9C516.6,43.3,517.2,42.3,518,43z M515.6,36.1c0.6-0.1,0.8,0.2,1.2,0.3c0.1,0.9-0.3,1.3-1.2,1.2
			C515.6,37.1,515.6,36.6,515.6,36.1z M512.3,72.5c-0.1-0.7,0-1.1,0.3-1.5c0.3,0,0.6,0,0.9,0c0,0.5,0,1,0,1.5
			C513.1,72.5,512.7,72.5,512.3,72.5z M512.6,120.9c0.6-0.6,0.6-1.8,1.8-1.8C514.3,120.2,513.8,120.9,512.6,120.9z M514.4,117.6
			c0.5,0,1,0,1.5,0c0,0.9-0.8,1-1.5,1.2C514.4,118.4,514.4,118,514.4,117.6z M515.6,121.2c-0.3-0.9-0.3-0.9,0-1.8
			c0.9-0.1,1.2,0.4,1.8,0.6c0,0.2,0,0.4,0,0.6C516.8,120.8,516.6,121.3,515.6,121.2z M517.1,215.4c-1.4,0.1-2.6,0-2.4-1.5
			c1.5,0,1.5-0.3,2.7,0C517.7,214.8,517,214.7,517.1,215.4z M517.4,153.5c0-0.7,0-1.4,0.3-1.8c1.3,0,1.5,1.1,2.4,1.5
			C519.4,153.8,518.5,152.9,517.4,153.5z M518,229.5c0.9-0.7,2.3,0.1,2.4,1.2C519.4,231.4,518.1,230.6,518,229.5z M520.7,239
			c0.4-1.7,0.1-0.1-1.2-0.3c0.2-1.6,0.3-1.8,0.3-3.9c0.9,0,1.4,0.4,2.1,0.6c-0.1,1-0.7,1.5-1.2,2.1c0.6,0.8,1-0.3,1.8,0.3
			c0.7-0.1,0-1.6,0.6-1.8c1,0.1,1.7-0.1,2.4-0.3c0.2,0.9-0.8,0.6-0.6,1.5c0.5,1.4,3.4-0.6,3.3,1.8C525.3,240,523.3,238.4,520.7,239z
			 M527,234.3c-0.4,0-0.3,0.5-0.3,0.9c-1.2-1.4-2.7,0.2-4.2,0.3c-0.5-1.5,0.9-1,1.5-1.5c-0.3-0.5-0.9-0.9-0.3-1.5
			c1.4,0.4,2.3,1.3,4.5,0.9c0.1,0.8,0.9,0.9,0.9,1.8C527.8,235.5,528.1,234.1,527,234.3z M526.7,203.7c0.9-0.3,0.7,0.5,1.2,0.6
			C527.8,205,526.1,204.7,526.7,203.7z M526.4,198.1c0-0.5-0.4-0.6-0.3-1.2c1.3,0.7,3.8,0.2,4.8,1.2c0.3-0.1-0.4-1.6,1.2-1.2
			C531.6,200.3,528.5,197.1,526.4,198.1z M530.9,235.4c-0.4-1.9,2.5-2,2.4-0.3C532.8,235.6,531.7,235.4,530.9,235.4z M532.7,214.8
			c-1.6-0.3-0.7-1.4-1.2-2.4c1.1-0.3,0.9,0.7,1.8,0.6C533.3,213.9,533.2,214.5,532.7,214.8z M531.2,105.9c0.8-0.8-0.4-0.9-0.3-1.8
			c0.7-0.2,2.1-0.6,2.7,0C533.1,105,532.5,105.9,531.2,105.9z M534.2,203.7c-0.9-0.4,0.2-1.1,0.3-1.5c0.4,0.1,0.5,0.5,0.9,0.6
			C535.3,203.5,534,202.9,534.2,203.7z M537.1,210c-1.2,0.2-1.2-1.4,0-1.2C537.1,209.2,537.1,209.6,537.1,210z M537.5,53.5
			c-1.1,0.2-1.4-0.3-2.1-0.6c-0.3-0.9-0.1-0.8,0.3-1.5c-0.4-0.4-1.1-0.5-1.5-0.9c1-0.9,2.2,0.6,3.6,0.3
			C538,51.9,538.1,52.6,537.5,53.5z M538.3,206.7c-0.2-0.3-0.3-0.7-0.3-1.2c0.7,0,0.9-0.6,1.5,0
			C539.5,206.3,539.1,206.7,538.3,206.7z M540.4,196c-0.9,0.1-1.6,0-1.5-0.9c1.6,0.3,1.3-0.8,0.3-0.9c0.3-0.7,1.1,0.4,2.1,0
			C541.5,195.2,540,194.6,540.4,196z"></path>
		<path fill="#4C3C2C" d="M664.1,238.8c-1.8-5,3-12.6-3.1-15.9l0,0c-1.9-0.5-4.8-0.1-8-0.2c-1.4-0.1-12.6,0-18.5-0.1
			c-2-0.2-3.7-0.2-5-0.2c-1.1-0.1-2.4-0.2-3.7,0.1l0,0.2c-0.3,0.1-0.5,0.1-0.5,0.1c-4.5,1.5-4.9-1.1-7.5-1.2
			c-2.3-0.1-4.4,0.4-6.8,0.7c-0.8,0.1-4.4,0.5-6.3,0.6c0-1,0.2-2.1,0.2-3.5c0-0.3-0.5-0.7-0.5-1.1c0-0.1,0-0.1,0-0.2
			c-0.1,1.5,0-1.8,0,0c0-0.1,0-0.3,0-0.6c0.2-2.6,0.6-9.3,0.3-12.4c-0.5-5.6,0.9-11.4,0.8-16.9c0-1.5,0.5-3,0.5-4.4
			c0-2-1-4.2-0.9-6.2c0.1-2.3,1.2-4.2,0.1-6c0.5-4.2-0.3-9-0.2-14.1c0.1-7.2,0.3-13-0.2-19.4c-0.2-1.8,0.4-3.5,0.4-5.5
			c0-1.4-0.7-2.5-0.8-3.9c-0.1-1,0.4-2.1,0.4-3.2c0-1.4-0.6-2.8-0.6-4.1c0-1.6,0.5-3.1,0.6-4.7c0.2-4-0.5-8.4-0.7-12.7
			c1.6-0.1,3.8-0.2,7.6-0.2c0,0,0,0,0,0c0.1-0.1,0.2-0.2,0.3-0.4c-2-0.1-3.9,0.2-4.5-1.8c-0.7,0.1-1.5,0.6-2.1,0
			c1.2-2.8,5.7,0.4,7.5-2.4c0.7,0.6,1.2,1.4,1.8,2.1c1.3-0.2,1.7-1.3,2.4-2.1c1.2-0.1,0,0.8,0,1.2c1.2-0.3,1.5-0.3,2.7,0
			c0,0.7-0.5,0.9-0.6,1.5c-0.5-0.3-0.9-0.7-1.2-1.2c-0.7,0.6-1,1.6-0.9,3c-0.6-0.2-0.7,0.1-0.8,0.4c2.3,0.2,4.8,0.5,6.1,0.5
			c1.4,0,2.9-0.2,4.2-0.3c0.1,0.1,0.1,0.1,0.2,0.2c0.2-0.1,0.4-0.2,0.8-0.3c0.6-0.1,1.1-0.1,1.4-0.1c2.5,0,7.1,0,10.6-0.2l0,0
			c5.3,0.8,9.7,0.7,11.2,0.1c0,0,0.2-0.4,0.9,0.1c0.7,0.4,1,0.6,1.2,0.5c0.2-0.2,0.6-0.2,0.6-0.7l0.2,0c0.2-0.7,0.2-1.3,0.1-2
			c-0.3,0.1-0.7,0.1-1.1,0c-0.3-1.1-0.3-2.5,0.1-3.4c-0.1-0.3-0.2-0.5-0.3-0.8c-1.7-0.8-4.7-0.3-6.7-0.3c0-1.3,1.8-0.8,2.1-1.8
			c1.3,0.3,3.2,0.3,4.8,0c0.2-2.4-0.5-4.6,0.8-6.5c-1.5-5,2.5-12.6-2.6-15.9l0,0c-1.6-0.5-4-0.1-6.7-0.2c-1.1-0.1-10.6,0-15.5-0.1
			c-1.7-0.2-3.1-0.2-4.2-0.2c-1-0.1-2-0.2-3.1,0.1l0,0.2c-0.3,0.1-0.4,0.1-0.4,0.1c-3.8,1.5-4.2,0.5-6.4,0.4
			c-1.9-0.1-3.7,0.4-5.7,0.7c-0.1,0-0.3,0-0.5,0c0.5,1.3-1.6,2.2-0.1,2.5c-0.4,0.5-2.2-0.2-3-0.3c-0.4,0.1-0.2,0.7-0.3,1.2
			c-0.7,0-1.4,0-2.1,0c1.1-0.8,1.7-2.1,2.7-3c-2.4-0.2-3.9-0.2-5.7,0.6c0.6-1.6-0.8-1.7-2.4-1.8c-0.5,0.4-0.5,1.3-0.9,1.8
			c-1.5,0.4-1.5-0.7-2.7-0.6c0.4-0.7,0.2-2,1.5-1.8c-0.8-1.5-2.4,0.4-3.6,0.3c-0.4-0.9-0.8-1.8,0-2.4c1.2-0.1,1.5,0.7,2.7,0.6
			c0-1.1-0.6-1.6-1.2-2.1c0.8-0.5,1.3-1.3,2.7-1.2c0.2,0.8-0.6,0.6-0.6,1.2c0.4,0.3,1.1,0.3,1.8,0.3c0.2,1.3-0.8,1.4-1.5,1.8
			c0.3,0.4,0.3,1.1,0.6,1.5c0.7,0,0.9-0.5,1.5-0.6c-0.1-1.4-0.1-2.7,0.9-3c1.3,1.9-0.2,2.8,1.8,4.2c0.8,0,1.2-0.4,1.2-1.2
			c1,0.1,1.3,0.7,2,1c-0.3-2.4-0.5-4.9-0.2-7.7c0.3-2.5,0.1-5.5,0.1-8c0-2.2,0.1-4.4-0.1-6.6c-0.1-0.9-0.1-1.8-0.1-2.7
			c-0.5,0.9-1.7,0.4-1.9-0.5c-0.5,0.8-0.7,1.9-2.1,1.8c0.1-0.7,0.6-1.5,0-2.1c-0.8,0.1-0.6,0.4-1.5,0.9c0.1-0.3,0.1-0.5,0.1-0.7
			c-0.2,0.1-0.4,0.1-0.7,0.1c0.2-0.2,0.3-0.4,0.5-0.6c-0.4-0.5-1.3-0.7-2-1.2c0.3-1,1.8-0.3,2.6,0.1c0.2-0.4,0.3-0.8,0.4-1.3
			c0.8,0.3,1.2,0.3,2.1,0c0.3,0.6,0.4,1.4,0.6,2.1c0.6-0.2,0.9-0.7,1.8-0.6c0.3,1-1,0.4-1.2,0.9c0.1,0.5,1,0.2,1.3,0.4
			c0.1-3.1,0.4-5.9,0.6-10.1c0-1.2,0-2.4,0-3.5c-0.7,0.1-1.4,0.1-2.2,0.6c0-1.4-1.1-1.7-1.8-2.4c1.6-1.5,3.9-0.3,5.1,0.7
			c1.2,0,2.5-0.1,3.9,0c1.3,0.1,11.8,0,17.3,0.1c1.9,0.2,3.4,0.2,4.6,0.2c1.1,0.1,2.2,0.2,3.4-0.1l0-0.2c0.3-0.1,0.5-0.1,0.5-0.1
			c4.2-1.5,4.7-0.5,7.1-0.4c2.1,0.1,4.1-0.4,6.3-0.7c0.9-0.1,5.9,0.8,6.8,1c1,0.1,2.8-0.2,3.8-0.2l0.5-0.7c-0.3-3.3,1-7.3,0.7-9.9
			c-0.1-0.8-0.6-1.6-0.7-2.4c-0.1-1.7,0.6-3.4,0.6-5c0-0.6-0.5-1-0.5-1.7c-0.2-1.6,0.4-3.5,0.5-5.2c0.1-1.8-0.5-3.5-0.5-5.3
			c0-0.7-0.4-0.5-1-0.6c-0.6-0.2-0.3-0.2-0.7,0.1c-0.4,0.3-1.7,0.1-1.7,0.1c-2.3-0.1-4.7,0.2-11.1,0.2c-3.1,0-9.2-0.8-11.9-0.8
			c-1.5,0-3.3,0.2-4.7,0.3c-0.1-0.1-0.1-0.1-0.2-0.2c-0.2,0.1-0.5,0.2-0.9,0.3c-0.6,0.1-1.2,0.1-1.5,0.1c-2.8,0-7.9,0-11.8,0.2l0,0
			c-3.8-0.5-7.2-0.7-9.5-0.5c0-0.4-0.2-0.9-0.4-0.9c-0.3,0-0.3,0-1.4,0.1c-1,0.1-1.5,0.3-1.5,0.3c-0.1,0-0.3,0-0.4,0
			c-0.5-0.2-1-0.3-1.4-0.1c-0.4,0-0.8-0.1-1.2-0.2c-2-0.7-3.7-0.6-5.3-0.4c-3.1,0.1-6.7,0.2-9,0c-2.1-0.2-4.3,1.1-6.2,0
			c0,0-0.5,0.1-1.3,0.1s-1.3-0.6-1.4,0.2c0,0.2,0,0.4-0.1,0.7c0,0,0,0,0,0c-1.4,0-1.5,0.8-1.5,0.8c0.1,4-0.4,5-0.5,9
			c-0.1,5.9,0.1,11.8-0.8,17.5c1.5,1.6,0.8,3.3,0.7,6.2c0,0.3,0.5,0.7,0.5,1.1c0,0.1,0,0.1,0,0.2c0.1-1.5,0,1.8,0,0
			c0,0.1,0,0.3,0,0.6c-0.2,2.6-0.6,9.3-0.3,12.4c0.5,5.6-0.9,11.4-0.8,16.9c0,1.5-0.5,3-0.5,4.4c0,2,1,4.2,0.9,6.2
			c-0.1,2.3-1.2,4.2-0.1,6c-0.5,4.2,0.3,9,0.2,14.1c-0.1,7.2-0.3,13,0.2,19.4c0.1,1.8-0.4,3.5-0.4,5.5c0,1.4,0.7,2.5,0.8,3.9
			c0.1,1-0.4,2.1-0.4,3.2c0,1.4,0.6,2.8,0.6,4.1c0,1.6-0.5,3.1-0.6,4.7c-0.2,4,0.5,8.6,0.7,13c0.1,2.8-0.6,5.8-0.6,8.7
			c0,3.6,1,7.1,0.8,11c-0.1,1.1-0.4,2.3-0.4,3.5c0,5.2,1.6,9.6,0.9,15.3c-0.3,2.5-0.1,5.5-0.1,8c0,2.2-0.1,4.4,0.1,6.6
			c0.3,4.7-0.3,7.9-0.5,13.5c-0.2,6.6,0.9,12.3,0.5,18.9c-0.1,1.1-0.5,2.1-0.6,3.2c-0.1,1.1,0.3,2.4,0.4,3.8c0,1.7-0.2,3-0.3,4.1
			c0.4,0,0.8,0.2,0.8,0.6c0.8,0.1,0.3-1.1,0.9-1.2c0.6-0.1,0.6,0.4,0.6,0.9c2-0.8,3-1.5,4.8,0c-0.2,1-1.1,1.2-1.5,2.1
			c-1.2,0-1.4-1.2-1.8,0.3c-1-0.1-1.5-0.7-2.1-1.2c-0.4,0.1-0.2,0.7-0.3,1.2c0.1,0.4,0.7,0.2,1.2,0.3c-0.2,1.5-1.8,0.4-2.4,0.9
			c0,0.2,0,0.5,0,0.7c0,0-0.1,0-0.1,0c0,0-0.6,0.7-0.6,1.2c0,0.5,0.1,1.1,0.5,1.1c0.3,0,0.3,0,1.4-0.1c1-0.1,1.5-0.3,1.5-0.3
			c0.1,0,0.3,0,0.4,0c0.5,0.2,1,0.3,1.4,0.1c0.4,0,0.8,0.1,1.2,0.2c2,0.7,3.7,0.6,5.3,0.4c3.1-0.1,6.7-0.2,9,0
			c1.7,0.1,3.4-0.6,5-0.4c0,0.6,0.5,0.4,1,0.6c0.6,0.2,0.3,0.2,0.7-0.1c0.2-0.2,0.8-0.2,1.2-0.1c0.4,0.1,0.6,0.2,0.7,0.1
			c2.5,0.1,5-0.2,11.7-0.2c3.4,0,9.9,0.8,12.8,0.8c1.6,0,3.5-0.2,5-0.3c0.1,0.1,0.1,0.1,0.2,0.2c0.2-0.1,0.5-0.2,1-0.3
			c0.7-0.1,1.3-0.1,1.6-0.1c3,0,8.4,0,12.6-0.2l0,0c6.3,0.8,10.1,0.5,11.9-0.1c0,0,0.3-0.3,1.1,0.1s1.2,0.6,1.4,0.5
			c0.3-0.2,0.7-0.2,0.7-0.7l0.3,0c0.7-2.5,1.7-5.9,1-7.8C665.1,242.5,662.3,241.1,664.1,238.8z M610.3,30.4c0-0.8,1.1-0.7,1.5-0.3
			C611.5,31.1,611,30.5,610.3,30.4z M611.8,18.8c-0.5,0.8-1.2,1.4-1.2,2.7c-1.5-0.6-1.8,0-2.7,0.6c-0.1-0.3-0.3-0.5-0.6-0.6
			C609.1,21,610.3,19.7,611.8,18.8z M594.1,38.2c0.7-0.1,1.1,0,1.5,0.3C595.3,39.2,594.1,39.3,594.1,38.2z M601.6,34.6
			c-0.5,1.7-4,1.6-4.2-0.3C599.5,34.7,599.5,35.4,601.6,34.6z M596.8,31.6c0.7-0.6,2.6-0.4,3,0.3c-0.3,0.9-1.3,1.1-2.4,1.2
			C597.3,32.6,596.8,32.4,596.8,31.6z M606.4,30.7c-1.1-0.1-2.9,0.5-2.7-0.9C604.5,29.3,606.1,29.9,606.4,30.7z M604,24.8
			c-0.1-0.7,0-1.1,0.3-1.5c1-0.3,0.9,0.5,1.5,0.6C605.5,24.5,604.9,24.8,604,24.8z M604.9,20.3c0.3,1.7-2.2,1.9-2.1,0.3
			C603.5,20.5,603.9,20.1,604.9,20.3z M599.8,17.6c0.7,0,1.4,0,1.8,0.3C601.6,18.3,599.4,18.5,599.8,17.6z M601.9,19.7
			c0.1,1-1.7,1.3-1.5,0C600.9,19.7,601.4,19.7,601.9,19.7z M599.2,29.5c1.4-0.8,2.5,0.2,3.6,0.6c-0.8,0.5-2.2,0.4-3.3,0.6
			C599.5,30.2,599.1,30.1,599.2,29.5z M596.8,18.8c0.7,0.6,2.1,0.5,1.8,2.1c-1.4,0.1-1.9-0.6-3,0c-0.2-0.2-0.3-0.5-0.3-0.9
			C596,19.8,596.4,19.3,596.8,18.8z M596.8,22.4c-1,0.9,1,1.7-0.3,1.8c0.1-1.3-1.4-1-1.5-2.1C595.7,22,596.4,22,596.8,22.4z
			 M593.2,22.4c0.7,0.2,1.5,0.3,1.5,1.2c-0.7-0.1-0.6,0.5-1.5,0.3C592.8,23.5,592.8,22.8,593.2,22.4z M595.6,26.3
			c-0.7,1.4-1.4,0.4-2.7,0.3C593.5,25.9,594.7,25.9,595.6,26.3z M588.1,11c0.3,0,0.6,0,0.9,0c0.1,0.6-0.2,0.8-0.3,1.2
			C588.2,12.1,588,11.7,588.1,11z M586.3,9.5c0.4,0.3,0.9,0.5,1.2,0.9c0.1,0.9-1,0.6-1.5,0.9C585.4,10.7,586,10,586.3,9.5z
			 M582.7,12.8c0.7-0.1,1.1,0,1.5,0.3c0,0.3,0,0.6,0,0.9C583.3,14.7,582,13.8,582.7,12.8z M584.8,16.4c-0.9,0.5-1-0.5-2.7,0
			C582.7,14.8,583.9,16,584.8,16.4z M578.9,29.5c-0.4,0-0.8,0-1.2,0c0.2-0.2,0.3-0.5,0.3-0.9c0.3,0,0.6,0,0.9,0
			C578.9,28.9,578.9,29.2,578.9,29.5z M576.8,24.5c0.4-0.7,2.1-0.1,3-0.3c0.3,1-1,0.4-0.9,1.2c0.1,0.2,0.3,0.3,0.3,0.6
			c0.7,0.1,0.9-0.5,1.2-0.9c0.8,0.4,1.7,0.7,1.8,1.8C579.7,28.6,578,25.7,576.8,24.5z M585.7,23.9c-1.8-0.4-3.7-0.7-5.1,0
			c0.7-1.2-0.4-0.9-0.3-2.1c1.5-0.2,1.3-0.7,1.5-1.8c1.3,0,1.5,1,3,0.9c0,0.7,0,1.4-0.3,1.8c0.2,0.7,0.8-0.6,1.5-0.3
			C586.1,23.1,586,23.5,585.7,23.9z M589.3,28.9c-1-0.1-1.1-1.1-2.1-1.2c0.2-1.2,3,0.3,1.8-1.5c0.2-0.3,0.7-0.3,0.6-0.9
			C590.8,25.8,590.5,27.4,589.3,28.9z M586.6,20c0.5-0.5,2.4,0.2,2.7,0.9C588.4,20.6,587.5,20.3,586.6,20z M587.8,24.8
			c-0.1-2.3,1.3-1.5,2.7-1.2C590,25.5,588.5,23,587.8,24.8z M588.1,16.4c-0.1-0.9-1.6-1.3-0.6-2.4c0.8,0.2,1.3,0.7,1.5,1.5
			c0.9-0.4-0.3-1,0-1.8c1.2,0.8,1.7,0.8,3.6,1.2c-0.1,0.2-0.7,1.2,0,1.2c-0.1,0.3-0.3,0.2-0.3,0C590.6,17,589.7,16.1,588.1,16.4z
			 M591.7,20.3c0.9,0.2,0.5,1.7,0.9,2.4C590.8,22.8,591.1,21.2,591.7,20.3z"></path>
		<path fill="#4C3C2C" d="M744.4,238.1c-0.7,0.3-1.3,0.4-1.8,0.4c0,0,0.1,0,0.1,0.1c0.4,0.1,0.7,0.3,1,0.4
			C744,238.7,744.2,238.5,744.4,238.1z"></path>
		<path fill="#4C3C2C" d="M384.2,223.5c0,0,0-0.1,0-0.1c0-0.2-0.5-0.7-0.5-1c0-0.1,0-0.1,0-0.1c0,0.2,0,0.3,0,0.3
			C383.8,222.9,384,223.2,384.2,223.5z"></path>
		<path fill="#4C3C2C" d="M383.9,219.3c-0.7,0.1-1.8,0-1.9-0.3c-0.6-0.1-0.1,1.1-0.3,1.5c1.1,0,1-0.4,1.5,0.3
			c0.2,0.7-0.6,0.4-0.6,0.9c0.3,0.2,0.7,0.5,1,0.9c0-0.2,0-1.5,0.1-0.3c0-0.1,0-0.3,0-0.5C383.7,221.2,383.8,220.3,383.9,219.3z"></path>
		<path fill="#4C3C2C" d="M383.5,218.1c0.1,0.2,0.2,0.4,0.4,0.6c0-0.4,0.1-0.8,0.1-1.3C383.9,217.6,383.9,218,383.5,218.1z"></path>
		<path fill="#4C3C2C" d="M469.4,238.4c0-0.4,0.1-0.7,0-1.5c0-0.3-0.1-0.5-0.1-0.7c-0.2,0.6-0.4,1.3-0.8,1.7
			C468.7,238.2,469.1,238.3,469.4,238.4z"></path>
		<path fill="#4C3C2C" d="M512.3,233.6c0.1,0.1,0.2,0.2,0.3,0.3c1.2-0.6,0.4-1.1-0.2-1.7C512.3,232.7,512.3,233.1,512.3,233.6z"></path>
		<path fill="#4C3C2C" d="M612.8,103.8c0.6,0,1.2,0.1,1.8,0.1c-0.3-0.2-0.6-0.5-0.8-0.9C613.3,103.1,613,103.5,612.8,103.8z"></path>
		<path fill="#4C3C2C" d="M1220.5,221.1c0.9,1,1.6-0.2,2.6-0.4c-0.2-0.5-0.4-1-0.6-1.4c-0.1-0.2-0.2-0.4-0.3-0.7
			C1221.9,219.6,1221.1,220.3,1220.5,221.1z"></path>
		<path fill="#4C3C2C" d="M1234.5,247.9c-0.3-0.8-0.7-2.3-1-2.5c-0.4-0.2,0.9-0.6,0-0.6c-0.1,0-0.4,0-0.6-0.2
			c-0.4-0.3-0.6-0.3-0.8-1.3c-0.2-1-0.7-2.3-1.2-3.3c-0.5-1-2-5.2-2.7-5.8c-0.7-0.6-0.4-1-1.1-2c-0.7-1.1-0.8-1.5-1.2-2
			c-0.3-0.5-0.5-2.5-1-3.9c-0.4-1-0.9-2.9-1.6-4.7c0,0.3,0,0.7,0,1.1c-0.9-1.2-4.1-1.1-3,0.6c-0.9,0.5-1-0.8-1.8-0.5
			c0.2-0.6,0.1-1.3,0.9-1.7c-0.2-0.9-0.8-0.9-1.2-1.4c-0.8,1.1-2.5,1.2-4.1,1.7c2-0.6,1.1-3.1,2.9-3.2c0.6,0.7-0.1,0.9,0.3,1.5
			c1.2-0.7,0.9-1.9,3-2.2c0.6,0.4,1,1.2,1.9,0.9c-1.6-3.9-5.4-14.2-7.1-17c-1.9-3.1-2.9-4.7-3-6.4c-0.1-1.7-0.6-3.8-1.1-5.2
			c-0.6-1.4-3.8-9.6-4.9-11.8c-1.2-2.2-4.6-9.4-5.1-11.5c-0.6-2.1-5.2-10.6-5.6-12.4c-0.4-1.9-0.7-2.7-0.9-3.6
			c-0.2-0.9-0.9-3.7-2-5.3c-1.1-1.6-1.4-1.8-1.8-2.9c-0.3-1.1-1.1-2.4-1.3-3.8c-0.2-1.4-0.7-2.9-0.9-3.6c-0.2-0.7-4.2-9.5-5.5-11.4
			c-1.3-1.9-1.6-2.9-2-3.9c-0.4-1-2.6-8.4-4.5-11.9c-1.3-2.3-4.7-6.5-6.1-9c-1.2-2.1-0.9-3.4-1-4.8c0.2-0.3,0.3-0.6,0.4-0.9
			c2.1-5.1,2.3-10,5.3-15.1c1.3-2.2,2.4-5.3,3.4-7.7c0.9-2.1,1.9-4.2,2.6-6.4c1.6-4.6,3.5-7.5,5.9-12.8c2.9-6.3,4.1-12.2,7.2-18.5
			c0.5-1,1.4-1.8,1.9-2.8c0.5-1,0.6-2.5,1.2-3.9c1.2-3.2,2.6-4.4,3.1-6.6c0.1-0.6,0.3-1.2,0.6-1.9c0,0,0.1,0,0.1,0.1
			c0,0,0.9-0.4,1.1-0.9c0.2-0.5,0.3-1.1,0-1.3c-0.3-0.1-0.3-0.1-1.4-0.4c-1.1-0.3-1.6-0.3-1.6-0.3c-2.4-0.8-4.3-2.6-6.5-3.5
			c-3.3-1.4-7.8-3-10.4-4.4c-2-1-4.7-0.7-6.1-2.6c0,0-0.5-0.1-1.3-0.4c-0.8-0.3-1-1.1-1.4-0.4c-0.4,0.8-1.2,2.1-1,2.5
			c0.1,0.4-1-0.2-0.5,0.4c0.1,0.1,0.2,0.3,0.3,0.6c0.1,0.5,0.2,0.6-0.4,1.5c-0.6,0.9-1.2,2.1-1.5,3.2c-0.3,1-2.3,5.1-2.2,6
			c0.1,0.9-0.4,1-0.7,2.2c-0.3,1.3-0.5,1.6-0.6,2.2c-0.1,0.6-1.4,2.1-2.1,3.5c-0.7,1.4-2.2,4-3.2,6.5c-1,2.5-6.6,14.6-7.5,18.1
			c-0.5,1.9-0.8,3.3-1.2,4.4c-0.3-0.5-0.5-0.9-0.6-1.4c-0.6-1.9-0.3-3.9-0.9-5.6c-1-3.1-3.5-9.1-4.2-10.4c-0.7-1.2-0.9-2.6-2.3-4.7
			c-1.4-2-2.1-3.2-2.6-5c-0.5-1.7,0-3-1-5c-1-2-1.6-3.4-1.6-3.4c-1.1-2.6-2.4-6.8-3.4-9.2c-0.2-0.6-0.1-1.3-0.3-1.8
			c-0.8-1.6-1.9-3.3-2.8-3.5c-1.1-0.2-2.5-0.5-2.9,0.6c-5.2,0-7.1,2.6-11.1,4.4c-1.4,0.6-3,1.2-4,2.3c0,0-0.2,0.9-2.6,1.3
			c-2.4,0.4-1.8,0.3-2.9,0.8c-1.1,0.5-1.9,0.8-3.3,1.4c-1.4,0.6-1.2,1.3-1.2,1.3c1.7,3.8,1.6,5,3.2,8.9c2.3,5.8,4.8,11.3,6.2,17.3
			c2.2,0.9,2.1,2.9,3.2,5.7c0.1,0.2,0.8,0.5,0.9,0.9c0,0.1,0,0.1,0.1,0.2c-0.5-1.5,0.8,1.7,0,0c0,0.1,0.1,0.3,0.2,0.6
			c0.9,2.6,3.2,9.3,4.7,12.1c2.7,5.2,3.7,11.4,5.9,16.7c0.6,1.5,0.7,3.1,1.3,4.5c0.8,2,2.7,3.6,3.4,5.6c0.7,1.9,0.6,3.8,1.6,5.2
			c-0.6,1.6-1.1,2.8-1.4,3.3c-1,1.6-1.4,2.4-1.9,3.2c-0.5,0.8-2,3.2-2.4,5.2c-0.4,1.9-0.3,2.3-0.8,3.3c-0.5,1-0.9,2.4-1.8,3.6
			c-0.9,1.1-1.6,2.6-1.9,3.2c-0.3,0.7-3.8,9.7-4.2,12c-0.5,2.3-1,3.2-1.4,4.2c-0.4,1-4.2,7.7-5.3,11.6c-0.7,2.5-1.3,8-2.1,10.6
			c-0.8,2.7-2.2,3.2-3.2,4.6c-0.6,0.9-0.8,2-1.3,3.1c-1.3,2.8-3.3,6.1-4.6,9.1c-1,2.5-2.4,5-3.4,7.4c-0.4,0.9-0.2,2-0.5,2.9
			c-1,3.3-3.9,7.3-5,11.2c-0.7,2.4-0.8,5-1.6,6.7c-0.9,1.7-2.6,2.9-3.4,4.5c-1.5,2.9-4,8.9-4.4,10.3c-0.4,1.4-1.2,2.5-1.7,4.9
			c-0.5,2.4-0.8,3.8-1.7,5.4c-0.9,1.6-2.2,2.1-2.9,4.2c-0.7,2.1-1.3,3.6-1.3,3.6c-1,2.6-3.1,6.5-4.2,8.9c-0.2,0.6-0.9,1-1.1,1.5
			c-0.6,1.7-1,3.6-0.5,4.4c0.6,0.9,1.4,2.2,2.5,1.7c3.7,3.7,6.9,3.2,10.9,4.8c1.4,0.6,3,1.3,4.5,1.2c0,0,0.8-0.5,2.7,0.9
			c1.9,1.5,1.5,1.1,2.6,1.5c1.1,0.5,1.9,0.8,3.3,1.4c1.4,0.6,1.8-0.1,1.8-0.1c1.5-3.9,2.4-4.6,4.1-8.5c2.5-5.7,4.7-11.4,7.9-16.6
			c-0.9-2.2,0.6-3.5,1.8-6.3c0.1-0.2-0.2-0.9,0-1.3c0-0.1,0-0.1,0.1-0.2c-0.7,1.4,0.7-1.7,0,0c0.1-0.1,0.2-0.3,0.3-0.5
			c1.2-2.5,4.3-8.8,5.3-11.8c1.4-4.3,3.9-8.3,6-12.3c-1-0.9-1.7-1.5-1.3-3.4c0.6,0.3,1.3,0.5,1.9,0.8c-0.1,0.9-0.7,0.6-0.9,1.3
			c0.2,0.2,0.5,0.3,0.8,0.2c0.3-0.7,0.7-1.4,0.9-2.1c-0.1,0-0.2-0.1-0.2-0.2c0.1,0,0.2-0.1,0.3-0.1c0-0.1,0.1-0.2,0.1-0.2
			c0.1-0.3,0.3-0.6,0.4-0.9c-1.6,1.4-3.1-1.8-5.1-1.8c0.2-0.5-0.1-0.7,0.2-1.2c0.9,1.2,3.4,1.7,4,3c0.4,0,0.3-1.5,1.5-0.7
			c0.5-0.8,1-1.5,1.4-2.4c0.8-1.9,0.7-4.5,1.6-6.4c1-2.2,2.9-3.6,2.5-5.8c2.2-3.8,3.4-8.8,5.5-13.7c3-6.9,5.6-12.4,7.7-18.9
			c0.6-1.8,1.8-3.2,2.6-5.1c0.6-1.3,0.3-2.7,0.8-4.1c0.3-1,1.2-1.9,1.7-2.9c0.3-0.8,0.5-1.8,0.7-2.7c0.5,0.7,1.2,1.3,1.6,2.2
			c0.5,0.9,0.5,2.2,0.9,3.3c0.6,1.3,1.7,2.5,2.2,3.8c0.6,1.5,0.8,3.2,1.3,4.8c1.4,4,3.9,8.1,5.9,12.3c1.3,2.7,1.7,5.9,2.9,8.7
			c1.4,3.5,3.8,6.5,5.2,10.3c0.4,1.1,0.5,2.4,1,3.5c2.1,5,5.4,8.7,7,14.4c0.7,2.5,2.1,5.4,3.1,7.8c0.9,2.1,1.7,4.3,2.7,6.3
			c2.2,4.4,2.9,7.7,4.9,13.2c2.4,6.5,5.8,11.5,8.1,18.1c0.4,1.1,0.4,2.3,0.7,3.3c0.4,1.1,1.3,2.2,1.9,3.6c1.4,3.1,1.3,5,2.5,6.8
			c0.3,0.5,0.7,1.1,0.9,1.7c0,0-0.1,0-0.1,0c0,0-0.2,0.6-0.2,1.1c0.9-0.3,1.5-0.6,2.4-1.2c0.6,0.4,0.9,0.6,1.2,0.7
			c1.9-0.9,3.9-1.2,5.8-1.7c0,0,0,0,0,0c0,0,0,0,0,0c0.4-0.1,0.8-0.2,1.1-0.4c3.3-1.4,7.7-3.4,10.4-4.3c2.1-0.7,3.8-2.8,6.1-2.5
			c0,0,0.4-0.3,1.3-0.6C1234.1,248.3,1234.8,248.7,1234.5,247.9z M1182.6,28.7c0.1-0.3,0.2-0.6,0.3-0.8c0.4-0.1,0.9-0.1,1.5,0.3
			C1184.2,29.3,1183.5,29.2,1182.6,28.7z M1187.1,29.6c-1.2-0.2-0.5-1.8,0.5-1.1C1187.4,28.9,1187.2,29.3,1187.1,29.6z M1188,26.8
			c0.5-0.2,1.2,0.1,1.4,0.6C1188.9,28.1,1187.6,27.9,1188,26.8z M1189.3,24.4c0.2-0.4,0.9,0.2,1.1-0.2c0.1-0.3,0.2-0.6,0.3-0.8
			c1,0.6,1.5,1.5,2.6,1.4C1192.3,25.4,1190.6,24.5,1189.3,24.4z M1190.2,21.5c0.7-1.4,0.9,0.1,1.8,0.4
			C1191.6,22.5,1190.7,21.6,1190.2,21.5z M1195.7,24.5c-0.6-0.5-0.5-1.3-0.8-2C1196.3,22.3,1196.1,23.7,1195.7,24.5z M1193.1,19.2
			c1.1,0.4,1.6,1,1.5,1.9C1193.5,20.7,1192.2,20.4,1193.1,19.2z M1188.9,18.4c1,0.2,1.1,0.8,1,1.4c0.5-0.1,2.7-0.4,2.2,0.9
			c-0.7-0.8-1.2-0.8-1.7,0.2C1189.8,20.2,1188.5,19.6,1188.9,18.4z M1186.9,18.5c1.1,0.7,0.6,2.2,2.1,2.8c-0.3,1.4-1.7,1.5-1.9,2.1
			c-1.7,0-3.8-1.7-4-3.6C1183.8,18.2,1186.3,20.7,1186.9,18.5z M1183.2,15c0.8,0.3,1.4,0.7,1.4,1.2c-0.3,1.3-1.6,0.2-2.6-0.1
			C1182.5,15.9,1182.7,15.3,1183.2,15z M1181.8,21.3c0.8,1.6,3.3,1.7,4.3,2.8c-1,0.4-1.4-0.2-1.1,1.1c-0.4-0.2-0.8-0.4-0.9-0.1
			c-0.8-0.6,0-0.7,0.5-1.1c-2.1-0.7-2.9-0.9-4.3-2.1C1180.6,21.2,1181.5,22,1181.8,21.3z M1179.7,12.6c0.7,0.3,0.9,0.8,0.6,1.6
			c-0.5-0.2-0.7,0.1-1.2-0.2C1178.9,13.4,1179.1,12.8,1179.7,12.6z M1114.5,27.3c0-0.6,0.5-1.4,1.1-1.1
			C1115.6,26.8,1115.1,27.5,1114.5,27.3z M1127,66.8c0.7-0.3,1,0.1,1.6,0C1128.9,67.7,1127.1,68,1127,66.8z M1101.7,207.1
			c0.6-1.2,2.8-0.4,3,0.6C1104.1,208.6,1102.7,207.3,1101.7,207.1z M1106.9,207c-1.3-0.4-2.4-1-1.6-2.3c1.4,0.6,1.5,0.3,2.5,1
			C1107.7,206.6,1107.1,206.3,1106.9,207z M1115,173.7c-0.5-0.6-0.5-1.3-1.2-1.8c0.4-0.6,1.4,0.5,2,0.5
			C1115.7,173.2,1115.1,172.8,1115,173.7z M1118.1,198c0.5-0.9,1.5-0.9,2.7-0.2C1120.5,199.4,1119.2,198.5,1118.1,198z
			 M1120.3,199.9c1,0,0.5,0.7,0.9,1C1120.8,201.5,1119.4,200.6,1120.3,199.9z M1142,45.5c0.4,1-1.2,0.7,0,1.6
			c-0.7,0.4-1.1,0-1.3-0.8C1141.6,46.3,1141.3,45.7,1142,45.5z M1138.6,49.9c0.3,0.8-1,1.2-1.5,1c0-1-1,0.2-1-0.9
			C1137.1,50.3,1137.8,50.2,1138.6,49.9z M1135.8,71.5c-0.4-0.5-0.1-0.8-0.2-1.2c0.5-0.1,0.8,0.2,1,0.9
			C1136.3,71.3,1136,71.4,1135.8,71.5z M1136.3,69.7c1.6,0.3,1.5-0.6,2.6-0.8c0.2,0.6-0.9,0.7-0.8,1.3
			C1137.4,70.3,1136.7,70.4,1136.3,69.7z M1138,95.9c0.7-0.3,1.3-0.6,1.8-0.4C1140.1,96.4,1138.2,96.9,1138,95.9z M1142.7,67.3
			c-0.1,1.2-1.3,1.5-2.5,1.7C1140.2,68.1,1141.7,67,1142.7,67.3z M1140.8,78.8c0.4,0.7,1.3,0.2,1.7,0.9c-0.6,0.2-1.1,0.5-1.7,0.7
			C1140.2,79.6,1140.6,79.3,1140.8,78.8z M1141.1,104c-0.2-1.1,1-0.7,1.7-0.7C1142.9,104.4,1141.7,104,1141.1,104z M1145,91
			c-0.3-0.7,0.7-0.9,1.4-1.2C1146.7,91,1145.9,90.6,1145,91z M1146.6,75.7c-0.1-0.3-0.3-0.5-0.5-0.4c0.1-1,0.6-0.6,1.5-1
			C1148.1,75.1,1147.4,75.4,1146.6,75.7z M1158,71.1c-0.2,0.8-0.6,1.1-1.3,0.8C1157,71.1,1157.3,70.7,1158,71.1z M1155.9,107.2
			c-0.9-0.2-0.7-1.1-0.1-1.3C1156.2,106.3,1156.6,106.9,1155.9,107.2z M1158.6,114.5c-1.6-0.5-2-0.5-2.5-1.7c0.2-0.3,0.3,0,0.3,0.1
			C1157.9,113.1,1158.9,112.4,1158.6,114.5z M1158.9,73.7c-0.4-0.2-0.7-0.3-1.1-0.5c0.2-0.7,0.5-1,0.9-1.3c0.3,0.1,0.6,0.2,0.8,0.3
			C1159.3,72.8,1159.1,73.3,1158.9,73.7z M1160.6,121.5c-0.9-0.2-1.1-0.8-0.6-1.6C1160.5,120.3,1161.2,120.6,1160.6,121.5z
			 M1162.2,77.4c0.9,0.1,0.6,0.7,1.3,0.9c-0.1,1-1.1,0-1.3,0.8C1161.6,78.7,1161.9,78.1,1162.2,77.4z M1162.2,111.5
			c1-0.4,0-1,0.4-1.8c0.7,0.1,2.1,0.3,2.5,1C1164.3,111.4,1163.5,111.9,1162.2,111.5z M1167.6,30.5c0.7-0.9,0.1-1.7,0.8-1.9
			c1.2,1,2.6,0.9,3.1,0.3c0.8,1.3,1,1.4,2.6,1.4c-0.1,1.3-1.5-0.7-1.6,0.6c-0.9-0.9-2.6-1.2-3.5-0.8c-0.7,1,1.8,0.8,0.8,2
			C1168.5,31.8,1168.5,31,1167.6,30.5z M1177,135.9c0-0.6,0.1-1.2,1-1.4C1178.4,135.3,1177.7,135.6,1177,135.9z M1182.9,195.1
			c-0.9,0.2,0-0.7-0.5-1.1c0.7-0.4,1.2-0.4,1.5,0.4C1183.8,195.2,1182.7,194.5,1182.9,195.1z M1185.6,197.9c0.1-0.3,0.1-0.6-0.1-0.9
			c0.4-0.2,0.7-0.3,1.1-0.5C1186.6,197,1186.5,197.6,1185.6,197.9z M1190.8,198.6c-0.5,0.2-0.9,0.4-1.4,0.6
			C1189.2,198.4,1190.4,197.3,1190.8,198.6z M1188.5,201.5c0.7-0.1,1.4-0.2,1.8,0.5C1189.6,202,1188.7,202.7,1188.5,201.5z
			 M1189,205.8c0.7-0.4,1.2-0.4,1.5,0.4C1189.8,206.6,1189.1,206.9,1189,205.8z M1191,212.8c-0.2-0.9-0.9-0.6-0.6-1.4
			C1191.4,211,1192,212.4,1191,212.8z M1192,214.3c-0.3-0.9,1.2-1,2-1.5C1194.1,213.9,1192.5,214.2,1192,214.3z M1192.2,210.3
			c-0.1-1.4,1-1,1.9-0.8c0.6-0.7,0.5-1.6,1.7-2c0.8,0.5,0.2,1.2,1.1,1.8C1195.1,209,1193.7,210.9,1192.2,210.3z M1217.2,221.2
			c1-0.7,1.6,0.9,0.5,1.1C1217.4,221.5,1217,221.9,1217.2,221.2z M1216.6,222.7c0.3-0.1,0.6-0.2,0.8-0.4c0.4,0.8,0.7,1.5-0.2,1.7
			C1216.7,223.9,1216.4,223.3,1216.6,222.7z M1208.5,228.1c-0.5-0.5-1.2-0.5-1.5-1.3c0.3-0.1,0.5-0.3,0.4-0.5c0.9,0.5,2,0.4,3.4-0.5
			c0.8,0.9-0.5,1-0.2,1.7C1209.5,227.8,1209.3,227.2,1208.5,228.1z M1208.8,248.1c0.4-0.7,0.6-1,1.5-1c0.2,1.1,1.2,1.1,0.8,1.9
			C1210.2,249.2,1209.4,248.9,1208.8,248.1z M1210.6,256.8c-0.2-1.1,0.7-1.7,0.4-2.8c0.4-0.3,0.6,0.1,0.9-0.1
			c-0.5,1.8,0.8,0.9,1.6,2.2C1212.3,256.9,1211.6,256.5,1210.6,256.8z M1213.5,244.5c0-0.5,0.1-0.9,0.1-1.3c0.9-0.4,1.6-0.3,2.1,0.4
			C1214.6,243.8,1214.4,244.9,1213.5,244.5z M1215.9,241.9c-1.8,0.8-2.6-0.7-4.4,0.3c0.9-0.9,2.4-1,1.7-3c-0.3-0.7-1-0.3-0.9-1.3
			c0.6-0.4,1.1-0.4,1.5-0.3c-0.7,1.6,0.8,2.2,2,2.4C1216.5,240.9,1215.4,241.1,1215.9,241.9z M1216.5,239.4c0.1-0.6,1.4-0.8,0.5-1.8
			c0.6,0.3,1.5-0.4,2.3-0.7C1219.5,238.1,1217.6,239.4,1216.5,239.4z M1221.4,249.3c0.3,0,0.2-0.2,0.2-0.4c0.7-0.4,1.1,0,1.3,0.8
			C1222.1,250.1,1221.6,250.1,1221.4,249.3z M1224.1,249.8c1.1-0.7,1.7-0.4,2.3,0C1226.2,250.7,1224.5,250.5,1224.1,249.8z
			 M1226.2,238.5c-0.3,0.1-0.4-0.4-0.6-0.7c0.2-0.4,0.6-0.7,1.3-0.9C1227.4,237.8,1226,237.8,1226.2,238.5z"></path>
		<path fill="#4C3C2C" d="M55.6,33.1c0,0,0.1,0,0.1,0c0.3,0,0.6-0.1,0.9-0.1c-0.2-0.3-0.3-0.7-0.3-1.2C56,32.1,55.9,32.7,55.6,33.1z
			"></path>
		</g>
		<path fill="#4C3C2C" d="M1042.1,339.7c0.2,0.1,0.4,0.3,0.8,0.5c1.2,0.8,0,0,0.3,0.7c0.3,0.7,0.5,1,0,2.2c-0.3,0.7-0.6,0.6-1.1,0.7
			v5.8h10c0.1,4.6-2,10-8.8,10c-4.6,0-8.9-4.9-8.9-18.4c0-13.5,4.3-18.4,8.9-18.4c5.8,0,8.7,4.6,8.8,10h12.3
			c-0.8-12.9-9-21.1-21.1-21.1c-12.8,0-21.1,9.6-21.1,29.4c0,19.8,8.4,29.4,21.1,29.4c13.3,0,21.1-9.1,21.1-20.9v-11.2h-22.2V339.7z"></path>
	</g>
						</svg>
					</a>
				</div>
			</div>
		</div>
	</header>

	<div class="background slick-initialized slick-slider">
		<div aria-live="polite" class="slick-list draggable">
			<div class="slick-track" role="listbox">
				<div class="slide slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" tabindex="-1" role="option" aria-describedby="slick-slide00" style="position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;">
					<div class="slide-image" style="background-image: url('https://www.inthestix.co/wp-content/uploads/2017/01/shutterstock_393764014.jpg')"></div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- InstanceEndEditable --></div>
<div id="sc_maincol" > <div id="sc_content"><!-- #BeginEditable "main" -->

	<div id="sc_title">
		<h1>Availability and bookings for In the Stix</h1>
	</div>

	<br /><br />


<table width="95%" border="0" cellpadding="0" cellspacing="0" id="sc_grid_table">
	<tr>
		<td valign="top">&nbsp;</td>
		<td valign="top" align="center" id="sc_grid_dates">
			Select month:
			<select name="startmonth" id="startmonth" onchange="FrameSrc();">
			
				<option value="2025-01-01" selected>January 2025</option>
			
				<option value="2025-02-01">February 2025</option>
			
				<option value="2025-03-01">March 2025</option>
			
				<option value="2025-04-01">April 2025</option>
			
				<option value="2025-05-01">May 2025</option>
			
				<option value="2025-06-01">June 2025</option>
			
				<option value="2025-07-01">July 2025</option>
			
				<option value="2025-08-01">August 2025</option>
			
				<option value="2025-09-01">September 2025</option>
			
				<option value="2025-10-01">October 2025</option>
			
				<option value="2025-11-01">November 2025</option>
			
			</select>
			<input type="button" id="GoButton" value="Go" onclick="FrameSrc();" class="button" />
		</td>
	</tr>
	<tr>
		<td rowspan="2" valign="top">&nbsp;</td>
		<td valign="top" align="center" id="sc_grid_key">

			<div class="grid_header" id="grid_header_key">
				<span class="cal_sample_cell key_booked"><abbr title="Booked"><span id="key_booked"></span></abbr>&nbsp;Booked</span>
				<span class="cal_sample_cell key_available"><abbr title="Available"><span id="key_available"></span></abbr>&nbsp;Available</span>
				<span class="cal_sample_cell key_sb_break"><abbr title="Provisionally booked"><span id="key_sb_break"></span></abbr>&nbsp;Provisional</span>
				<span class="cal_sample_cell key_start"><abbr title="Allowed Arrival Date"><span id="key_start"><span id="key_purplebar"></span></span></abbr>&nbsp;Arrival Date</span>
				<span class="cal_sample_cell key_sb"><abbr title="Available for short breaks"><span id="key_sb"><span id="key_purplebar2"></span><span id="key_yellowbar"></span></span></abbr>&nbsp;Short Breaks</span>
                <span class="cal_sample_cell key_changeover"><abbr title="Changeover day"><span id="key_changeover"></span></abbr>&nbsp;Changeover day</span>
			</div>

			<div class="grid_header" id="grid_header_caption">
				Click on an arrival date to <span id="grid_header_view_prices">view prices or book</span>.
				Click property name for information.
			</div>
		</td>
	</tr>
	<tr>
		<td class="sc_grid_track_container">
			<!-- track 1 -->
			<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="track1table">
				<tr valign="top">
					<td width="15"><a class="scrollTop left" href="#"> <img src="slider/t1-arrow-left.gif" width="15" height="15" style="border:1px solid #999999;" /> </a> </td>
					<td>
						<div id="track1">
							<div id="handle1"> <img src="slider/t1-handle.gif" alt="" style="position:absolute; float: left;" /> </div>
						</div>
					</td>
					<td width="15"><a class="scrollTop right" href="#"> <img src="slider/t1-arrow-right.gif" width="15" height="15" style="border:1px solid #999999;" /> </a> </td>
				</tr>
			</table>
			<!-- end track 1 -->
		</td>
	</tr>


	<tr>
		<td width="20%" valign="top" id="sc_grid_properties">
			<table class="cottage_list" width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr><th><div style="padding: 1px 0;">&nbsp;</div></th></tr>
				<tr><th class="col_top" style="padding: 0; line-height: 100%;">&nbsp;<br />&nbsp;</th></tr>


				
				<tr id="c-row2" class="gainlayout">
				<td align="right" nowrap>
					
						<a href="javascript:;" onclick="PropertyInfo(523550);">Dome 1 Greetham  (sleeps 6)</a>
					
				</td>
				<td class="spacer"><img src="../images/spacer.gif" width="1" height="20" /></td>
				</tr>
				
				<tr id="c-row3" class="gainlayout">
				<td align="right" nowrap>
					
						<a href="javascript:;" onclick="PropertyInfo(523552);">Dome 2 Barrow  (sleeps 6)</a>
					
				</td>
				<td class="spacer"><img src="../images/spacer.gif" width="1" height="20" /></td>
				</tr>
				
				<tr id="c-row4" class="gainlayout">
				<td align="right" nowrap>
					
						<a href="javascript:;" onclick="PropertyInfo(523553);">Dome 3 Hambleton  (sleeps 6)</a>
					
				</td>
				<td class="spacer"><img src="../images/spacer.gif" width="1" height="20" /></td>
				</tr>
				
				<tr id="c-row5" class="gainlayout">
				<td align="right" nowrap>
					
						<a href="javascript:;" onclick="PropertyInfo(523554);">Dome 4 Exton  (sleeps 6)</a>
					
				</td>
				<td class="spacer"><img src="../images/spacer.gif" width="1" height="20" /></td>
				</tr>
				
				<tr id="c-row6" class="gainlayout">
				<td align="right" nowrap>
					
						<a href="javascript:;" onclick="PropertyInfo(579087);">Dome 5 Clipsham (sleeps 6)</a>
					
				</td>
				<td class="spacer"><img src="../images/spacer.gif" width="1" height="20" /></td>
				</tr>
				
				<tr id="c-row7" class="gainlayout">
				<td align="right" nowrap>
					
						<a href="javascript:;" onclick="PropertyInfo(579090);">Dome 6 Normanton (sleeps 6)</a>
					
				</td>
				<td class="spacer"><img src="../images/spacer.gif" width="1" height="20" /></td>
				</tr>
				

	  </table>
	  </td>
      <td width="80%" valign="top" id="sc_grid_outer">
<div id="grid_frame">
<div id="lyr1">
<div id="t1"></div>
</div>
</div>
<br clear="both" />

			<!-- track 2 -->
			<table width="100%"  border="0" cellspacing="0" cellpadding="0" id="track2table">
			  <tr valign="top">
				<td width="15"><a class="scrollBottom left" href="#"> <img src="slider/t1-arrow-left.gif" width="15" height="15" style="border:1px solid #999999;" /> </a> </td>
				<td><div id="track2">
					<div id="handle2"> <img src="slider/t1-handle.gif" alt="" style="position:absolute; float: left;" /> </div>
				  </div></td>
				<td width="15"><a class="scrollBottom right" href="#"> <img src="slider/t1-arrow-right.gif" width="15" height="15" style="border:1px solid #999999;" /> </a> </td>
			  </tr>
			</table>
			<!-- end track 2 -->

	  </td>
    </tr>
  </table>



<div style="display: none;">
<input type="hidden" name="sDate" id="sDate" value="" />
<input type="hidden" name="ownerID" id="ownerID" value="20331" />
<input type="hidden" name="siteID" id="siteID" value="42540" />
<input type="hidden" name="startdate" id="startdate" />
<input type="hidden" name="enddate" id="enddate" />
<input type="hidden" name="pax" id="pax" value="1" />
<input type="hidden" name="cottageID" id="cottageID" />
<input type="hidden" name="grid_adults" id="grid_adults" value="0" />
<input type="hidden" name="grid_children" id="grid_children" value="0" />
<input type="hidden" name="grid_infants" id="grid_infants" value="0" />
<input type="hidden" name="typeID" id="typeID" value="0" />
<input type="hidden" name="managerID" id="managerID" value="0" />

            <input type="hidden" id="ga_a" value="" />
            <input type="hidden" id="ga_b" value="" />
            <input type="hidden" id="ga_c" value="" />
            <input type="hidden" id="ga_z" value="" />
            <input type="hidden" id="ga_v" value="" />
</div>

<script type="text/javascript">
window.onload = FrameSrc;
</script>

<!-- Scrollers v1 -->
<script type="text/javascript">
// <![CDATA[

	var slider1 = new Control.Slider('handle1', 'track1', {
		range: $R(0, 100),
		values: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100],
		onSlide: function(v) { $('debug1').innerHTML = 'slide: ' + v; slider2.setValue(v); },
		onChange: function(v) { $('debug1').innerHTML = 'changed: ' + v; slider2.setValue(v); moveDiv(v,$('grid_frame')); }
	});

	var slider2 = new Control.Slider('handle2', 'track2', {
		range: $R(0, 100),
		values: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100],
		onSlide: function(v) { $('debug2').innerHTML = 'slide: ' + v; slider1.setValue(v); },
		onChange: function(v) { $('debug2').innerHTML = 'changed: ' + v; moveDiv(v,$('grid_frame'));}
	});

	document.observe('click', function(e) {
		var activator = e.findElement('a.scrollTop');
		if (!activator) return;
		e.stop();
		var sign    = activator.hasClassName('left') ? -1 : 1;
		var offset  = sign * ((slider1.maximum - slider1.minimum) / 10);
		slider1.setValue(slider1.value + offset);
	});

	document.observe('click', function(e) {
		var activator = e.findElement('a.scrollBottom');
		if (!activator) return;
		e.stop();
		var sign    = activator.hasClassName('left') ? -1 : 1;
		var offset  = sign * ((slider2.maximum - slider2.minimum) / 10);
		slider2.setValue(slider2.value + offset);
		slider1.setValue(slider2.value + offset);
	});

	function moveDiv(value, element) {
		element.scrollLeft = Math.round(value/slider1.maximum*(element.scrollWidth-element.offsetWidth));
	}

	// Scrolling - ref: http://www.switchonthecode.com/tutorials/javascript-tutorial-the-scroll-wheel
	function hookEvent(element, eventName, callback)
	{
	  if(typeof(element) == "string")
		element = document.getElementById(element);
	  if(element == null)
		return;
	  if(element.addEventListener)
	  {
		if(eventName == 'mousewheel')
		  element.addEventListener('DOMMouseScroll', callback, false);
		element.addEventListener(eventName, callback, false);
	  }
	  else if(element.attachEvent)
		element.attachEvent("on" + eventName, callback);
	}

	function cancelEvent(e)
	{
	  e = e ? e : window.event;
	  if(e.stopPropagation)
		e.stopPropagation();
	  if(e.preventDefault)
		e.preventDefault();
	  e.cancelBubble = true;
	  e.cancel = true;
	  e.returnValue = false;
	  return false;
	}

	function printInfo(e)
	{
	  e = e ? e : window.event;
	  var raw = e.detail ? e.detail : e.wheelDelta;
	  var normal = e.detail ? e.detail * -1 : e.wheelDelta / 40;
	  document.getElementById('scrollContent').innerHTML = "<br/>&nbsp;Raw Value: " + raw + "<br/>&nbsp;Normalized Value: " + normal;
	  slider1.setValueBy(raw);
	  cancelEvent(e);
	}

	// highlight
	

// ]]>
</script>
<!-- End Scrollers v1 -->
<!-- debug -->
<p id="debug1" style="display:none;">&nbsp;</p>
<p id="debug2" style="display:none;">&nbsp;</p>
<p id="scrollContent" style="display:none;"></p>
<!-- end debug -->
<!-- #EndEditable --></div>
</div>
<div id="sc_ownerfooter"><!-- InstanceBeginEditable name="ownerfooter" -->
<footer>

</footer>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
jQuery(document).ready(function() {
	 	jQuery('div.burger').click(function() {
	  			jQuery("#menu").css("height","500px");
	  			jQuery("#sc_ownerheader").css("height","1000px");
	  			jQuery("div.burger").css("display","none");
	  			jQuery("div.close_burger").css("display","block");
	 	});
	 	jQuery('div.close_burger').click(function() {
	  			jQuery("#menu").css("height","0px");
	  			jQuery("#sc_ownerheader").css("height","500px");
	  			jQuery("div.close_burger").css("display","none");
	  			jQuery("div.burger").css("display","block");
	 	});
});
</script>

<script>$.noConflict();</script> 



<!-- InstanceEndEditable --></div>
<div id="sc_footer" >Powered by <a href="http://www.supercontrol.co.uk" target="_blank">SuperControl</a><span id="sc_sys_txt">, online booking system for self-catering.</span> &copy; All Rights Reserved 2025.

&nbsp;&nbsp;<span id="sc_terms_link"><a href="/terms/42540" target="_blank">Terms &amp; Conditions</a></span>&nbsp; | &nbsp;<span id"sc_cancellation_link"><a href="/cancellation/42540" target="_blank">Cancellation Policy</a></span>&nbsp; | &nbsp;<span id="sc_privacy_link"><a href="/privacy-policy/20331" target="_blank">Privacy Policy</a></span>&nbsp; | &nbsp;<span id="sc_cookie_link"><a href="/cookies/42540" target="_blank">Cookies</a></span>

</div>

<div id="paymentSecurityWrap">
</div>
<style>
#paymentSecurityWrap {
    margin-top:5px;
    height:30px;
    max-width:1000px;
    margin:0 auto;
} #paymentSecurityWrap div#paymentSecurityPrimary {
    display:table;
    height:30px;
    float:left;
} #paymentSecurityWrap div#paymentSecurityPrimary .big {
    display:table-cell;
    vertical-align: middle;
    max-width:80px;
    padding-right:5px;
} #paymentSecurityWrap div#paymentSecurityPrimary .big img {
    margin-right:5px;
    max-width:100%;
    max-height:25px;
    height:auto;
} #paymentSecurityWrap div#paymentSecuritySecondary {
    display:table;
    height:30px;
    float:left;
} #paymentSecurityWrap div#paymentSecuritySecondary .small {
    display:table-cell;
    min-width:20px;
    max-height:20px;
    vertical-align: middle;
    padding-right:5px;
} #paymentSecurityWrap div#paymentSecuritySecondary .small img {
    margin-right:5px;
    max-width:100%;
    max-height:25px;
    height:auto;
}
</style>
<script>

    var paymentsData = {"CardProcessor":"protx","StandardPayments":["Bad debt","Bank transfer","Diners","JCB","Maestro","Mastercard","MasterCard Debit Card","Pay by card","UK Bank transfer","Visa","VISA Debit / Delta","VISA Electron"],"PayPalActive":1},
        processorSnippet = paymentsData.CardProcessor!='none'?('<div class="big"><img height="30" src="/ui/dist/img/payment-security/'+paymentsData.CardProcessor+'.png"></div>'):'',
        resultOne = '<div id="paymentSecurityPrimary">'+
        '<div class="big"><img height="30" src="/ui/dist/img/payment-security/supercontrol.png" alt="Secured by SuperControl"></div>'+
        '<div class="big"><img height="30" src="/ui/dist/img/payment-security/comodo.png" alt="Site with SSL certificate by Comodo"></div>'+
        processorSnippet+
        '</div><div id="paymentSecuritySecondary"></div></div>',
        resultTwo = '';
        data = {};
    document.getElementById('paymentSecurityWrap').innerHTML = resultOne;

    for(var i =0; i<paymentsData.StandardPayments.length; i++) {
        data[paymentsData.StandardPayments[i].split(' ')[0].toLowerCase()] = paymentsData.StandardPayments[i].split(' ')[0].toLowerCase();
    }

    for(var j in data) {
        switch(data[j]){
            case 'mastercard':
            case 'visa':
            case 'amex':
            case 'maestro':
            case 'solo':
            case 'jcb':
            case 'diners':
            case 'carte':
            case 'paypal':
            case 'bartercard':
                resultTwo += '<div class="small"><img height="20" src="/ui/dist/img/payment-security/'+data[j]+'.png"></div>';
        }
    }

    if(paymentsData.PayPalActive===1){
        resultTwo += '<div class="small"><img height="20" src="/ui/dist/img/payment-security/paypal.png"></div>';
    }

    document.getElementById('paymentSecuritySecondary').innerHTML = resultTwo;
</script>

</div>
</div>
<div id="sc_ssl_logo">
<span id="sc_ownerssl"><!-- InstanceBeginEditable name="ownerssl" --><!-- InstanceEndEditable --></span>
<img src="../images/ssl_logo.gif" alt="Website secured by SSL" width="92" height="55" id="sc_ssl_img" /></div>
<!-- SuperControl Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-K7NVWG5"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End SuperControl Google Tag Manager (noscript) -->
<div id="sc_tracking"><!-- InstanceBeginEditable name="sitetrackingcode" -->
<!-- InstanceEndEditable --></div>
<!-- InstanceBeginEditable name="remarketing" --><!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
