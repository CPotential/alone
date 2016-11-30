package org.kosta.alone.model.service;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.CommonMemberDAO;
import org.kosta.alone.model.vo.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Resource
	private CommonMemberDAO commonMemberDAO;
	

	@Override
	public MemberVO memberLogin(MemberVO memberVO) {
		
		return commonMemberDAO.memberLogin(memberVO);
	}
	

	

}
