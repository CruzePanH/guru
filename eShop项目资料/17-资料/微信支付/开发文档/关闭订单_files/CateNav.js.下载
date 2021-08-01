jQuery.CateNav=function(elem1,elem2){
		//添加目录
		var currObj;
		var offsetTop=0;
		var h2List=new Array(),h3List=new Array();

		var addNav=function(){
			var i1=0,i2=0,n1=0,n2=0;
			var temp='<dl style="display:none;">';
			if($(elem1).html()!=null){
			var cateList=$(elem1).html().match(/(<h3[^>]*>.*?<\/h3>)/ig);
			if(cateList!=null){
			for(var i=0;i<cateList.length;i++){
				if(/(<h3[^>]*>.*?<\/h3>)/ig.test(cateList[i])){
					n1++;
					n2=0;
					temp+='<dd class="cate-item1"><a href="#'+n1+'">'+cateList[i].replace(/<[^>].*?>/g,"")+'</a></dd>';
					h2List[i1]=n1;
					i1++;
				}else{
					n2++;
					temp+='<dd class="cate-item2"><a href="#'+n1+'_'+n2+'">'+cateList[i].replace(/<[^>].*?>/g,"")+'</a></dd>';
					h3List[i2]=n1+'_'+n2;
					i2++;
				}
			}
}else{$("#Catalog-box").css("display","none")}
			}
			temp+='</dl>';
			$(elem2).append(temp);
		};
		//添加锚点
		var addPoint=function(){
			var i1=i2=0;
			$(elem1).find('h3').each(function(){
				$(this).prepend('<a name="'+h2List[i1]+'"></a>');
				i1++;
			});
			$(elem1).find('h4').each(function(){
				$(this).prepend('<a name="'+h3List[i2]+'"></a>');
				i2++;
			});
		};
		//点击锚点，跳转制定位置
		var clickPoint=function(){

			$(elem2+' a').click(function(e){
				e.preventDefault();
				$(elem2+' dd').removeClass('active');
				$(this).parent('dd').addClass('active');
				currObj=$("[name='"+$(this).attr('href').replace(/#/,'')+"']");
				offsetTop=currObj.offset().top;
				$('html,body').animate({
					scrollTop:offsetTop
				},500,'swing');

			});

		};
		//屏幕滚动，显示并选中锚点
		var scrollWin=function(){
		var windowTop=0;
			$(window).scroll(function(){
				windowTop=$(window).scrollTop();
				if($(elem1).html()){
				if(windowTop>=$(elem1).offset().top){
					$(elem2+' dl').slideDown(600);
				}else{
					$(elem2+' dl').slideUp(600);
				}
				$(elem2+' a').each(function(){
					currObj=$("[name='"+$(this).attr('href').replace(/#/,'')+"']");
					offsetTop=currObj.offset().top;
					if(windowTop>offsetTop-1){
						$(elem2+' dd').removeClass('active');
						$(this).parent('dd').addClass('active');
						return;
					}
				});
				}
			});
		};
		var init=function(){
			addNav();
			addPoint();
			clickPoint();
			scrollWin();
		}
		init();
	}/*  |xGv00|454c9b91f9a70f5eb7c724369888b03c */