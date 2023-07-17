package com.test.www.repository;

import com.test.www.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class MemberRepository {
    private final SqlSessionTemplate sql;

    public List<MemberDTO> list() {
        return sql.selectList("Member.list");
    }

    public void insert(MemberDTO memberDTO) {
        sql.insert("Member.insert", memberDTO);
    }


    public MemberDTO detail(int memberNum) {
        return sql.selectOne("Member.detail", memberNum);
    }

    public int delete(int memberNum) {
        return sql.delete("Member.delete", memberNum);
    }

    public int update(MemberDTO memberDTO) {
        return sql.update("Member.update", memberDTO);
    }
}
