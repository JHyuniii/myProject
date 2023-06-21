package com.healthCare.www.FrontController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthCare.www.Command.Command;
import com.healthCare.www.Command.bodyInfoDeleteCommand;
import com.healthCare.www.Command.bodyInfoSettingCommand;
import com.healthCare.www.Command.bodyInfoViewCommand;
import com.healthCare.www.Command.commentCommand;
import com.healthCare.www.Command.commentDeleteCommand;
import com.healthCare.www.Command.commentReportCommand;
import com.healthCare.www.Command.communityCommand;
import com.healthCare.www.Command.writePostCommand;
import com.healthCare.www.Command.findIdCommand;
import com.healthCare.www.Command.findPasswordCommand;
import com.healthCare.www.Command.goalAchievementCommand;
import com.healthCare.www.Command.goalSettingCommand;
import com.healthCare.www.Command.goalViewCommand;
import com.healthCare.www.Command.idCheckCommand;
import com.healthCare.www.Command.idSuperCheckCommand;
import com.healthCare.www.Command.interestDeleteCommand;
import com.healthCare.www.Command.interestListCommand;
import com.healthCare.www.Command.joinMembershipCommand;
import com.healthCare.www.Command.loginCommand;
import com.healthCare.www.Command.logoutCommand;
import com.healthCare.www.Command.memberDeleteCommand;
import com.healthCare.www.Command.memberManagementCommand;
import com.healthCare.www.Command.memberViewCommand;
import com.healthCare.www.Command.modifyMembershipCommand;
import com.healthCare.www.Command.modifyMembershipOKCommand;
import com.healthCare.www.Command.myLogCommand;
import com.healthCare.www.Command.myLogDeleteCommand;
import com.healthCare.www.Command.myLogListCommand;
import com.healthCare.www.Command.myLogViewCommand;
import com.healthCare.www.Command.myLogWriteCommand;
import com.healthCare.www.Command.myPageCommand;
import com.healthCare.www.Command.phoneNumberCheckCommand;
import com.healthCare.www.Command.postDeleteCommand;
import com.healthCare.www.Command.postReportCommand;
import com.healthCare.www.Command.postViewCommand;
import com.healthCare.www.Command.preventGoalViewCommand;
import com.healthCare.www.Command.qnaAdminListCommand;
import com.healthCare.www.Command.qnaAdminListViewCommand;
import com.healthCare.www.Command.qnaMemberListCommand;
import com.healthCare.www.Command.qnaMemberViewCommand;
import com.healthCare.www.Command.qnaSendForAdminCommand;
import com.healthCare.www.Command.qnaSendForMemberCommand;
import com.healthCare.www.Command.reportDeleteCommand;
import com.healthCare.www.Command.reportListCommand;
import com.healthCare.www.Command.reportListMyPageCommand;
import com.healthCare.www.Command.reportViewCommand;
import com.healthCare.www.Command.saveExerciseCommand;
import com.healthCare.www.Command.superAdminIndexCommand;
import com.healthCare.www.Command.superLoginCommand;
import com.healthCare.www.Command.todoListCommand;
import com.healthCare.www.Command.todoListCompletedCommand;
import com.healthCare.www.Command.todoListShowCommand;

