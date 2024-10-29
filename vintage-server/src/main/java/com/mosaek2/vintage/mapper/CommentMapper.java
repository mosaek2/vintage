package com.mosaek2.vintage.mapper;

import com.mosaek2.vintage.domain.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    List<Comment> findCommentsByUid(int uid);
}