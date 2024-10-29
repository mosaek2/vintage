package com.mosaek2.vintage.controller;

import com.mosaek2.vintage.domain.Member;
import com.mosaek2.vintage.dto.RequestJoinDto;
import com.mosaek2.vintage.dto.RequestLoginDto;
import com.mosaek2.vintage.dto.RequestMailDto;
import com.mosaek2.vintage.dto.RequestPhoneDto;
import com.mosaek2.vintage.exception.DuplicatePhoneException;
import com.mosaek2.vintage.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.javassist.bytecode.DuplicateMemberException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberController {
    private MemberService service;

    @Autowired
    public MemberController(MemberService service) {
        this.service = service;
    }

    @PostMapping("/join/mailCheck")
    public boolean joinMailCheck(@RequestBody RequestMailDto mailDto) {
        return service.isUniqueMail(mailDto.getMail());
    }

    @PostMapping("/join/phoneCheck")
    public boolean joinPhoneCheck(@RequestBody RequestPhoneDto phoneDto) {
        return service.isUniquePhone(phoneDto.getPhone());
    }

    @PostMapping("/join/request")
    public ResponseEntity<?> joinRequest(@RequestBody RequestJoinDto joinDto) {
        if (joinDto.getMail() == null || joinDto.getPassword() == null || joinDto.getPhone() == null || joinDto.getName() == null || joinDto.getBirth() == null || joinDto.getSolarYn() == '\u0000' || joinDto.getGender() == null || joinDto.getZip() == null || joinDto.getAddress() == null || joinDto.getAddressDetail() == null || joinDto.getSmsYn() == '\u0000' || joinDto.getMailYn() == '\u0000') {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("필수 정보를 모두 입력해 주세요.");
        }

        Member member = new Member(joinDto.getMail(), joinDto.getPassword(), joinDto.getPhone(), joinDto.getPhoneAlt(), joinDto.getName(), joinDto.getBirth(), joinDto.getSolarYn(), joinDto.getGender(), joinDto.getZip(), joinDto.getAddress(), joinDto.getAddressDetail(), joinDto.getSmsYn(), joinDto.getMailYn(), joinDto.getRefundBank(), joinDto.getRefundAccount());

        try {
            service.insertMember(member);
            return ResponseEntity.status(HttpStatus.OK).body("회원가입 완료!");
        } catch (DuplicateMemberException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("사용 중인 메일 주소입니다.");
        } catch (DuplicatePhoneException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body("사용 중인 휴대폰 번호입니다.");
        }
    }

    @PostMapping("/login/request")
    public ResponseEntity<?> loginRequest(@RequestBody RequestLoginDto loginDto, HttpServletRequest request) {
        if (loginDto.getMail() == null || loginDto.getPassword() == null || loginDto.getMail().equals("") || loginDto.getPassword().equals("")) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("정보를 모두 입력해 주세요.");
        }

        Member foundMember = service.loginMember(loginDto.getMail(), loginDto.getPassword());

        if (foundMember == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("아이디 또는 비밀번호가 일치하지 않습니다.");
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("member", foundMember);
            session.setAttribute("memberUid", foundMember.getUid());
            return ResponseEntity.status(HttpStatus.OK).body("로그인 성공!");
        }
    }

    @GetMapping("/member")
    public ResponseEntity<?> loginMember(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("세션이 존재하지 않습니다.");

        return ResponseEntity.status(HttpStatus.OK).body(session.getAttribute("member"));
    }

    @GetMapping("/member/uid")
    public int loginMemberUid(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return 0;

        return (int) session.getAttribute("memberUid");
    }

    @GetMapping("/logout")
    public ResponseEntity<?> session(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("세션이 존재하지 않습니다.");

        session.invalidate();
        return ResponseEntity.status(HttpStatus.OK).body("세션 삭제됨!");
    }
}