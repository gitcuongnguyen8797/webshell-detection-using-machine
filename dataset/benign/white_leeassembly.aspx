<!doctype html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="renderer" content="webkit"> 

  <title>kesion前端常用组件封装</title>
  <script src="/ks_inc/jquery.js" type="text/javascript"></script>
  <style>
	*{margin:0px;padding:0px;word-break: break-all;word-wrap: break-word;}
	li,ul{ list-style:none;}
	body{ letter-spacing:1px;font-size: 12px;color:#333;font-family:Arial,'hiragino sans gb','microsoft yahei ui','microsoft yahei',simsun,sans-serif;}
	a{text-decoration:none;color:#333;}
	.clear{ clear:both; overflow:hidden;}
	.clearfix{overflow:hidden;_zoom:1;}
	.clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}
	
	.container{padding:80px 120px;}
	.blank60{height:60px;}
  	h1{ font-size:30px;margin-top:50px;font-weight:normal;color:#00b38a; position:relative;height:70px; line-height:70px;}
	h1 span{color:#929292; font-size:24px; padding-left:10px;}
	h1 .line{width:60px;height:2px; background:#00b38a; position:absolute;bottom:0;left:0;}
	.f-l{ float:left;}
	.info{ line-height:32px; font-size:12px; padding:20px; margin:30px 0px; background:#f9f9f9;}
	.info h4{ font-size:14px; line-height:34px;}
	.info p{color:#929292;}
	.info strong{color:#333; margin-right:20px;}
	.title{ font-size:36px; font-weight:bold;height:36px; line-height:36px;}
	.title span{ margin-right:20px;}
	.title em{ font-style:normal; font-size:16px;color:#929292; background:#00b38a; color:#fff;border-radius:4px;bprder-radius:3px; float:left; padding:0px 20px;}
	/*carousel*/
	.carousel-dots{ position:absolute;bottom:20px;width:100%; text-align:center;height:12px; line-height:12px; overflow:hidden;}
	.carousel-dots span{ display:inline-block;}
	.carousel-dots i{width:12px;height:12px;float:left; background:#fff;margin:0px 5px; border-radius:50%; cursor:pointer;filter:alpha(opacity=30);  -moz-opacity:0.3;  -khtml-opacity: 0.3;  opacity: 0.3;}
	.carousel-dots .on{ filter:alpha(opacity=100);  -moz-opacity:1;  -khtml-opacity: 1;  opacity: 1;}
	.carousel-prev,
	.carousel-next{width:60px;height:60px; position:absolute;top:50%;margin-top:-30px; cursor:pointer; filter:alpha(opacity=50);  -moz-opacity:0.5;  -khtml-opacity: 0.5;  opacity: 0.5;}
	.carousel-prev{left:0;background:url(/ks_inc/drag/images/icon-l.png) no-repeat 50% 50%;}
	.carousel-next{right:0;background:url(/ks_inc/drag/images/icon-r.png) no-repeat 50% 50%;}
	
	.carousel-prev:hover,
	.carousel-next:hover{filter:alpha(opacity=100);  -moz-opacity:1;  -khtml-opacity: 1;  opacity: 1;}
	
	#carousel3{ padding:40px 0px;}
	#carousel3 .carousel-prev,
	#carousel3 .carousel-next{width:100%;left:0;height:40px; z-index:9;top:inherit; position:absolute;margin-top:0px;filter:alpha(opacity=100);  -moz-opacity:1;  -khtml-opacity: 1;  opacity: 1;}
	#carousel3 .carousel-prev{top:0px; background:#f5f5f5 url(/ks_inc/drag/images/icon-t.png) no-repeat 50% 50%; background-size:20px auto;}
	#carousel3 .carousel-next{bottom:0px; background:#f5f5f5 url(/ks_inc/drag/images/icon-b.png) no-repeat 50% 50%; background-size:20px auto;}
	#carousel3 .carousel-dots{bottom:60px;}
	
	.tab{height:40px; line-height:40px; background:#f5f5f5;border:1px solid #ebebeb;border-bottom:0px; }
	.tab li{float:left; padding:0px 20px; cursor:pointer;color:#929292;}
	.tab .active{ background:#fff;border-right:1px solid #ebebeb;height:41px; font-weight:bold; color:#323232;}
	.tabBox{border:1px solid #ebebeb;}
	.tabBox .box{height:300px; padding:30px;}
	.myTab{width:600px;margin-top:30px;}
	
	.tabMain .myTab{width:40%;float:left; margin-right:5%;}
	
	.accordion{width:300px;border:1px solid #ebebeb;border-bottom:0px;}
	.accordion .name{height:40px; background:#f5f5f5;border-bottom:1px solid #ebebeb; line-height:40px; padding:0px 15px;}
	.accordion .box{ line-height:34px; padding:15px;}
	.accordion .box span{ display:block;}
	.accordion .box{border-bottom:1px solid #ebebeb;}
  </style>
 	
</head>
<body>
   
<div class="container">
   
    <div class="title"><span class="f-l">kesion.assembly</span><em>version1.0</em></div>
   
    <div class="name"><h1>幻灯片 <span>.carousel</span><i class="line"></i></h1></div>
    <div class="info">
    	<h4>属性设置说明</h4>
        <p>
        	<strong>object</strong>轮播对象；<br />
            <strong>scrollType</strong>轮播效果类型，支持fage跟slide；  fade:淡入淡出   slide:滑动<br />
            <strong>axis</strong>支持X、Y轴滚动;<br />
            <strong>width</strong>滚动容器宽度，可设置为百分比；<br />
            <strong>height</strong>滚动容器高度，可设置为百分比；  百分比的实际高度 =  宽度×（高度百分比/100）<br />
            <strong>objectWidth</strong>特殊情况，可不设置。设置百分比的情况下，objectWidth=width×（objectWidth/100）<br />
            <strong>objectHeight</strong>特殊情况，可不设置。设置百分比的情况下，objectHeight=height×（objectHeight/100）<br />
            <strong>arrow</strong>左右箭头，需要则设置为true，否则false或删除<br />
            <strong>autoPlay</strong>自动播放，需要则设置为true，否则false或删除<br />
            <strong>dots</strong>小圆点，1不带数字，2 带数字<br />
            <strong>speed</strong>动画执行速度<br />
            <strong>interval</strong>自动播放间隔<br />
        </p>
    </div>
    
    
    <div id="carousel">
    	
        <ul>
        	<li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495689338378&di=99a082cec1e65a7838b5b152dedfb61b&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2%2F57b42f07d99e4.jpg) no-repeat; background-size:cover;"></li>
        	<li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495606622812&di=28303547db3d93c5da444b901baccb13&imgtype=0&src=http%3A%2F%2Fwww.bz55.com%2Fuploads%2Fallimg%2F150417%2F139-15041G02610.jpg) no-repeat; background-size:cover;"></li>
        	<li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495689362423&di=cadfe8369e66ffef5f8af97260f1c769&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F4%2F57b57f23d1069.jpg) no-repeat; background-size:cover;"></li>
        </ul>
        
    </div>
    
    <div class="clear blank60"></div>
    
    <div id="carousel2">
    	
        <ul>
        	<li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495689338378&di=99a082cec1e65a7838b5b152dedfb61b&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2%2F57b42f07d99e4.jpg) no-repeat; background-size:cover;"></li>
        	<li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495606622812&di=28303547db3d93c5da444b901baccb13&imgtype=0&src=http%3A%2F%2Fwww.bz55.com%2Fuploads%2Fallimg%2F150417%2F139-15041G02610.jpg) no-repeat; background-size:cover;"></li>
        	<li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495689362423&di=cadfe8369e66ffef5f8af97260f1c769&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F4%2F57b57f23d1069.jpg) no-repeat; background-size:cover;"></li>
        </ul>
        
    </div>
    
    <div class="clear blank60"></div>
    
      <div id="carousel3">
          
          <ul>
              <li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495689338378&di=99a082cec1e65a7838b5b152dedfb61b&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2%2F57b42f07d99e4.jpg) no-repeat; background-size:cover;"></li>
              <li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495606622812&di=28303547db3d93c5da444b901baccb13&imgtype=0&src=http%3A%2F%2Fwww.bz55.com%2Fuploads%2Fallimg%2F150417%2F139-15041G02610.jpg) no-repeat; background-size:cover;"></li>
              <li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495689362423&di=cadfe8369e66ffef5f8af97260f1c769&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F4%2F57b57f23d1069.jpg) no-repeat; background-size:cover;"></li>
          </ul>
          
      </div>
    <div class="clear blank60"></div>
    <div id="carousel4">
		<ul>
              <li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495689338378&di=99a082cec1e65a7838b5b152dedfb61b&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2%2F57b42f07d99e4.jpg) no-repeat; background-size:cover;"></li>
              <li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495606622812&di=28303547db3d93c5da444b901baccb13&imgtype=0&src=http%3A%2F%2Fwww.bz55.com%2Fuploads%2Fallimg%2F150417%2F139-15041G02610.jpg) no-repeat; background-size:cover;"></li>
              <li style="background:url(https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495689362423&di=cadfe8369e66ffef5f8af97260f1c769&imgtype=0&src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F4%2F57b57f23d1069.jpg) no-repeat; background-size:cover;"></li>
        </ul>
	</div>

    <!-----------------carousel---------------------->
    <div class="name"><h1>选项卡 <span>.tab</span><i class="line"></i></h1></div>
    <div class="info">
    	<h4>属性设置说明</h4>
        <p>
        	<strong>tabName</strong>触发对象；<br />
            <strong>boxName</strong>容器对象；<br />
            <strong>tabEvent</strong>click、hover、mousedown、dblclick...;<br />
            <strong>type</strong>支持normal、fade；normal：普通的显示隐藏，fade：淡入淡出<br />            
            
        </p>
    </div>
	
	
    <div class="tabMain">
        
        <div class="myTab">
            <div class="tab">
                <ul>
                    <li class="tabName">选项卡一</li>
                    <li class="tabName">选项卡二</li>
                    <li class="tabName">选项卡三</li>
                </ul>
            </div>
            
            <div class="tabBox">
                <div class="box">
                1
                </div>
                <div class="box">
                2
                </div>
                <div class="box">
                3
                </div>
            </div>
        </div>
        
    
        <div class="myTab">
            <div class="tab">
                <ul>
                    <li class="tabName">选项卡一</li>
                    <li class="tabName">选项卡二</li>
                    <li class="tabName">选项卡三</li>
                </ul>
            </div>
            
            <div class="tabBox">
                <div class="box">
                1
                </div>
                <div class="box">
                2
                </div>
                <div class="box">
                3
                </div>
            </div>
        </div>
    
        
        <div class="clear blank60"></div>
        
	</div>
    
    <div class="fadeTab" style="width:60%">
        <div class="tab">
            <ul>
                <li class="tabName">选项卡一</li>
                <li class="tabName">选项卡二</li>
                <li class="tabName">选项卡三</li>
                <li class="tabName">选项卡四</li>
            </ul>
        </div>
        
        <div class="tabBox">
            <div class="box">
            1
            </div>
            <div class="box">
            2
            </div>
            <div class="box">
            3
            </div>
            <div class="box">
            4
            </div>
        </div>
        
    </div>
    <!-----------------tab---------------------->




    <!-----------------accordion---------------------->
	
    <div class="name"><h1>动态嵌套 <span>.nesting</span><i class="line"></i></h1></div>
    <div class="info">
    	<h4>属性设置说明</h4>
        <p>
        	<strong>tagName</strong>被嵌套标签名称；<br />
            <strong>nestedName</strong>嵌套容器名称；<br />
            <strong>loopNum</strong>嵌套数量<br />
            
        </p>
        <p>
        	以下示例，每3个span 动态添加一个外层div
        </p>
    </div>
    
    
    <style>
		#text .classname{width:300px; padding:30px; background:#f5f5f5; margin-bottom:30px;}
	</style>
    
   <div id="text">
   		<span>1</span>
        <span>2</span>
        <span>3</span>
        <span>4</span>
        <span>5</span>
        <span>6</span>
        <span>7</span>
        <span>7</span>
   </div>
    
    
 
 
     <!-----------------accordion---------------------->
	
    <div class="name"><h1>宽高比 <span>.aspectRatio</span><i class="line"></i></h1></div>
    <div class="info">
    	<h4>属性设置说明</h4>
        <p>
        	<strong>set</strong>比例值；<br />
            
        </p>
    </div>
	<style>
		.proportion{width:20%;background:#59c3de;}
	</style>
    
    <div class="proportion">
    </div>
    <div class="proportion" style="width:60%;background:#ccc;">
    </div>
    
    
</div>    
 


 
    
	<script src="/ks_inc/kesion.assembly.js" type="text/javascript"></script>	    
	
    <script>
   		$('#carousel').carousel({
				object:'li',
				scrollType:'slide',
				width:'60%',
				height:'50%',
				arrow:true,
				autoPlay:true,
				dots:1,
				speed:400,
				interval:3000
		});
		
   		$('#carousel2').carousel({
				object:'li',
				scrollType:'fade',
				width:'600',
				height:'50%',
				autoPlay:true,
				dots:1,
				speed:400,
				interval:3000
		});
		
   		$('#carousel3').carousel({
				object:'li',
				scrollType:'slide',
				axis:'Y',
				width:'60%',
				height:'100%',
				objectHeight:'50%',//特殊情况，可不设置。 设置百分比的情况下，objectWidth=width×（objectWidth/100）
				arrow:true,
				autoPlay:true,
				speed:400,
				interval:3000
		});
		

   		$('#carousel4').carousel({
				object:'li',
				scrollType:'slide',
				axis:'X',
				width:'70%',
				height:'300',
				objectWidth:'50%',//特殊情况，可不设置。 设置百分比的情况下，objectWidth=width×（objectWidth/100）
				dots:1,
				arrow:true,
				autoPlay:true,
				speed:400,
				interval:3000
		});

  		
		$('.myTab').tab({
			tabName:'.tabName',
			boxName:'.box',			
		});
		
		$('.fadeTab').tab({
			tabName:'.tabName',
			boxName:'.box',
			tabEvent:'hover',//click hover mousedown dblclick...
			type:'fade',
			
		});

		$('#text').nesting({
			tagName:'span',
			nestedName:'div,classname',
			loopNum:3,
		});
		
		
		$('.proportion').aspectRatio({
			set:0.6,
		});
		
		
    </script>


    
    
    
    


</body>
</html>






