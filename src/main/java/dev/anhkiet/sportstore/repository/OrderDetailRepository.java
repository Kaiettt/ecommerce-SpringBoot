package dev.anhkiet.sportstore.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import dev.anhkiet.sportstore.domain.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

}
