package dev.anhkiet.sportstore.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Service;

import dev.anhkiet.sportstore.domain.Cart;
import dev.anhkiet.sportstore.domain.CartDetail;
import dev.anhkiet.sportstore.domain.Order;
import dev.anhkiet.sportstore.domain.OrderDetail;
import dev.anhkiet.sportstore.domain.User;
import dev.anhkiet.sportstore.repository.CartRepository;
import dev.anhkiet.sportstore.repository.OrderDetailRepository;
import dev.anhkiet.sportstore.repository.OrderRepository;
import jakarta.persistence.EntityNotFoundException;
import jakarta.servlet.http.HttpSession;

@Service
public class OrderService {
    private UserService userService;
    private CartService cartService;
    private OrderRepository orderRepository;
    private OrderDetailRepository orderDetailRepository;

    public OrderService(CartRepository cartRepository, OrderDetailRepository orderDetailRepository,
            UserService userService, CartService cartService,
            OrderRepository orderRepository) {
        this.userService = userService;
        this.cartService = cartService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public void handleBeforeConfirmCheckout(Order order, HttpSession session) {
        int newSum = 0;
        String email = (String) session.getAttribute("email");
        User user = this.userService.getUserByEmail(email);
        Cart cart = user.getCart();
        // set User
        order.setUser(user);
        // Setting order Date
        order.setOrderTime(LocalDateTime.now());
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        String formatedTime = order.getOrderTime().format(myFormatObj);
        order.setOrderTimeFormated(formatedTime);
        // set Order quantity
        order.setQuantity(cart.getSum());
        this.orderRepository.save(order);
        List<CartDetail> cartDetails = cart.getCartDetails();
        // List<OrderDetail> OrderList = new ArrayList<OrderDetail>();
        for (CartDetail cartDetail : cartDetails) {
            if (cartDetail.isMarkBuy()) {
                OrderDetail orderDetail = new OrderDetail();
                newSum += cartDetail.getQuantity();
                orderDetail.setPrice(cartDetail.getPrice());
                orderDetail.setSize(cartDetail.getSize());
                orderDetail.setOrder(order);
                orderDetail.setProduct(cartDetail.getProduct());
                orderDetail.setQuantity(cartDetail.getQuantity());
                try {
                    cartService.deleteCartDetailByID(cartDetail.getId());
                } catch (EntityNotFoundException e) {
                }
                this.orderDetailRepository.save(orderDetail);
            }
        }
        cart.setSum(cart.getSum() - newSum);
        order.setQuantity(newSum);
        order = this.orderRepository.save(order);
        if (cart.getSum() == 0) {
            this.cartService.deleteCartByID(cart.getId());
            session.setAttribute("sum", 0);
        } else {
            session.setAttribute("sum", cart.getSum());
        }
    }
}
