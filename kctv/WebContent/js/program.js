function setVodCode(main){
	if(main)
		location.href="program.htm?muid=113&maincd="+$("#maincd").val()+"&subcd=";
	else
		location.href="program.htm?muid=113&maincd="+$("#maincd").val()+"&subcd="+$("#subcd").val();
}