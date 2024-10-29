package com.mosaek2.vintage.controller;

import com.mosaek2.vintage.domain.Comment;
import com.mosaek2.vintage.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CommentController {
    private CommentService service;

    @Autowired
    public CommentController(CommentService service) {
        this.service = service;
    }

    @GetMapping("/comments")
    public ResponseEntity<?> findCommentsByUid(@RequestParam(value = "uid") int uid) {
        List<Comment> foundList = service.findCommentsByUid(uid);
        if (foundList.isEmpty()) {
            return ResponseEntity.status(HttpStatus.OK).body(null);
        } else {
            return ResponseEntity.status(HttpStatus.OK).body(foundList);
        }
    }
}