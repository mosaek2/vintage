package com.mosaek2.vintage.controller;

import com.mosaek2.vintage.domain.Item;
import com.mosaek2.vintage.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
public class ItemController {
    private ItemService service;

    @Autowired
    public ItemController(ItemService service) {
        this.service = service;
    }

    @GetMapping("/items")
    public ResponseEntity<?> getItemList(@RequestParam(value = "category1") String category1,
                                         @RequestParam(value = "category2") String category2,
                                         @RequestParam(value = "category3") String category3,
                                         @RequestParam(value = "sort") String sort) {
        List<Item> foundList = new ArrayList<>();

        if (sort.equals("new")) {
            if (category2.equals("")) {
                foundList = service.findItemsByCategory1(category1);
            } else if (category3.equals("")) {
                foundList = service.findItemsByCategory2(category1, category2);
            } else {
                foundList = service.findItemByCategory3(category1, category2, category3);
            }
        } else if (sort.equals("low")) {
            if (category2.equals("")) {
                foundList = service.findItemsByCategory1Low(category1);
            } else if (category3.equals("")) {
                foundList = service.findItemsByCategory2Low(category1, category2);
            } else {
                foundList = service.findItemByCategory3Low(category1, category2, category3);
            }
        } else if (sort.equals("high")) {
            if (category2.equals("")) {
                foundList = service.findItemsByCategory1High(category1);
            } else if (category3.equals("")) {
                foundList = service.findItemsByCategory2High(category1, category2);
            } else {
                foundList = service.findItemByCategory3High(category1, category2, category3);
            }
        } else if (sort.equals("discount")) {
            if (category2.equals("")) {
                foundList = service.findItemsByCategory1Discount(category1);
            } else if (category3.equals("")) {
                foundList = service.findItemsByCategory2Discount(category1, category2);
            } else {
                foundList = service.findItemByCategory3Discount(category1, category2, category3);
            }
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("sort 값을 입력해 주세요.");
        }

        return ResponseEntity.status(HttpStatus.OK).body(foundList);
    }

    @GetMapping("/items/sale")
    public ResponseEntity<?> getItemListSale() {
        List<Item> foundlist = service.findItemsSale();
        return ResponseEntity.status(HttpStatus.OK).body(foundlist);
    }

    @GetMapping("/items/new")
    public ResponseEntity<?> getItemListNew() {
        List<Item> foundlist = service.findItemsNew();
        return ResponseEntity.status(HttpStatus.OK).body(foundlist);
    }

    @GetMapping("/item")
    public ResponseEntity<?> getItem(@RequestParam(value = "uid") int uid) {
        Item foundItem = service.findItemByUid(uid);
        if (foundItem == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("해당 상품을 찾을 수 없습니다.");
        }

        return ResponseEntity.status(HttpStatus.OK).body(foundItem);
    }
}