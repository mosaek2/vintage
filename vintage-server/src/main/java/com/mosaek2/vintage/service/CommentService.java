package com.mosaek2.vintage.service;

import com.mosaek2.vintage.domain.Comment;
import com.mosaek2.vintage.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    private CommentMapper mapper;

    @Autowired
    public CommentService(CommentMapper mapper) {
        this.mapper = mapper;
    }

    public List<Comment> findCommentsByUid(int uid) {
        return mapper.findCommentsByUid(uid);
    }
}