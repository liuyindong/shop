<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="inc/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>文件上传</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<%@include file="inc/head.jsp"%>
</head>
<body>
		<div class="container-fluid">
			
			<h1 class="container muted">文件上传</h1>
			
			<div class="span12">
				<form action="${path}/swfUpload?method=upload" method="post"  enctype="multipart/form-data"  class="form-horizontal">
					<div class="row-fluid" id="spanButtonPlaceHolder"></div>
					<div class="row-fluid">
						<div class="span6">
							<div class="control-group">
								 <label class="control-label">文件队列:</label>
								 <div class="controls" id="tdFilesQueued"></div>
							</div>
							<div class="row-fluid">
								<label class="control-label">上传文件:</label>
								<div class="controls" id="tdFilesUploaded"></div>
							</div>
							<div class="row-fluid">
								<label class="control-label">错误:</label>
								<div class="controls" id="tdErrors"></div>
							</div>
						</div>
						<div class="span6">
							<div class="row-fluid">
								<label class="control-label">速度:</label>
								<div class="controls" id="tdCurrentSpeed"></div>
							</div>
							<div class="row-fluid">
								<label class="control-label">平均速度:</label>
								<div class="controls" id="tdAverageSpeed"></div>
							</div>
							<div class="row-fluid">
								<label class="control-label">上传平均线速度:</label>
								<div class="controls" id="tdMovingAverageSpeed"></div>
							</div>
							<div class="row-fluid">
								<label class="control-label">剩余时间:</label>
								<div class="controls" id="tdTimeRemaining"></div>
							</div>
							<div class="row-fluid">
								<label class="control-label">已用时间:</label>
								<div class="controls" id="tdTimeElapsed"></div>
							</div>
							<div class="row-fluid">
								<label class="control-label">上传进度:</label>
								<div class="controls" id="tdPercentUploaded"></div>
							</div>
							<div class="row-fluid">
								<label class="control-label">上传大小:</label>
								<div class="controls" id="tdSizeUploaded"></div>
							</div>
							<div class="row-fluid">
								<label class="control-label">上传文件计数:</label>
								<div class="controls" id="tdProgressEventCount"></div>
							</div>
						</div>
					</div>
				</form>
			</div>
			
		</div>

	<%@include file="inc/foot.jsp"%>
	
	<script type="text/javascript" src="${path}/js/swfupload/swfupload.js"></script>
	<script type="text/javascript" src="${path}/js/swfupload/swfupload.queue.js"></script>
	<script type="text/javascript" src="${path}/js/swfupload/swfupload.speed.js"></script>
	<script type="text/javascript" src="${path}/js/swfupload/speed/handlers.js"></script>
	
	<script type="text/javascript">
		var swfu;

		window.onload = function() {
			var settings = {
				flash_url : "${path}/js/swfupload/swfupload.swf",
				upload_url: "${path}/swfUpload?method=upload",
				file_size_limit : "",
				file_types : "*.*",
				file_types_description : "All Files",
				file_upload_limit : 100,
				file_queue_limit : 0,

				debug: false,

				button_width: "74",
				button_height: "30",
				button_placeholder_id: "spanButtonPlaceHolder",
				button_text : '<div class="btn btn-primary">上传文件</div>',
				
				moving_average_history_size: 40,
				
				swfupload_preload_handler : preLoad,
				swfupload_load_failed_handler : loadFailed,
				file_queued_handler : fileQueued,
				file_dialog_complete_handler: fileDialogComplete,
				upload_start_handler : uploadStart,
				upload_progress_handler : uploadProgress,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : uploadComplete,
				file_queue_error_handler : fileQueueError,
				
				custom_settings : {
					tdFilesQueued : document.getElementById("tdFilesQueued"),
					tdFilesUploaded : document.getElementById("tdFilesUploaded"),
					tdErrors : document.getElementById("tdErrors"),
					tdCurrentSpeed : document.getElementById("tdCurrentSpeed"),
					tdAverageSpeed : document.getElementById("tdAverageSpeed"),
					tdMovingAverageSpeed : document.getElementById("tdMovingAverageSpeed"),
					tdTimeRemaining : document.getElementById("tdTimeRemaining"),
					tdTimeElapsed : document.getElementById("tdTimeElapsed"),
					tdPercentUploaded : document.getElementById("tdPercentUploaded"),
					tdSizeUploaded : document.getElementById("tdSizeUploaded"),
					tdProgressEventCount : document.getElementById("tdProgressEventCount")
				}
			};

			swfu = new SWFUpload(settings);
	     };
	</script>
</body>
</html>