/**
 * 提示框，（有确认取消按钮）
 * @param {Object} obj	点击对象
 * @param {Object} info	提示信息
 * @param {Object} id	传入的id值
 * @param {Object} type	自定义标示
 * 确认回调函数：promptBoxSuccess(obj,index);
 * 取消回调函数：promptBoxFail(obj,index);
 */
function promptBox(obj,info,id,type) {
	var index = layer.confirm(info, {
		btn: ['确认', '取消'],
	}, function() {
		//点击确定的回调函数
		if (typeof promptBoxSuccess != "undefined") { 
			promptBoxSuccess(obj,index,id,type);
		}
	}, function() {
		//点击取消的回调函数
		if (typeof promptBoxFail != "undefined") { 
			promptBoxFail(obj,index,id,type);
		}
	});
}

/**
 * 弹出输入框
 * @param obj 点击对象
 * @param myData	我的自定义数据
 * @returns
 */
function promptInputBox(obj,title,myData) {
	layer.prompt({
	  formType: 0,
	  title: title
	}, function(val, index){
		//点击取消的回调函数
		if (typeof promptInputBoxSuccess != "undefined") { 
			promptInputBoxSuccess(obj,myData,val,index);
		}
	});
}

/**
 * iframe弹出层 
 * @param {Object} url	弹出页面的url
 * @param {Object} title  弹出页面的标题
 * @param {Object} wRatio 宽度缩小比率
 * @param {Object} hRatio 高度缩小比率
 * @param {Object} isFull 是否放大
 * @param {Object} type 自定义类型
 */
function iframe(url,title,wRatio,hRatio,isFull,type) {
	var width =  document.body.clientWidth;
	var height =  document.body.clientHeight;
	if(width==undefined)	width=1360;
	if(height==undefined)	width=768;
	if(wRatio==undefined)	wRatio = 1.2;
	if(hRatio==undefined)	hRatio = 1.2;
	var openIndex = layer.open({
		type: 2,
		title: title,
		shadeClose: false,
		shade: 0.5,
		maxmin: true, 	//开启最大化最小化按钮
		area: [width/wRatio+'px', height/hRatio+'px'],
		content: url,
		success: function(layero, index){
			if (typeof iframeSuccess != "undefined") { 
				iframeSuccess(layero, index, type);
			}
	    }
	});
	if(isFull!=undefined){
		if(isFull){
			layer.full(openIndex);
		}
	}else{
		layer.full(openIndex);
	}
	
}

/**
 * 放大图片
 * @param imgUrl
 * @param wRatio 宽度缩小比率
 * @param hRatio 高度缩小比率
 * @returns
 */
function openImg(imgUrl,wRatio,hRatio) {
	var width =  document.body.clientWidth;
	var height =  document.body.clientHeight;
	if(wRatio==undefined)	wRatio = 1.2;
	if(hRatio==undefined)	hRatio = 1.2;
	if(width==undefined)	width=1360;
	if(height==undefined)	height=768;
	layer.open({
		type : 1,
		skin : 'layui-layer-demo', //样式类名
		area: [width/wRatio+'px', height/hRatio+'px'],
		title : false,
		scrollbar : false,
		resize: false,	//不允许拉伸
		closeBtn : 1, //不显示关闭按钮
		shift : 2,
		shadeClose : true, //开启遮罩关闭
		content : '<img src="'+imgUrl+'" width="'+width/wRatio+'px" height="'+height/hRatio+'px"></img>'
	});
}

/**
 * 选择时间框
 * @param istoday	是否显示今天
 * @param istime	是否显示时间选择器
 */
function showData(){
	layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'});
}


/**
 * 弹出层操作结果
 * @param {Object} info	提示信息
 * @param {Object} isReloadParent	是否刷新父页面
 * @param {Object} isCloseIframe	是否关闭弹出层
 */
function iframeResult(info,isReloadParent,isCloseIframe){
	var i = layer.alert(info, {
		skin: 'layui-layer-molv', //样式类名
		closeBtn: 0,
		shade: [0.8, '#FFFFFF'],
		anim: 4
	}, function(){
		//刷新父页面
		if(isReloadParent)	parent.location.reload();
		//关闭弹出层
		if(isCloseIframe){
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
			parent.layer.close(index);
		}
		layer.close(i);
	});
}

/**
 * 上传图片
 * @param elem 选择器
 * @param url 上传链接
 * @param method	上传方法 post或者get
 * @param title	上传按钮标题
 * @param title	上传类型images,file,video,audio
 * @returns
 */
function uploadImg(elem,url,method,title,type,myObj){
	layui.upload({
		elem:elem,
		url: url,
		method: method,
		title: title,
		type:type,
		before: function(input){
	    	//返回的参数item，即为当前的input DOM对象
			index = layer.msg('上传中', {icon: 16,shade: 0.01,time:100000000});
	  	},
		success: function(res){
			layer.close(index);
			//上传成功回调函数
			if (typeof uploadImgSuccess != "undefined") { 
				uploadImgSuccess(res,myObj);
			}
		}
	});
}


/**
 * 表单验证
 * 验证通过回调函数：submitForm(data);
 */
function validform(){
	$("form").Validform({
		tiptype:function(msg,o,cssctl){
		    //msg：提示信息;
		    //o:{obj:*,type:*,curform:*},
		    //obj指向的是当前验证的表单元素（或表单对象，验证全部验证通过，提交表单时o.obj为该表单对象），
		    //type指示提示的状态，值为1、2、3、4， 1：正在检测/提交数据，2：通过验证，3：验证失败，4：提示ignore状态, 
		    //curform为当前form对象;
		    //cssctl:内置的提示信息样式控制函数，该函数需传入两个参数：显示提示信息的对象 和 当前提示的状态（既形参o中的type）;
		    if(o.type==3){
		    	layer.msg(msg,{time:1000});
		    }
		},
		beforeSubmit(curform){
			if (typeof submitForm != "undefined") {
				submitForm(toJson($(curform).serializeArray()));
			}
			return false;
		}
	});
}
	


/**
 * ajax提交函数封装
 * @param {Object} ajaxUrl	提交的url
 * @param {Object} ajaxType	提交的方式,post和get
 * @param {Object} ajaxData	提交的数据 ,json格式
 * @param {Object} type 类型（可自定义）
 * 成功后回调函数   ajaxSuccess(ajaxData,type);
 */
function ajaxSubmit(ajaxUrl,ajaxType,ajaxData,type){
	var index = layer.load(2);	//等待框
	$.ajax({     
		url: ajaxUrl,
		type: ajaxType,    
		dataType:"json",
		data: ajaxData, 
		success: function(data) { 
			//ajax提交数据成功的回调函数
			//ajaxData传入ajax的数据参数,为json
			layer.close(index);		//关闭等待框
			if (typeof ajaxSuccess != "undefined") { 
				ajaxSuccess(data,type);
			}
        },     
        error: function(err) {     
        	layer.close(index);	//关闭等待框
            layer.alert("服务器繁忙");
        }     
    }); 
}


function toJson(serializeArray){
	var o = {};
	var a = serializeArray;
	$.each(a, function() {
		o[this.name] = this.value;
	});
	return o;
}
