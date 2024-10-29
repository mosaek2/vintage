package com.mosaek2.vintage.mapper;

import com.mosaek2.vintage.domain.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    void insertMember(Member member);

    Member findMemberByMail(String mail);

    Member findMemberByPhone(String phone);
}