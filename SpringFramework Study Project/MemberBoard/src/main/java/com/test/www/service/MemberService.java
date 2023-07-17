package com.test.www.service;

import com.test.www.dto.MemberDTO;
import com.test.www.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;

    public List<MemberDTO> list() {
        return memberRepository.list();
    }

    public void insert(MemberDTO memberDTO) {
        memberRepository.insert(memberDTO);
    }

    public MemberDTO detail(int memberNum) {
        return memberRepository.detail(memberNum);
    }

    public int delete(int memberNum) {
        return memberRepository.delete(memberNum);
    }

    public int update(MemberDTO memberDTO) {
        return memberRepository.update(memberDTO);
    }
}
