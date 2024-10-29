package com.mosaek2.vintage.mapper;

import com.mosaek2.vintage.domain.Comment;
import com.mosaek2.vintage.domain.Post;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {
    List<Post> findNoticePosts();

    List<Post> findQnaPosts();

    void insertQna(Post post);

    void insertQnaItem(Post post);

    Post findPostByUid(int uid);

    void deletePostByUid(int uid);

    void updateQna(Post post);

    void updateQnaItem(Post post);
}