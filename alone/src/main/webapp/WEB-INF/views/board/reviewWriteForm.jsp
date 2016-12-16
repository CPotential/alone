<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	var RecaptchaOptions = {
		theme : 'custom',
		custom_theme_widget : 'recaptcha_widget'
	};
</script>
<script type="text/javascript">
	function reviewWrite() {
		var reviewInfo = document.reviewWriteForm;

		if (reviewInfo.title.value == "") {
			alert("제목을 입력하세요");
			return false;
		} else if (reviewInfo.content.value == "") {
			alert("내용을 입력하세요");
			return false;
		}
	}
	function reviewWriteCancel() {
		if (confirm("작성을 취소하시겠습니까?")) {
			location.href = "${pageContext.request.contextPath}/reviewList.do";
		}
	}
</script>
<div class="container">
	<div class="row">
		<div class="col-sm-8">
			<h3 class="header">Review Write</h3>
			<p class="text-muted">회원들이 경험한 내용들을 써주세요</p>
			<form role="form" name="reviewWriteForm"
				action="${pageContext.request.contextPath}/reviewWrite.do"
				onsubmit="return reviewWrite()">
				<div class="form-group">
					<label for="title">Title</label> 
					<input type="text" name="title" class="form-control" id="title" placeholder="title"> 
					<span class="help-block"></span>
				</div>
				<div class="form-group">
					<label for="content">Content</label>
					<textarea cols="20" rows="20" name="content" class="form-control"  id="content" placeholder="content"></textarea>
					 <span class="help-block"></span>  
				</div>
					<button type="submit" class="btn btn-primary">후기글 작성</button>
					<button type="button" class="btn btn-primary" onclick="reviewWriteCancel()">작성 취소</button>
			</form>

		</div>
		</div>
	</div>

