/**
 * 
 */
function doLike(pid,uid){
	console.log(pid+","+uid);
	const d={
		uid:uid,
		pid:pid,
		operation: 'like'
	}
	
	$.ajax({
		url:"liked_servlet",
		data:d,
		success:function(data,textStatus,jqXHR){
			console.log(data);
			var c=$(".like-cnt").html();
			console.log(data);
			if(data.trim()=='true'){
				c=c+1;	
			}			
			else if(data.trim()=='removed'){
				console.log(c);
				c=c-1;			
			}
			
			$(".like-cnt").html(c);
			
			
			
		},
		error: function(jqXHR,textStatus,errorThrown){
			console.log(data);
		}
	})
}
