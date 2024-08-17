package dev.anhkiet.sportstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import dev.anhkiet.sportstore.domain.Cart;
import dev.anhkiet.sportstore.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByUser(User user);

    void deleteByUser(User user);
}
