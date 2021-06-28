package com.kh.interactFunding.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Repository;

import com.kh.interactFunding.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate session;
	
	//김윤수
	
	//박요한
		
	//배기원
		
	//이승우
	@Override
	public List<Member> selectMemberList(Map<String, Object> map) {
		int offset = (int)map.get("offset");
		int limit = (int)map.get("limit");
		RowBounds rowBounds = new RowBounds(offset, limit); 
		return session.selectList("admin.selectMemberList", map, rowBounds);
	}

	@Override
	public int selectMemberListTotalContents(Map<String, Object> map) {
		return session.selectOne("admin.selectMemberListTotalContents", map);
	}

	@Override
	public int addAdminRole(int memberNo) {
		return session.insert("admin.addAdminRole",memberNo);
	}

	@Override
	public int removeAdminRole(int memberNo) {
		return session.delete("admin.removeAdminRole",memberNo);
	}

	@Override
	public int selectCheckAdminRole(int memberNo) {
		return session.selectOne("admin.selectCheckAdminRole", memberNo);
	}

	@Override
	public int memberDel(int memberNo) {
		return session.delete("admin.deleteMember", memberNo);
	}
	
	
	
	//천호현
}