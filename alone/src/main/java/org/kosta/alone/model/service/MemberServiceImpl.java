package org.kosta.alone.model.service;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.CommonMemberDAO;
import org.kosta.alone.model.dao.CompanyMemberDAO;
import org.kosta.alone.model.dao.GenericMemberDAO;
import org.kosta.alone.model.dao.MemberDAO;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private GenericMemberDAO genericMemberDAO;
	@Resource
	private CommonMemberDAO commonMemberDAO;
	@Resource
    private CompanyMemberDAO companyMemberDAO;
	
	
	@Override
	public MemberVO memberLogin(MemberVO memberVO) {

		
		memberVO = commonMemberDAO.memberLogin(memberVO);
		//아이디 패스워드 확인
		
		if(memberVO.getAuthority().equals("ROLE_COMPANY")){
			return commonMemberDAO.adminApproval(memberVO);
			//관리자가 기업 승인 여부 확인해야한다.
			//기업회원일 경우 기업회원의 정보를리턴해준다
		}
		return memberVO;
	}

	
	public int idcheck(String id){
		return memberDAO.idcheck(id);
	}
	
	@Override
	@Transactional
	public void registerMember(GenericMemberVO vo){
		memberDAO.registerMember(vo);  //pk 넣어주고
		genericMemberDAO.registerMember(vo); //fk로 pk가져왔으니깐 상관없음
		vo.setAuthority("ROLE_MEMBER"); //권한 셋팅
		commonMemberDAO.registerAuthority(vo); //권한 DB에 인서트
	}
	
	@Transactional
	public void registerMember(CompanyMemberVO vo){
		memberDAO.registerMember(vo);
		companyMemberDAO.registerMember(vo);
		vo.setAuthority("ROLE_COMPANY"); //권한 셋팅
		commonMemberDAO.registerAuthority(vo); //권한 DB에 인서트
	}


}
