package dev.anhkiet.sportstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import dev.anhkiet.sportstore.domain.Cart;
import dev.anhkiet.sportstore.domain.CartDetail;
import dev.anhkiet.sportstore.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    CartDetail findByCartAndProduct(Cart cart, Product product);

    CartDetail findBySizeAndCartAndProduct(double size, Cart cart, Product product);
}
