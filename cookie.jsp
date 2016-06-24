<%@ page contentType="text/html; charset=utf-8" language="java"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	
	<title>同意数据授权协议</title>
	
	<%@include file="../style.jsp"%>
    </head>
    <body>
    	<div class="body protolcol">
    		<input id="custId" type="text" value="13293969124">
            <button id="cookieBtn" >设置custId</button>
    	</div>
    	<div class="body protolcol">
    		<input id="netId" type="text" value="68127840801">
            <button id="netBtn" >设置netId</button>
    	</div>
    	<div class="body protolcol">
            <button id="remove" >清除cookie</button>
    	</div>
    	<button id="printBtn" >打印cookie</button>
    	<div class="cookie" id="cookieBox"></div>
    	
      	<a href="index.jsp" class="">返回首页</a>
      	<a href="applyForm.jsp" class="">申请</a>
       	<a href="loan-progress.jsp" class="">进度</a>
        <a href="dataSuccess.jsp" class="">上传成功</a>
        <a href="protolcol.jsp" class="">协议</a>
        <a href="test-browser.html" class="">浏览器</a>
    	<pre>
         {"loanCustId":"13293969124"}   -个月内测算 额度为0
         {"loanCustId":"1329391792231"} 一个月前测算 额度为0
         {"loanCustId":"13293969174"}    -个月内测算 通过 30000元
         {"loanCustId":"13293969332"}   -个月前测算 通过 30000元
         {"loanCustId":"13293969413"}    没有测算记录   
         custId:13292895497 netId:68199964790    国庆
        </pre><br/>
        <button class="amtjson" id="thisAmtBtn">本次额度测算使用json模拟</button>
    	<input type="checkbox" id="amtjson">
        <textarea id="thisAmt" style="height: 180px;width: 400px;">
        {
            "state": 1,
            "msg": "",
            "data": {
                "isJdAdm": 0,
                "jdCreditAmt": 0,
                "jdUnadmReasonCode": "KD005",
                "jdUnadmReason": "额度为0校验不准入"
            }
        }
		</textarea>
        <script>
        Id('cookieBox').innerHTML = document.cookie;
        setCookie('loanCustId', "13293969124", 1);
        setCookie('netId', "68127840801", 1);
        Id("thisAmt");
        function setCookie(c_name,value,expiredays)
        {
	        var exdate=new Date()
	        exdate.setDate(exdate.getDate()+expiredays)
	        document.cookie=c_name+ "=" +escape(value)+
	        ((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
        }
        
        function removeCookie(name){   
            /* -1 天后过期即删除 */   
            setCookie(name, 1, -1);
        }
        
        function Id(selector){
        	return document.getElementById(selector);
        }
        
      	
      	Id('cookieBtn').addEventListener("click", function() {
      		var val = Id('custId').value;
      		setCookie('loanCustId', val, 1);
      	});
      	Id('thisAmtBtn').addEventListener("click", function() {
      		var val = Id("thisAmt").value;
      		setCookie('count', val, 1);
      	});
      	Id('netBtn').addEventListener("click", function() {
      		var val = Id('netId').value;
      		setCookie('netId', val, 1);
      	});
      	Id('amtjson').addEventListener("change", function() {
      		var val = Id('amtjson').checked;
      		if(val) {
      			setCookie('amtjson', '1', 1);
      		}else{
      			setCookie('amtjson', '0', 1);
      		}
      		
      	});
        Id('remove').addEventListener("click", function() {
          removeCookie('loanCustId');
          removeCookie('netId');
        });
      	
        </script>	
 	</body>
</html>