package dev.anhkiet.sportstore.controller.client;

import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dev.anhkiet.sportstore.domain.CartDetail;
import dev.anhkiet.sportstore.service.CartService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
    public CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
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
        Optional<CartDetail> cartDetailOptional = cartService.getCartDetailByID(ID);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            int currentSum = (int) session.getAttribute("sum");
            session.setAttribute("sum", currentSum - cartDetail.getQuantity());
            this.cartService.DeleteCartDetailByID(ID);
        }
        return "redirect:/cart";
    }
}
