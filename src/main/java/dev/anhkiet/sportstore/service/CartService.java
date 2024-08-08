package dev.anhkiet.sportstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import dev.anhkiet.sportstore.domain.Cart;
import dev.anhkiet.sportstore.domain.CartDetail;
import dev.anhkiet.sportstore.domain.Product;
import dev.anhkiet.sportstore.domain.User;
import dev.anhkiet.sportstore.repository.CartDetailRepository;
import dev.anhkiet.sportstore.repository.CartRepository;
import dev.anhkiet.sportstore.repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class CartService {
    private CartRepository cartRepository;
    private UserService userServicel;
    private ProductService productService;
    private CartDetailRepository cartDetailRepository;

    public CartService(CartDetailRepository cartDetailRepository, CartRepository cartRepository,
            UserService userServicel, ProductService productService) {
        this.cartRepository = cartRepository;
        this.userServicel = userServicel;
        this.productService = productService;
        this.cartDetailRepository = cartDetailRepository;
    }

    public Optional<CartDetail> getCartDetailByID(long id) {
        return this.cartDetailRepository.findById(id);
    }

    public void DeleteCartDetailByID(long id) {
        this.cartDetailRepository.deleteById(id);
    }

    // id product, username : email
    public void handleAddToCart(long id, String username, HttpServletRequest request, int quantity, double shoesSize) {
        HttpSession session = request.getSession(false);
        User user = this.userServicel.getUserByEmail(username);
        if (user != null) {
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                cart = new Cart();
                cart.setSum(0);
                cart.setUser(user);
                cart = this.cartRepository.save(cart);
            }
            Optional<Product> productOptional = this.productService.getProductByID(id);
            if (productOptional.isPresent()) {
                Product product = productOptional.get();
                CartDetail cartDetail = this.cartDetailRepository.findBySizeAndCartAndProduct(shoesSize, cart, product);
                if (cartDetail == null) {
                    cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(product);
                    cartDetail.setPrice(product.getPrice() * quantity);
                    cartDetail.setQuantity(quantity);
                    cartDetail.setSize(0);
                    cartDetail.setSize(shoesSize);
                    cartDetail = this.cartDetailRepository.save(cartDetail);
                } else {
                    cartDetail.setQuantity(cartDetail.getQuantity() + quantity);
                    cartDetail.setPrice(cartDetail.getPrice() + product.getPrice() * quantity);
                }
                cart.setSum(cart.getSum() + quantity);
                session.setAttribute("sum", cart.getSum());
            }
        }
    }

    public List<CartDetail> getCartDetailByUser(String username) {
        User user = this.userServicel.getUserByEmail(username);
        if (user != null) {
            Cart cart = cartRepository.findByUser(user);
            if (cart != null) {
                return cart.getCartDetails();
            } else
                return null;
        }
        return null;
    }
}
