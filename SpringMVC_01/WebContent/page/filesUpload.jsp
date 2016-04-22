<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>文件上传</title>
<link rel="stylesheet" type="text/css" href="main.css" />
<script type="text/javascript" src="jquery-1.7.1.min.js"></script>
</head>
<body>
	<h2>上传多个文件 实例</h2>

	<form action="/SpringMVC_01/filesUpload.html" method="post"
		enctype="multipart/form-data">
		<p>
			选择文件:<input type="file" name="files">
		<p>
			选择文件:<input type="file" name="files">
		<p>
			选择文件:<input type="file" name="files">
		<p>
			<input type="submit" value="提交">
	</form>
	
	<form action="/SpringMVC_01/filesUpload.html" method="post" enctype="multipart/form-data">
		<div class="form_item">上传图片：</div>
        <div class="form_input">
     		<div class="img_upload fl pr">
            	<div>选择图片上传</div>
                <input type="file" name="files" id='upload_img' class="upload po" multiple='true'>
            </div>

        	<div class="img_list fl" id="img_list"></div>
        </div>
        <input type="submit" value="提交">
	</form>
	<script type="text/javascript">
		$(function(){
			var formdata = new FormData();
		    $("#upload_img").on("change", function(){
		        var files = !!this.files ? this.files : [];
		        if (!files.length || !window.FileReader) return;
		        for(var i=0;i<files.length;i++){
		            if (/^image/.test(files[i].type)){
		                var reader = new FileReader();
		                reader.readAsDataURL(files[i]);
		                formdata.append("img[]", files[i]);
		                reader.onloadend = function(){
	                   		$('#img_list').append("<div class='p_list fl pr'><img src='" + this.result + "'><span class='p_close po dk'></span></div>");
		                    $(".p_close").click(function(event) {
		                  		$(this).parent().remove();
		                	});
		                }
		            }
		        }
		    });
		})
	</script>
</body>
</html>