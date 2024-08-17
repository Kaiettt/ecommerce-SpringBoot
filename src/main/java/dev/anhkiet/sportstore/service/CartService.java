package dev.anhkiet.sportstore.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import dev.anhkiet.sportstore.domain.Cart;
import dev.anhkiet.sportstore.domain.CartDetail;
import dev.anhkiet.sportstore.domain.Order;
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

    public void deleteCartByUser(User user) {
        Cart cart = this.cartRepository.findByUser(user);
        List<CartDetail> cartDetails = cart.getCartDetails();
        for (CartDetail cartDetail : cartDetails) {
            this.cartDetailRepository.deleteById(cartDetail.getId());
        }
        this.cartRepository.deleteById(cart.getId());
    }

    public void deleteCartByID(long id) {
        this.cartRepository.deleteById(id);
    }

    public void deleteCartDetailByID(long id) {
        this.cartDetailRepository.deleteById(id);
    }

    public void saveCartDetail(CartDetail cartDetail) {
        this.cartDetailRepository.save(cartDetail);
    }

    public Cart getCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void deleteCart(Cart cart) {
        List<CartDetail> cartDetails = cart.getCartDetails();
        for (CartDetail cartDetail : cartDetails) {
            this.cartDetailRepository.deleteById(cartDetail.getId());
        }
        this.cartRepository.deleteById(cart.getId());
    }

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
                    cartDetail.setMarkBuy(false);
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

    public void handleDeleteFromCart(long id, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(id);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            Cart cart = cartDetail.getCart();
            session.setAttribute("sum", cart.getSum() - cartDetail.getQuantity());
            cart.setSum(cart.getSum() - cartDetail.getQuantity());
            this.cartDetailRepository.deleteById(cartDetail.getId());
            if (cart.getSum() == 0) {
                this.cartRepository.deleteById(cart.getId());
            }
        }
    }

    public Optional<Cart> handleBeforeCheckout(List<CartDetail> cartDetails, Cart cart, HttpSession session) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> oldCartDetailOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (oldCartDetailOptional.isPresent()) {
                CartDetail oldCartDetail = oldCartDetailOptional.get();
                oldCartDetail.setQuantity(cartDetail.getQuantity());
                oldCartDetail.setSize(cartDetail.getSize());
                oldCartDetail.setPrice(cartDetail.getPrice());
                if (cartDetail.isMarkBuy()) {
                    oldCartDetail.setMarkBuy(true);
                } else if (!cartDetail.isMarkBuy()) {
                    oldCartDetail.setMarkBuy(false);
                }
                this.cartDetailRepository.save(oldCartDetail);
            }
        }
        return this.cartRepository.findById(cart.getId());
    }

}
