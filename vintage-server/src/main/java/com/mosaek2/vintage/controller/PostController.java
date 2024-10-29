package com.mosaek2.vintage.controller;

import com.mosaek2.vintage.domain.Item;
import com.mosaek2.vintage.domain.Member;
import com.mosaek2.vintage.domain.Post;
import com.mosaek2.vintage.dto.RequestInsertQnaDto;
import com.mosaek2.vintage.dto.RequestUpdateQnaDto;
import com.mosaek2.vintage.service.PostService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class PostController {
    private PostService service;

    @Autowired
    public PostController(PostService service) {
        this.service = service;
    }

    @GetMapping("/board/notice")
    public List<Post> findNoticePosts() {
        return service.findNoticePosts();
    }

    @GetMapping("/board/qna")
    public List<Post> findQnaPosts() {
        return service.findQnaPosts();
    }

    @PostMapping("/board/qna/insert")
    public ResponseEntity<?> insertQna(@RequestBody RequestInsertQnaDto insertQnaDto, HttpServletRequest request) {
        if (insertQnaDto.getBoard() == null || insertQnaDto.getTitle() == null || insertQnaDto.getContent() == null
                || insertQnaDto.getBoard().equals("") || insertQnaDto.getTitle().equals("")
                || insertQnaDto.getContent().equals("")) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("정보를 모두 입력해 주세요.");
        }

        HttpSession session = request.getSession(false);
        if (session == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("세션이 존재하지 않습니다.");
        }

        Member member = new Member();
        member.setUid((int) session.getAttribute("memberUid"));

        Post post = new Post();
        post.setBoard(insertQnaDto.getBoard());
        post.setTitle(insertQnaDto.getTitle());
        post.setContent(insertQnaDto.getContent());
        post.setMember(member);


        if (insertQnaDto.getItemUid() == 0) {
            service.insertQna(post);
        } else {
            Item item = new Item();
            item.setUid(insertQnaDto.getItemUid());
            post.setItem(item);
            service.insertQnaItem(post);
        }

        return ResponseEntity.status(HttpStatus.OK).body("게시글 작성 완료!");
    }

    @GetMapping("/board")
    public ResponseEntity<?> findPostByUid(@RequestParam(value = "uid") int uid) {
        if (uid == 0) return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("uid를 입력해 주세요.");

        Post foundPost = service.findPostByUid(uid);
        if (foundPost == null) return ResponseEntity.status(HttpStatus.NOT_FOUND).body("해당 게시글을 찾을 수 없습니다.");
        else return ResponseEntity.status(HttpStatus.OK).body(foundPost);
    }

    @DeleteMapping("/board/delete")
    public ResponseEntity<?> deletePostByUid(@RequestParam(value = "uid") int uid, HttpServletRequest request) {
        if (uid == 0) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("uid를 입력해 주세요.");
        }

        Post foundPost = service.findPostByUid(uid);
        if (foundPost == null) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("해당 게시글을 찾을 수 없습니다.");
        }

        HttpSession session = request.getSession(false);
        if (session == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("세션이 존재하지 않습니다.");
        }

        if (foundPost.getMember().getUid() != (int) session.getAttribute("memberUid")) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("본인의 게시글만 삭제할 수 있습니다.");
        }

        service.deletePostByUid(uid);
        return ResponseEntity.status(HttpStatus.OK).body("게시글 삭제 완료!");
    }

    @PutMapping("/board/qna/modify")
    public ResponseEntity<?> updateQna(@RequestBody RequestUpdateQnaDto updateQnaDto, HttpServletRequest request) {
        if (updateQnaDto.getUid() == 0 || updateQnaDto.getTitle().equals("") || updateQnaDto.getContent().equals("")) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("정보를 모두 입력해 주세요.");
        }

        HttpSession session = request.getSession(false);
        if (session == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("세션이 존재하지 않습니다.");
        }

        Post foundPost = service.findPostByUid(updateQnaDto.getUid());
        if ((int) session.getAttribute("memberUid") != foundPost.getMember().getUid()) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("본인의 게시글만 수정할 수 있습니다.");
        }

        Post post = new Post();
        post.setUid(updateQnaDto.getUid());
        post.setTitle(updateQnaDto.getTitle());
        post.setContent(updateQnaDto.getContent());

        if (updateQnaDto.getItemUid() == 0) {
            service.updateQna(post);
            return ResponseEntity.status(HttpStatus.OK).body("게시글 수정 완료!");
        } else {
            Item item = new Item();
            item.setUid(updateQnaDto.getItemUid());
            post.setItem(item);

            service.updateQna(post);
            return ResponseEntity.status(HttpStatus.OK).body("게시글 수정 완료!");
        }
    }
}