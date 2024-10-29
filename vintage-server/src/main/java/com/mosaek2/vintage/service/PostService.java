package com.mosaek2.vintage.service;

import com.mosaek2.vintage.domain.Post;
import com.mosaek2.vintage.mapper.PostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostService {
    private PostMapper mapper;

    @Autowired
    public PostService(PostMapper mapper) {
        this.mapper = mapper;
    }

    public List<Post> findNoticePosts() {
        return mapper.findNoticePosts();
    }

    public List<Post> findQnaPosts() {
        return mapper.findQnaPosts();
    }

    public void insertQna(Post post) {
        mapper.insertQna(post);
    }

    public void insertQnaItem(Post post) {
        mapper.insertQnaItem(post);
    }

    public Post findPostByUid(int uid) {
        Post foundPost = mapper.findPostByUid(uid);
        if (foundPost == null) return null;
        else return foundPost;
    }

    public void deletePostByUid(int uid) {
        mapper.deletePostByUid(uid);
    }

    public void updateQna(Post post) {
        mapper.updateQna(post);
    }

    public void updateQnaItem(Post post) {
        mapper.updateQnaItem(post);
    }
}