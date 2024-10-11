package com.company.Repository;

import java.util.List;

import com.company.modal.WishlistItem;

public interface WishlistRepository {
    List<WishlistItem> getAllWishlistItems(int uid);
    boolean isExist(int uid, int prId);
    WishlistItem getSingleItem(int recId);
    boolean AddToWishList(int uid, int prId);
    boolean removeFromWishList(int uid, int prId);
    boolean qtyUpdate(int recId, int qty);
}
