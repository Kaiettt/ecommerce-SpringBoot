package dev.anhkiet.sportstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import dev.anhkiet.sportstore.domain.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

}
