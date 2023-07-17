package com.test.www.controller;

import com.test.www.dto.MemberDTO;
import com.test.www.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member")
public class MemberController {
    private final MemberService memberService;

    @GetMapping("/list")
    public String list(Model model){
        List<MemberDTO> list = memberService.list();
        model.addAttribute("list", list);
        return "list";
    }

    @PostMapping("/insert")
    public String insert(@ModelAttribute MemberDTO memberDTO){
        memberService.insert(memberDTO);
        return "redirect:/member/list";
    }

    @GetMapping("/detail")
    public String detail(@RequestParam("memberNum") int memberNum, Model model){
        MemberDTO memberDTO = memberService.detail(memberNum);
        model.addAttribute("MemberDTO", memberDTO);
        return "detail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("memberNum") int memberNum){
        int deleteResult = memberService.delete(memberNum);
        if(deleteResult > 0){
            return "redirect:/member/list";
        } else {
            return "list";
        }
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("memberNum") int memberNum, Model model){
        MemberDTO memberDTO = memberService.detail(memberNum);
        model.addAttribute("MemberDTO", memberDTO);
        return "update";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO, Model model){
        int updateResult = memberService.update(memberDTO);
        MemberDTO dto = memberService.detail(memberDTO.getMemberNum());
        model.addAttribute("MemberDTO", dto);
        if(updateResult > 0){
            return "detail";
        } else {
            return "update";
        }
    }
}
