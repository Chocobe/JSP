package com.project_1.biz;

import com.project_1.beans.Member;
import com.project_1.dao.MemberDAO;

public class MemberService {
	MemberDAO dao = new MemberDAO();
	
	public void memberInsert(Member member) {
		dao.insertMember(member);
	}
}
