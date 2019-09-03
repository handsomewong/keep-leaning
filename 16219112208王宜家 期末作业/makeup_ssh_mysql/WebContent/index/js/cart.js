//加入购物车
function buy(makeupid){
	$.post("buy.action", {makeupid:makeupid}, function(data){
		if(data=="ok"){
			layer.msg("操作成功");
			location.reload();
		}else if(data=="login"){
			layer.msg("请登录后购买");
			location.href="login.jsp";
		}else{
			alert("请求失败!");
		}
	});
}

//购物车减去
function lessen(makeupid){
	$.post("lessen.action", {makeupid:makeupid}, function(data){
		if(data=="ok"){
			layer.msg("操作成功");
			location.reload();
		}else if(data=="login"){
			alert("请登录后操作!");
			location.href="login.jsp";
		}else{
			alert("请求失败!");
		}
	});
}

// 购物车删除
function deletes(makeupid){
	$.post("delete.action", {makeupid:makeupid}, function(data){
		if(data=="ok"){
			layer.msg("操作成功");
			location.reload();
		}else if(data=="login"){
			alert("请登录后操作!");
			location.href="login.jsp";
		}else{
			alert("请求失败!");
		}
	});
}