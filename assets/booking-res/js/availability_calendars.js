function hoverCell(){
  var theCell = this;
  if(theCell.className.match("available")){
    theCell.className += " avail_calendar_hovered";
  }
}
function leaveCell(){
  var theCell = this;
  theCell.className = theCell.className.replace(/\s+avail_calendar_hovered/gi,"");
}
function checkCell(){
  var theCell = this;
  var theBox = theCell.getElementsByTagName("input")[0];
  if(theBox.checked=!theBox.checked){
    theCell.className = "avail_calendar_checked";
  } else {
    theCell.className = "avail_calendar_hover";
  }
}

function SelectRow (idx, cell_count) {

var i=1
for (i=1;i<=cell_count;i++)
{
var wk = document.getElementById(idx+'_wk');
var wk_td = document.getElementById(idx+'_wk_td');
var td = document.getElementById(idx+'_'+i);
var chk = document.getElementById(idx+'_'+i+'_chk');

if (td) {
	
	if ( wk_td.className != 'avail_calendar_checked' ) {
		
		td.className = 'avail_calendar_checked';
		if (chk != null) {
		chk.checked = true;
		}
	}
	else {
	if (td.getAttribute("rel") == 'wk') {
		td.className = 'avail_calendar_available';
		}
		else
		{
		td.className = 'avail_calendar_hover';
		}
		if (chk != null) {
		chk.checked = false;
		}
	}
}
}

if ( wk_td.className != 'avail_calendar_checked' ) {
wk_td.className = 'avail_calendar_checked';
wk.checked = true;
}
else
{
wk_td.className = 'avail_calendar_week';
wk.checked = false;
}

}



function checkTD (cell) {

var td = document.getElementById(cell);
var chk = document.getElementById(cell+'-chk');

	if ( td.className != 'avail_calendar_checked' ) {
		td.className = 'avail_calendar_checked';
		chk.checked = true;
	}
	else {
		td.className = 'avail_calendar_hover';
		chk.checked = false;
	}

}

function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}


function cottagebookinghide(tel) {
	var answer = confirm("Please ensure that you have contacted our office on " + tel + " to check the latest availability for this property before proceeding")
	if (answer){
		return true;
	}
	else{
		return false;
	}
}



function CheckCells(start,end,wk) {

var date1 = start.split("-");
var startDate = new Date(date1[0], date1[1]-1, date1[2]);

var date2 = end.split("-");
var endDate = new Date(date2[0], date2[1]-1, date2[2]);	

//Highlight the week cell and tick the week checkbox
var chk_week = wk + '-wk';
var CellWeek = wk + '-wk-td';

	if ($(CellWeek)) {
		
		if ($(CellWeek).className != 'avail_calendar_checked'){
		$(CellWeek).className = 'avail_calendar_checked';
		$(chk_week).checked = true;
		}
		else
		{
		$(CellWeek).className = 'avail_calendar_week';
		$(chk_week).checked = false;
		}
	}

//Loop through the dates
while ( startDate <= endDate ) {

var CellDate = startDate.format("isoDate");

	/// Change the colour of the daily cells
	if ($(CellDate)) {
		
		if ($(CellDate).className != 'avail_calendar_checked'){
		$(CellDate).className = 'avail_calendar_checked';
		}
		else
		{
		$(CellDate).className = 'avail_calendar_hover';
		}
		
 /// Tick the daily checkboxes
 var chk = CellDate + '-chk';
 
 if ($(chk)) {
	
	if ($(chk).checked == false) {
	$(chk).checked = true;
	}
	else
	{
	$(chk).checked = false;
	}
	
 }
 
	}


startDate.setDate( startDate.getDate() + 1 ); //Increment by one day
}

}

//Reset the class for all dates
function ClearCells(sDate,eDate) {
	
var date1 = sDate.split("/");	
var startDate = new Date(date1[2], date1[1]-1, date1[0]);
	
var date2 = eDate.split("/");	
var endDate = new Date(date2[2], date2[1]-1, date2[0]);	

while ( startDate <= endDate ) {

var CellDate = startDate.format("isoDate");

	/// Change the colour of the daily cells
	if ($(CellDate)) {
		if ($(CellDate).className == 'avail_calendar_checked') {
		$(CellDate).className = 'avail_calendar_hover';
		}
		}

startDate.setDate( startDate.getDate() + 1 ); //Increment by one day
}

}

function getElementsByClassName(className, tag, elm){
	var testClass = new RegExp("(^|\\s)" + className + "(\\s|$)");
	var tag = tag || "*";
	var elm = elm || document;
	var elements = (tag == "*" && elm.all)? elm.all : elm.getElementsByTagName(tag);
	var returnElements = [];
	var current;
	var length = elements.length;
	for(var i=0; i<length; i++){
		current = elements[i];
		if(testClass.test(current.className)){
			returnElements.push(current);
		}
	}
	return returnElements;
}


function SetCells() {
	
var fDate = $('dDate').value;
var lDate = $('lDate').value;

ClearCells(fDate,lDate);
	
var select_array = getElementsByClassName('week_select','select',document);

for(var j=0; j<select_array.length; j++){
	
	var select_val = select_array[j].value;
	
	if (select_val != '') {
		CheckCellsDrop(select_array[j]);
	}
	
}
}

function CheckCellsDrop(fld) {

var field_array = fld.value.split("|");

var date1 = field_array[0].split("/");
var startDate = new Date(date1[2], date1[1]-1, date1[0]);

var endDate = new Date(date1[2], date1[1]-1, date1[0]);
endDate.setDate( endDate.getDate() + 6 ); //Increment by six days

//Loop through the dates
while ( startDate <= endDate ) {

var CellDate = startDate.format("isoDate");

	/// Change the colour of the daily cells
	if ($(CellDate)) {
		if ($(CellDate).className != 'avail_calendar_checked'){
		$(CellDate).className = 'avail_calendar_checked';
		}

}

startDate.setDate( startDate.getDate() + 1 ); //Increment by one day
}

}


//////////////////////////////////
///// For fixed break calendars

function CheckCellsFix(start,end,wk) {

var date1 = start.split("-");
var startDate = new Date(date1[0], date1[1]-1, date1[2]);

var date2 = end.split("-");
var endDate = new Date(date2[0], date2[1]-1, date2[2]);	

var chk_sb = start + '-sb';
var CellWeek = start;

//Set the class for the tick box cell

	if ($(CellWeek)) {
		
		if ($(CellWeek).className != 'avail_calendar_checked'){
		$(CellWeek).className = 'avail_calendar_checked';
		$(chk_sb).checked = true;
		}
		else
		{
		$(CellWeek).className = 'avail_calendar_hover';
		$(chk_sb).checked = false;
		}
	}
	
startDate.setDate( startDate.getDate() + 1 ); //Increment by one day	

//Loop through the dates
while ( startDate <= endDate ) {

var CellDate = startDate.format("isoDate");

	/// Change the colour of the daily cells
	if ($(CellDate)) {
		
		if ($(CellDate).className != 'avail_calendar_checked'){
		$(CellDate).className = 'avail_calendar_checked';
		}
		else
		{
		$(CellDate).className = 'avail_calendar_available';
		}
		
 /// Tick the daily checkboxes
 var chk = CellDate + '-chk';
 
 if ($(chk)) {
	
	if ($(chk).checked == false) {
	$(chk).checked = true;
	}
	else
	{
	$(chk).checked = false;
	}
	
 }
 
	}


startDate.setDate( startDate.getDate() + 1 ); //Increment by one day
}

}