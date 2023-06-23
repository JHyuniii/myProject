package com.healthGenie.www.FrontController;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.Command.Command;
import com.healthGenie.www.Command.bodyInfoDeleteCommand;
import com.healthGenie.www.Command.bodyInfoSettingCommand;
import com.healthGenie.www.Command.bodyInfoViewCommand;
import com.healthGenie.www.Command.commentCommand;
import com.healthGenie.www.Command.commentDeleteCommand;
import com.healthGenie.www.Command.commentReportCommand;
import com.healthGenie.www.Command.communityCommand;
import com.healthGenie.www.Command.findIdCommand;
import com.healthGenie.www.Command.findPasswordCommand;
import com.healthGenie.www.Command.goalAchievementCommand;
import com.healthGenie.www.Command.goalSettingCommand;
import com.healthGenie.www.Command.goalViewCommand;
import com.healthGenie.www.Command.idCheckCommand;
import com.healthGenie.www.Command.idSuperCheckCommand;
import com.healthGenie.www.Command.interestDeleteCommand;
import com.healthGenie.www.Command.interestListCommand;
import com.healthGenie.www.Command.joinMembershipCommand;
import com.healthGenie.www.Command.loginCommand;
import com.healthGenie.www.Command.logoutCommand;
import com.healthGenie.www.Command.memberDeleteCommand;
import com.healthGenie.www.Command.memberManagementCommand;
import com.healthGenie.www.Command.memberViewCommand;
import com.healthGenie.www.Command.modifyMembershipCommand;
import com.healthGenie.www.Command.modifyMembershipOKCommand;
import com.healthGenie.www.Command.myLogCommand;
import com.healthGenie.www.Command.myLogDeleteCommand;
import com.healthGenie.www.Command.myLogListCommand;
import com.healthGenie.www.Command.myLogViewCommand;
import com.healthGenie.www.Command.myLogWriteCommand;
import com.healthGenie.www.Command.myPageCommand;
import com.healthGenie.www.Command.phoneNumberCheckCommand;
import com.healthGenie.www.Command.postDeleteCommand;
import com.healthGenie.www.Command.postReportCommand;
import com.healthGenie.www.Command.postViewCommand;
import com.healthGenie.www.Command.preventGoalViewCommand;
import com.healthGenie.www.Command.qnaAdminListCommand;
import com.healthGenie.www.Command.qnaAdminListViewCommand;
import com.healthGenie.www.Command.qnaMemberListCommand;
import com.healthGenie.www.Command.qnaMemberViewCommand;
import com.healthGenie.www.Command.qnaSendForAdminCommand;
import com.healthGenie.www.Command.qnaSendForMemberCommand;
import com.healthGenie.www.Command.reportDeleteCommand;
import com.healthGenie.www.Command.reportListCommand;
import com.healthGenie.www.Command.reportListMyPageCommand;
import com.healthGenie.www.Command.reportViewCommand;
import com.healthGenie.www.Command.saveExerciseCommand;
import com.healthGenie.www.Command.superAdminIndexCommand;
import com.healthGenie.www.Command.superLoginCommand;
import com.healthGenie.www.Command.todoListCommand;
import com.healthGenie.www.Command.todoListCompletedCommand;
import com.healthGenie.www.Command.todoListShowCommand;
import com.healthGenie.www.Command.writePostCommand;

