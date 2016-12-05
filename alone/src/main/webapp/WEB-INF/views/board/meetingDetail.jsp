<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


		 <div class="container">
    <div class="row">
      <div class="col-md-4">
        <a href="#"><span class="badge">No. 01</span></a>
        <a href="#"><span class="badge">조회수 : ${meetingVO.hits}</span></a>
        <a href="#"><span class="badge">날짜 : ${meetingVO.timePosted}</span></a>
      </div>
      <div class="nav nav-pills col-md-8 pull-right" role="tablist">
        <li role="presentation" class="pull-right"><a href="#">지역 : ${meetingVO.region}</a></li>
        <li role="presentation" class="pull-right"><a href="#">관심사항 : ${meetingVO.interest}</a></li>
        <li role="presentation" class="pull-right"><a href="#">작성자 : ${meetingVO.memberVO.nickName}</a></li>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="well well">${meetingVO.title}</div>
        <div class="panel-body">
          <table>
            <tr>
              <td>${meetingVO.content}
              </td>
            </tr>
          </table>
        </div>
        <div class="panel-footer">
        
          <div class="container">
          <div class = "row">
         
          <div class="btn-group btn-group-justified">
            <a href="#" class="btn btn-default">목 록</a>
            <a href="#" class="btn btn-default">수 정</a>
            <a href="#" class="btn btn-default">삭 제</a>
            </div>
            </div>

        </div>
      </div>
    </div>
    </div>
       
       
       

