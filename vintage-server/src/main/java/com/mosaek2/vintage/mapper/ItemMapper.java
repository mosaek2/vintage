package com.mosaek2.vintage.mapper;

import com.mosaek2.vintage.domain.Item;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ItemMapper {
    List<Item> findItemsByCategory1(String category1);

    List<Item> findItemsByCategory2(String category1, String category2);

    List<Item> findItemsByCategory3(String category1, String category2, String category3);

    List<Item> findItemsByCategory1Low(String category1);

    List<Item> findItemsByCategory2Low(String category1, String category2);

    List<Item> findItemsByCategory3Low(String category1, String category2, String category3);

    List<Item> findItemsByCategory1High(String category1);

    List<Item> findItemsByCategory2High(String category1, String category2);

    List<Item> findItemsByCategory3High(String category1, String category2, String category3);

    List<Item> findItemsByCategory1Discount(String category1);

    List<Item> findItemsByCategory2Discount(String category1, String category2);

    List<Item> findItemsByCategory3Discount(String category1, String category2, String category3);

    List<Item> findItemsSale();

    List<Item> findItemsNew();

    Item findItemByUid(int uid);
}