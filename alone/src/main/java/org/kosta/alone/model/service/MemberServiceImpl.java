package org.kosta.alone.model.service;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.CommonMemberDAO;
import org.kosta.alone.model.vo.MemberVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Resource
	private CommonMemberDAO commonMemberDAO;
	

	@Override
	public MemberVO memberLogin(MemberVO memberVO) {
		
		memberVO = commonMemberDAO.memberLogin(memberVO);
		
		if(memberVO.getAuthority().equals("ROLE_COMPANY")){
			memberVO= commonMemberDAO.adminApproval(memberVO);
		}
		
		return memberVO;
	}
}
