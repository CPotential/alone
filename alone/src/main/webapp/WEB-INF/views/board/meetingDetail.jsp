<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<form class="form-horizontal">
	<fieldset>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-2 control-label" for="textinput"></label>
			<div class="col-md-3">
				<input id="textinput" name="textinput" type="text" value="${meetingVO.title}" placeholder="제목" class="form-control input-md">
			</div>
			<div class="col-md-2">
				<input id="textinput" name="textinput" type="text" placeholder="작성자" value="${meetingVO.memberVO.nickName}"
					class="form-control input-md">
			</div>
			<div class="col-md-2">
				<input id="textinput" name="textinput" type="text" placeholder="작성일" value="${meetingVO.timePosted}" class="form-control input-md">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label" for="textinput"></label>

			<div class="col-md-2">
				<input id="textinput" name="textinput" type="text" placeholder="지역" value="${meetingVO.region}" class="form-control input-md">
			</div>
			<div class="col-md-2">
				<input id="textinput" name="textinput" type="text" placeholder="관심사항" value="${meetingVO.interest}" class="form-control input-md">
			</div>
			<div class="col-md-2">
				<input id="textinput" name="textinput" type="text" placeholder="조회수" value="${meetingVO.hits}" class="form-control input-md">
			</div>
		</div>

		<!-- Textarea -->
		<div class="form-group">
			<label class="col-md-2 control-label" for="textarea"></label>
			<div class="col-md-8">
				<textarea class="form-control" id="textarea" name="textarea">${meetingVO.content}</textarea>
			</div>
		</div>

		<!-- Button (Double) -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="button1id"></label>
			<div class="col-md-8">
				<button id="button1id" name="button1id" class="btn btn-success">글목록 가기</button>
			</div>
		</div>

	</fieldset>
</form>
