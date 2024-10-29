package com.mosaek2.vintage.service;

import com.mosaek2.vintage.domain.Member;
import com.mosaek2.vintage.exception.DuplicatePhoneException;
import com.mosaek2.vintage.mapper.MemberMapper;
import org.apache.ibatis.javassist.bytecode.DuplicateMemberException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    private MemberMapper mapper;

    @Autowired
    public MemberService(MemberMapper mapper) {
        this.mapper = mapper;
    }

    public void insertMember(Member member) throws DuplicateMemberException, DuplicatePhoneException {
        if (mapper.findMemberByMail(member.getMail()) != null) throw new DuplicateMemberException(null);
        if (mapper.findMemberByPhone(member.getPhone()) != null) throw new DuplicatePhoneException();
        mapper.insertMember(member);
    }

    public boolean isUniqueMail(String mail) {
        return mapper.findMemberByMail(mail) == null;
    }

    public boolean isUniquePhone(String phone) {
        return mapper.findMemberByPhone(phone) == null;
    }

    public Member loginMember(String mail, String password) {
        Member foundMember = mapper.findMemberByMail(mail);
        if (foundMember == null) return null;

        if (foundMember.getPassword().equals(password)) return foundMember;
        else return null;
    }
}