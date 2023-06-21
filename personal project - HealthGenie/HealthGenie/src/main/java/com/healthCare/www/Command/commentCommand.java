package com.healthCare.www.Command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.healthCare.www.DAO.postDAO;
import com.healthCare.www.DTO.commentDTO;

public class commentCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		postDAO dao = postDAO.getPostDAO();
		commentDTO dto = new commentDTO();
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("id");
		int postNum = Integer.parseInt(request.getParameter("postNum"));
		String commentContent = request.getParameter("commentContent");
		
		dto.setUserId(userId);
		dto.setPostNum(postNum);
		dto.setCommentContent(commentContent);
		
		int result = dao.comment(dto);
		if(result < 0) {
			request.setAttribute("error", "댓글 작성에 실패하였습니다. 다시 시도해주세요."); // 오류 메시지 설정
			request.getRequestDispatcher("error.jsp").forward(request, response); // error.jsp로 이동
		}
	}
	
}
