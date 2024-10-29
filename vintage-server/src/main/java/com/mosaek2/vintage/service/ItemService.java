package com.mosaek2.vintage.service;

import com.mosaek2.vintage.domain.Item;
import com.mosaek2.vintage.mapper.ItemMapper;
import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemService {
    private ItemMapper mapper;

    @Autowired
    public ItemService(ItemMapper mapper) {
        this.mapper = mapper;
    }

    public List<Item> findItemsByCategory1(String category1) {
        return mapper.findItemsByCategory1(category1);
    }

    public List<Item> findItemsByCategory2(String category1, String category2) {
        return mapper.findItemsByCategory2(category1, category2);
    }

    public List<Item> findItemByCategory3(String category1, String category2, String category3) {
        return mapper.findItemsByCategory3(category1, category2, category3);
    }

    public List<Item> findItemsByCategory1Low(String category1) {
        return mapper.findItemsByCategory1Low(category1);
    }

    public List<Item> findItemsByCategory2Low(String category1, String category2) {
        return mapper.findItemsByCategory2Low(category1, category2);
    }

    public List<Item> findItemByCategory3Low(String category1, String category2, String category3) {
        return mapper.findItemsByCategory3Low(category1, category2, category3);
    }

    public List<Item> findItemsByCategory1High(String category1) {
        return mapper.findItemsByCategory1High(category1);
    }

    public List<Item> findItemsByCategory2High(String category1, String category2) {
        return mapper.findItemsByCategory2High(category1, category2);
    }

    public List<Item> findItemByCategory3High(String category1, String category2, String category3) {
        return mapper.findItemsByCategory3High(category1, category2, category3);
    }

    public List<Item> findItemsByCategory1Discount(String category1) {
        return mapper.findItemsByCategory1Discount(category1);
    }

    public List<Item> findItemsByCategory2Discount(String category1, String category2) {
        return mapper.findItemsByCategory2Discount(category1, category2);
    }

    public List<Item> findItemByCategory3Discount(String category1, String category2, String category3) {
        return mapper.findItemsByCategory3Discount(category1, category2, category3);
    }

    public List<Item> findItemsSale() {
        return mapper.findItemsSale();
    }

    public List<Item> findItemsNew() {
        return mapper.findItemsNew();
    }

    public Item findItemByUid(int uid) {
        return mapper.findItemByUid(uid);
    }
}