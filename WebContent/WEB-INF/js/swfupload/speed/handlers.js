/*
 * Demo Note: This demo uses a FileProgress class that handles the UI for
 * displaying the file name and percent complete. The FileProgress class is not
 * part of SWFUpload.
 */

/*******************************************************************************
 * Event Handlers These are my custom event handlers to make my web application
 * behave the way I went when SWFUpload completes different tasks. These aren't
 * part of the SWFUpload package. They are part of my application. Without these
 * none of the actions SWFUpload makes will show up in my application.
 ******************************************************************************/
function preLoad()
{
	if (!this.support.loading)
	{
		return false;
	}
}
function loadFailed()
{
	alert("服务器出现异常请售后再试,或者请联系管理员.");
}

function fileQueued(file)
{
	try
	{
		this.customSettings.tdFilesQueued.innerHTML = this.getStats().files_queued;
	}
	catch (ex)
	{
		this.debug(ex);
	}

}

function fileDialogComplete()
{
	this.startUpload();
}

function uploadStart(file)
{
	try
	{
		this.customSettings.progressCount = 0;
		updateDisplay.call(this, file);
	}
	catch (ex)
	{
		this.debug(ex);
	}

}

function uploadProgress(file, bytesLoaded, bytesTotal)
{
	try
	{
		this.customSettings.progressCount++;
		updateDisplay.call(this, file);
	}
	catch (ex)
	{
		this.debug(ex);
	}

}

function uploadSuccess(file, serverData)
{
	try
	{
		updateDisplay.call(this, file);
	}
	catch (ex)
	{
		this.debug(ex);
	}
}

function uploadComplete(file)
{
	this.customSettings.tdFilesQueued.innerHTML = this.getStats().files_queued;
	this.customSettings.tdFilesUploaded.innerHTML = this.getStats().successful_uploads;
	this.customSettings.tdErrors.innerHTML = this.getStats().upload_errors;

}

function updateDisplay(file)
{
	this.customSettings.tdCurrentSpeed.innerHTML = SWFUpload.speed.formatBPS(file.currentSpeed);
	this.customSettings.tdAverageSpeed.innerHTML = SWFUpload.speed.formatBPS(file.averageSpeed);
	this.customSettings.tdMovingAverageSpeed.innerHTML = SWFUpload.speed.formatBPS(file.movingAverageSpeed);
	this.customSettings.tdTimeRemaining.innerHTML = SWFUpload.speed.formatTime(file.timeRemaining);
	this.customSettings.tdTimeElapsed.innerHTML = SWFUpload.speed.formatTime(file.timeElapsed);
	this.customSettings.tdPercentUploaded.innerHTML = SWFUpload.speed.formatPercent(file.percentUploaded);
	this.customSettings.tdSizeUploaded.innerHTML = SWFUpload.speed.formatBytes(file.sizeUploaded);
	this.customSettings.tdProgressEventCount.innerHTML = this.customSettings.progressCount;

}

function fileQueueError(file, errorCode, message)
{
	try
	{
		if (errorCode === SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED)
		{
			alert("你上传的文件过多.\n" + (message === 0 ? "上传已经达到了上传限制." : "你要删除 " + (message > 1 ? " " + message + " 个文件." : "一个文件.")));
			return;
		}
		switch (errorCode)
		{
			case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
				alert("文件太大");
				this.debug("Error Code: File too big, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
			case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
				alert("文件是零字节或无法访问,不能上传");
				this.debug("Error Code: Zero byte file, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
			case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
				alert("无效的文件类型.");
				this.debug("Error Code: Invalid File Type, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
			default:
				if (file !== null)
				{
					alert("程序异常请稍后再试..");
				}
				this.debug("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		}
	}
	catch (ex)
	{
		this.debug(ex);
	}
}