@WebServlet("*.do")
public class frontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public frontController() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String commandName = request.getServletPath();
		String viewPage = null;
		Command command = null;
		PrintWriter out = null;
		
		//아이디 중복체크
		if(commandName.equals("/idCheck.do")) {
			command = new idCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//핸드폰 번호 중복체크
		else if(commandName.equals("/phoneNumberCheck.do")) {
			command = new phoneNumberCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//회원가입
		else if(commandName.equals("/joinMembership.do")) {
			command = new joinMembershipCommand();
			command.excute(request, response);
			viewPage = "Home.jsp";
		}
		//로그인
		else if(commandName.equals("/login.do")) {
			command = new loginCommand();
			command.excute(request, response);
			viewPage = "myPage.do";
		}
		//목표설정
		else if(commandName.equals("/goalSetting.do")) {
			command = new goalSettingCommand();
			command.excute(request, response);
			viewPage = "preventGoalView.do";
		}
		//아이디찾기
		else if(commandName.equals("/findId.do")) {
			command = new findIdCommand();
			command.excute(request, response);
			viewPage = "findPersonal.jsp";
		}
		//비밀번호 찾기
		else if(commandName.equals("/findPassword.do")) {
			command = new findPasswordCommand();
			command.excute(request, response);
			viewPage = "findPersonal.jsp";
		}
		//로그아웃
		else if(commandName.equals("/logout.do")) {
			command = new logoutCommand();
			command.excute(request, response);
			viewPage = "Home.jsp";
		}
		//목표 달성
		else if(commandName.equals("/goalAchievement.do")) {
			command = new goalAchievementCommand();
			command.excute(request, response);
			viewPage = "goalView.do";
		}
		//목표 보기
		else if(commandName.equals("/goalView.do")) {
			command = new goalViewCommand();
			command.excute(request, response);
			viewPage = "goalSetting.jsp";
		}
		//오늘의 몸상태 기록
		else if(commandName.equals("/bodyInfoSetting.do")) {
			command = new bodyInfoSettingCommand();
			command.excute(request, response);
			viewPage = "bodyInfoView.do";
		}
		//몸상태 히스토리 보기
		else if(commandName.equals("/bodyInfoView.do")) {
			command = new bodyInfoViewCommand();
			command.excute(request, response);
			viewPage = "bodyInfoSetting.jsp";
		}
		//커뮤니티
		else if(commandName.equals("/community.do")) {
			command = new communityCommand();
			command.excute(request, response);
			viewPage = "community.jsp";
		}
		//커뮤니티 글 쓰기
		else if(commandName.equals("/writePost.do")) {
			command = new writePostCommand();
			command.excute(request, response);
			viewPage = "community.do";
		}
		//커뮤니티 글 보기
		else if(commandName.equals("/postView.do")) {
			command = new postViewCommand();
			command.excute(request, response);
			viewPage = "postView.jsp";
		}
		//댓글달기
		else if(commandName.equals("/comment.do")) {
			command = new commentCommand();
			command.excute(request, response);
			viewPage = "postView.do";
		}
		//투두리스트
		else if(commandName.equals("/todoList.do")) {
			command = new todoListCommand();
			command.excute(request, response);
			viewPage = "todoList.jsp";
		}
		//운동일지
		else if(commandName.equals("/myLog.do")) {
			command = new myLogCommand();
			command.excute(request, response);
			viewPage = "myLogList.do";
		}
		//운동일지 작성
		else if(commandName.equals("/myLogWrite.do")) {
			command = new myLogWriteCommand();
			command.excute(request, response);
			viewPage = "myLog.do";
		}
		//운동일지 불러오기
		else if(commandName.equals("/myLogList.do")) {
			command = new myLogListCommand();
			command.excute(request, response);
			viewPage = "myLog.jsp";
		}
		//운동일지 보기
		else if(commandName.equals("/myLogView.do")) {
			command = new myLogViewCommand();
			command.excute(request, response);
			viewPage = "myLogView.jsp";
		}
		//몸 기록 삭제
		else if(commandName.equals("/bodyInfoDelete.do")) {
			command = new bodyInfoDeleteCommand();
			command.excute(request, response);
			viewPage = "bodyInfoView.do";
		}
		//운동 관심 목록 저장
		else if(commandName.equals("/saveExercise.do")) {
			command = new saveExerciseCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//현재 몸 목표 불러오기
		else if(commandName.equals("/preventGoalView.do")) {
			command = new preventGoalViewCommand();
			command.excute(request, response);
			viewPage = "goalSetting.jsp";
		}
		//관심목록 불러오기
		else if(commandName.equals("/interestList.do")) {
			command = new interestListCommand();
			command.excute(request, response);
			viewPage = "interestList.jsp";
		}
		//myPage.do
		else if(commandName.equals("/myPage.do")) {
			command = new myPageCommand();
			command.excute(request, response);
			viewPage = "myPage.jsp";
		}
		//todoList.do
		else if(commandName.equals("/todoList.do")) {
			command = new todoListCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//todoListShow.do
		else if(commandName.equals("/todoListShow.do")) {
			command = new todoListShowCommand();
			command.excute(request, response);
			viewPage = "todoList.jsp";
		}
		//todoListCompleted.do
		else if(commandName.equals("/todoListCompleted.do")) {
			command = new todoListCompletedCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//관리자 로그인 확인
		else if(commandName.equals("/idSuperCheck.do")) {
			command = new idSuperCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//관리자 로그인
		else if(commandName.equals("/superLogin.do")) {
			command = new superLoginCommand();
			command.excute(request, response);
			viewPage = "superAdminIndex.do";
		}
		//관리자 인덱스 페이지 로드
		else if(commandName.equals("/superAdminIndex.do")) {
			command = new superAdminIndexCommand();
			command.excute(request, response);
			viewPage = "superAdminIndex.jsp";
		}
		//관리자 - 회원 관리 페이지 로드
		else if(commandName.equals("/memberManagement.do")) {
			command = new memberManagementCommand();
			command.excute(request, response);
			viewPage = "memberManagement.jsp";
		}
		//관리자 - 회원관리 상세 보기
		else if(commandName.equals("/memberView.do")) {
	         command = new memberViewCommand();
	         command.excute(request, response);
	         viewPage = "memberView.jsp";
		}
		//관리자 - 회원 삭제
		else if(commandName.equals("/memberDelete.do")) {
			command = new memberDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//문의 작성 (사용자 -> 관리자)
		else if(commandName.equals("/qnaSendForAdmin.do")) {
			command = new qnaSendForAdminCommand();
			command.excute(request, response);
			viewPage = "Home.jsp";
		}
		//문의 목록 조회 (사용자)
		else if(commandName.equals("/qnaMemberList.do")) {
			command = new qnaMemberListCommand();
			command.excute(request, response);
			viewPage = "qnaMemberList.jsp";
		}
		//문의 목록 상세 조회 (사용자)
		else if(commandName.equals("/qnaMemberView.do")) {
			command = new qnaMemberViewCommand();
			command.excute(request, response);
			viewPage = "qnaMemberViewModal.jsp";
		}
		//문의 목록 조회 (관리자)
		else if(commandName.equals("/qnaAdminList.do")) {
			command = new qnaAdminListCommand();
			command.excute(request, response);
			viewPage = "qnaAdminList.jsp";
		}
		//문의 목록 상세 조회 (관리자)
		else if(commandName.equals("/qnaAdminListView.do")) {
			command = new qnaAdminListViewCommand();
			command.excute(request, response);
			viewPage = "qnaAdminListView.jsp";
		}
		//문의 답변 작성 (관리자)
		else if(commandName.equals("/qnaSendForMember.do")) {
			command = new qnaSendForMemberCommand();
			command.excute(request, response);
			viewPage = "qnaAdminList.do";
		}
		//게시물 신고 접수
		else if(commandName.equals("/postReport.do")) {
			command = new postReportCommand();
			command.excute(request, response);
			viewPage = "postView.do";
		}
		//댓글 신고 접수
		else if(commandName.equals("/commentReport.do")) {
			command = new commentReportCommand();
			command.excute(request, response);
			viewPage = "postView.do";
		}
		//신고 목록 불러오기 (관리자)
		else if(commandName.equals("/reportList.do")) {
			command = new reportListCommand();
			command.excute(request, response);
			viewPage = "reportList.jsp";
		}
		//신고 목록 불러오기 (관리자)
		else if(commandName.equals("/reportList.do")) {
			command = new reportListCommand();
			command.excute(request, response);
			viewPage = "reportList.jsp";
		}
		//신고 내용 상세 보기(관리자)
		else if(commandName.equals("/reportView.do")) {
			command = new reportViewCommand();
			command.excute(request, response);
			viewPage = "reportView.jsp";
		}
		//신고 처리하기 (관리자)
		else if(commandName.equals("/reportDelete.do")) {
			command = new reportDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//신고 당한 목록 보기 (회원이 본인 페이지에서)
		else if(commandName.equals("/reportListMyPage.do")) {
			command = new reportListMyPageCommand();
			command.excute(request, response);
			viewPage = "reportListMyPage.jsp";
		}
		//커뮤니티 글 삭제하기
		else if(commandName.equals("/postDelete.do")) {
			command = new postDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//일지 삭제하기
		else if(commandName.equals("/myLogDelete.do")) {
			command = new myLogDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//댓글 삭제하기
		else if(commandName.equals("/commentDelete.do")) {
			command = new commentDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//관심목록 삭제하기
		else if(commandName.equals("/interestDelete.do")) {
			command = new interestDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		//회원 정보 불러오기 (수정용)
		else if(commandName.equals("/modifyMembership.do")) {
			command = new modifyMembershipCommand();
			command.excute(request, response);
			viewPage = "modifyMembership.jsp";
		}
		//회원 정보 수정
		else if(commandName.equals("/modifyMembershipOK.do")) {
			command = new modifyMembershipOKCommand();
			command.excute(request, response);
			viewPage = "myPage.do";
		}
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		if(dispatcher == null) {
			request.getRequestDispatcher("Home.jsp");
		} else {
			dispatcher.forward(request, response);
		}
	}
}