@WebServlet("*.do")
public class frontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public frontController() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String commandName = request.getServletPath();
		String viewPage = null;
		Command command = null;
		PrintWriter out = null;

		// 아이디 중복체크
		if (commandName.equals("/idCheck.do")) {
			command = new idCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 핸드폰 번호 중복체크
		else if (commandName.equals("/phoneNumberCheck.do")) {
			command = new phoneNumberCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 회원가입
		else if (commandName.equals("/joinMembership.do")) {
			command = new joinMembershipCommand();
			command.excute(request, response);
			viewPage = "Home.jsp";
		}
		// 로그인
		else if (commandName.equals("/login.do")) {
			command = new loginCommand();
			command.excute(request, response);
			viewPage = "myPage.do";
		}
		// 로그아웃
		else if (commandName.equals("/logout.do")) {
			command = new logoutCommand();
			command.excute(request, response);
			viewPage = "Home.jsp";
		}
		// 아이디찾기
		else if (commandName.equals("/findId.do")) {
			command = new findIdCommand();
			command.excute(request, response);
			viewPage = "findPersonal.jsp";
		}
		// 비밀번호 찾기
		else if (commandName.equals("/findPassword.do")) {
			command = new findPasswordCommand();
			command.excute(request, response);
			viewPage = "findPersonal.jsp";
		}
		// 회원 정보 불러오기 (수정용)
		else if (commandName.equals("/modifyMembership.do")) {
			command = new modifyMembershipCommand();
			command.excute(request, response);
			viewPage = "modifyMembership.jsp";
		}
		// 회원 정보 수정
		else if (commandName.equals("/modifyMembershipOK.do")) {
			command = new modifyMembershipOKCommand();
			command.excute(request, response);
			viewPage = "myPage.do";
		}
		// 목표설정
		else if (commandName.equals("/goalSetting.do")) {
			command = new goalSettingCommand();
			command.excute(request, response);
			viewPage = "preventGoalView.do";
		}
		// 목표 달성
		else if (commandName.equals("/goalAchievement.do")) {
			command = new goalAchievementCommand();
			command.excute(request, response);
			viewPage = "goalView.do";
		}
		// 목표 보기
		else if (commandName.equals("/goalView.do")) {
			command = new goalViewCommand();
			command.excute(request, response);
			viewPage = "goalSetting.jsp";
		}
		// 현재 몸 목표 불러오기
		else if (commandName.equals("/preventGoalView.do")) {
			command = new preventGoalViewCommand();
			command.excute(request, response);
			viewPage = "goalSetting.jsp";
		}
		// 오늘의 몸상태 기록
		else if (commandName.equals("/bodyInfoSetting.do")) {
			command = new bodyInfoSettingCommand();
			command.excute(request, response);
			viewPage = "bodyInfoView.do";
		}
		// 몸상태 기록 보기
		else if (commandName.equals("/bodyInfoView.do")) {
			command = new bodyInfoViewCommand();
			command.excute(request, response);
			viewPage = "bodyInfoSetting.jsp";
		}
		// 몸 기록 일괄 삭제
		else if (commandName.equals("/bodyInfoDelete.do")) {
			command = new bodyInfoDeleteCommand();
			command.excute(request, response);
			viewPage = "bodyInfoView.do";
		}
		// 커뮤니티 접속
		else if (commandName.equals("/community.do")) {
			command = new communityCommand();
			command.excute(request, response);
			viewPage = "community.jsp";
		}
		// 커뮤니티 글 쓰기
		else if (commandName.equals("/writePost.do")) {
			command = new writePostCommand();
			command.excute(request, response);
			viewPage = "community.do";
		}
		// 커뮤니티 글 보기
		else if (commandName.equals("/postView.do")) {
			command = new postViewCommand();
			command.excute(request, response);
			viewPage = "postView.jsp";
		}
		// 커뮤니티 댓글달기
		else if (commandName.equals("/comment.do")) {
			command = new commentCommand();
			command.excute(request, response);
			viewPage = "postView.do";
		}
		// 커뮤니티 글 삭제하기
		else if (commandName.equals("/postDelete.do")) {
			command = new postDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 커뮤니티 댓글 삭제하기
		else if (commandName.equals("/commentDelete.do")) {
			command = new commentDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 개인 운동일지
		else if (commandName.equals("/myLog.do")) {
			command = new myLogCommand();
			command.excute(request, response);
			viewPage = "myLogList.do";
		}
		// 개인 운동일지 작성
		else if (commandName.equals("/myLogWrite.do")) {
			command = new myLogWriteCommand();
			command.excute(request, response);
			viewPage = "myLog.do";
		}
		// 개인 운동일지 불러오기
		else if (commandName.equals("/myLogList.do")) {
			command = new myLogListCommand();
			command.excute(request, response);
			viewPage = "myLog.jsp";
		}
		// 개인 운동일지 상세 보기
		else if (commandName.equals("/myLogView.do")) {
			command = new myLogViewCommand();
			command.excute(request, response);
			viewPage = "myLogView.jsp";
		}
		// 개인 운동일지 삭제하기
		else if (commandName.equals("/myLogDelete.do")) {
			command = new myLogDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 운동 관심 목록 저장
		else if (commandName.equals("/saveExercise.do")) {
			command = new saveExerciseCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 운동 관심목록 불러오기
		else if (commandName.equals("/interestList.do")) {
			command = new interestListCommand();
			command.excute(request, response);
			viewPage = "interestList.jsp";
		}
		// 관심목록 삭제하기
		else if (commandName.equals("/interestDelete.do")) {
			command = new interestDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 마이페이지 접속
		else if (commandName.equals("/myPage.do")) {
			command = new myPageCommand();
			command.excute(request, response);
			viewPage = "myPage.jsp";
		}
		// 투두리스트
//		else if(commandName.equals("/todoList.do")) {
//			command = new todoListCommand();
//			command.excute(request, response);
//			viewPage = "todoList.jsp";
//		}
		// 투두리스트 계획 설정
		else if (commandName.equals("/todoList.do")) {
			command = new todoListCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 투드리스트 설정했던 계획 확인
		else if (commandName.equals("/todoListShow.do")) {
			command = new todoListShowCommand();
			command.excute(request, response);
			viewPage = "todoList.jsp";
		}
		// 투드리스트 계획 달성
		else if (commandName.equals("/todoListCompleted.do")) {
			command = new todoListCompletedCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 관리자 아이디 확인
		else if (commandName.equals("/idSuperCheck.do")) {
			command = new idSuperCheckCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 관리자 로그인
		else if (commandName.equals("/superLogin.do")) {
			command = new superLoginCommand();
			command.excute(request, response);
			viewPage = "superAdminIndex.do";
		}
		// 관리자 페이지 접속
		else if (commandName.equals("/superAdminIndex.do")) {
			command = new superAdminIndexCommand();
			command.excute(request, response);
			viewPage = "superAdminIndex.jsp";
		}
		// 관리자 - 회원 관리 페이지 로드
		else if (commandName.equals("/memberManagement.do")) {
			command = new memberManagementCommand();
			command.excute(request, response);
			viewPage = "memberManagement.jsp";
		}
		// 관리자 - 회원관리 상세 보기
		else if (commandName.equals("/memberView.do")) {
			command = new memberViewCommand();
			command.excute(request, response);
			viewPage = "memberView.jsp";
		}
		// 관리자 - 회원 삭제
		else if (commandName.equals("/memberDelete.do")) {
			command = new memberDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 문의 목록 조회 (관리자)
		else if (commandName.equals("/qnaAdminList.do")) {
			command = new qnaAdminListCommand();
			command.excute(request, response);
			viewPage = "qnaAdminList.jsp";
		}
		// 문의 목록 상세 조회 (관리자)
		else if (commandName.equals("/qnaAdminListView.do")) {
			command = new qnaAdminListViewCommand();
			command.excute(request, response);
			viewPage = "qnaAdminListView.jsp";
		}
		// 문의 답변 작성 (관리자)
		else if (commandName.equals("/qnaSendForMember.do")) {
			command = new qnaSendForMemberCommand();
			command.excute(request, response);
			viewPage = "qnaAdminList.do";
		}
		// 문의 작성 (사용자 -> 관리자)
		else if (commandName.equals("/qnaSendForAdmin.do")) {
			command = new qnaSendForAdminCommand();
			command.excute(request, response);
			viewPage = "Home.jsp";
		}
		// 문의 목록 조회 (사용자)
		else if (commandName.equals("/qnaMemberList.do")) {
			command = new qnaMemberListCommand();
			command.excute(request, response);
			viewPage = "qnaMemberList.jsp";
		}
		// 문의 목록 상세 조회 (사용자)
		else if (commandName.equals("/qnaMemberView.do")) {
			command = new qnaMemberViewCommand();
			command.excute(request, response);
			viewPage = "qnaMemberViewModal.jsp";
		}
		// 게시물 신고 접수
		else if (commandName.equals("/postReport.do")) {
			command = new postReportCommand();
			command.excute(request, response);
			viewPage = "postView.do";
		}
		// 댓글 신고 접수
		else if (commandName.equals("/commentReport.do")) {
			command = new commentReportCommand();
			command.excute(request, response);
			viewPage = "postView.do";
		}
		// 신고 목록 불러오기 (관리자)
		else if (commandName.equals("/reportList.do")) {
			command = new reportListCommand();
			command.excute(request, response);
			viewPage = "reportList.jsp";
		}
		// 신고 목록 불러오기 (관리자)
		else if (commandName.equals("/reportList.do")) {
			command = new reportListCommand();
			command.excute(request, response);
			viewPage = "reportList.jsp";
		}
		// 신고 내용 상세 보기(관리자)
		else if (commandName.equals("/reportView.do")) {
			command = new reportViewCommand();
			command.excute(request, response);
			viewPage = "reportView.jsp";
		}
		// 신고 처리하기 (관리자)
		else if (commandName.equals("/reportDelete.do")) {
			command = new reportDeleteCommand();
			command.excute(request, response);
			out = response.getWriter();
			out.write(request.getAttribute("result") + "");
		}
		// 신고 당한 목록 보기 (회원이 본인 페이지에서)
		else if (commandName.equals("/reportListMyPage.do")) {
			command = new reportListMyPageCommand();
			command.excute(request, response);
			viewPage = "reportListMyPage.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		if (dispatcher == null) {
			request.getRequestDispatcher("Home.jsp");
		} else {
			dispatcher.forward(request, response);
		}
	}
}
