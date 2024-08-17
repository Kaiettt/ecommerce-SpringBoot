package dev.anhkiet.sportstore.controller.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dev.anhkiet.sportstore.domain.Cart;
import dev.anhkiet.sportstore.domain.CartDetail;
import dev.anhkiet.sportstore.domain.Order;
import dev.anhkiet.sportstore.service.CartService;
import dev.anhkiet.sportstore.service.OrderService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
    public CartService cartService;
    public OrderService orderService;

    public CartController(CartService cartService, OrderService orderService) {
        this.cartService = cartService;
        this.orderService = orderService;
    }

    @PostMapping("/add-product-to-cart/{ID}")
    public String addProudctToCart(@PathVariable long ID, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("email");
        this.cartService.handleAddToCart(ID, username, request, 1, 39);
        return "redirect:/";
    }

    @PostMapping("/add-product-to-cart-detail/{ID}")
    public String addProudctDetailToCart(@PathVariable long ID, HttpServletRequest request,
            @RequestParam("quantity") int quantity, @RequestParam("shoesSize") double shoesSize) {
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("email");
        this.cartService.handleAddToCart(ID, username, request, quantity, shoesSize);
        return "redirect:/";
    }

    @PostMapping("/delete-cart-product/{ID}")
    public String DeleteProductFromCart(@PathVariable long ID, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.cartService.handleDeleteFromCart(ID, session);
        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart, Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Optional<Cart> updatedCartOptional = this.cartService.handleBeforeCheckout(cart.getCartDetails(), cart,
                session);
        if (updatedCartOptional.isPresent()) {
            cart = updatedCartOptional.get();
        }
        double totalPrice = 0;
        int sum = 0;
        int checkout_size = 0;
        for (CartDetail cartdetail : cart.getCartDetails()) {
            sum += cartdetail.getQuantity();
            if (cartdetail.isMarkBuy()) {
                totalPrice += cartdetail.getPrice();
                checkout_size++;
            }

        }
        cart.setSum(sum);
        session.setAttribute("sum", sum);
        model.addAttribute("order", new Order());
        model.addAttribute("cart", cart);
        model.addAttribute("checkoutPrice", totalPrice);
        model.addAttribute("sizelist", cart.getCartDetails().size());
        model.addAttribute("checkoutsize", checkout_size);
        return "client/cart/checkout";
    }

    @PostMapping("/confirm")
    public String getCheckOutPage(@ModelAttribute("order") Order order, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.orderService.handleBeforeConfirmCheckout(order, session);
        return "redirect:/";
    }
}
