package org.kosta.alone.model.service;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.GenericMemberDAO;
import org.kosta.alone.model.dao.MemberDAO;
import org.kosta.alone.model.vo.GenericMemberVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private GenericMemberDAO genericMemberDAO;
/*	private CompanyMemberDAO companyMemberDAO;*/
	
	@Override
	@Transactional
	public void registerMember(GenericMemberVO vo){
		memberDAO.registerMember(vo);  //pk 넣어주고
		genericMemberDAO.registerMember(vo); //fk로 pk가져왔으니깐 상관없음
	}
	/*	public void registerMember(CompanyMemberVO vo){
	companyMemberDAO.registerMember(vo);
	}*/
}
