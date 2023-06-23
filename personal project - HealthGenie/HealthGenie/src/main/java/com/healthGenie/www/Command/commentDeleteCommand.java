package com.healthGenie.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.healthGenie.www.DAO.postDAO;

public class commentDeleteCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		postDAO dao = postDAO.getPostDAO();
		int result = dao.deleteCommentDAO(commentNum);
		request.setAttribute("result", result);
		if(result < 0) {
			request.setAttribute("error", "댓글 삭제에 실패하였습니다. 다시 시도해주세요."); // 오류 메시지 설정
			request.getRequestDispatcher("error.jsp").forward(request, response); // error.jsp로 이동
		}
	}
	
}
