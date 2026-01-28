package com.industrial.trading.service.impl;

import com.industrial.trading.dao.ProductMapper;
import com.industrial.trading.entity.Product;
import com.industrial.trading.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 商品服务实现类
 */
@Service
public class ProductServiceImpl implements ProductService {
    
    @Autowired
    private ProductMapper productMapper;
    
    @Override
    public Product publish(Product product) {
        // 设置默认状态为待审核
        if (product.getStatus() == null) {
            product.setStatus(0);
        }
        
        // 设置默认销量和浏览量
        product.setSales(0);
        product.setViews(0);
        
        productMapper.insert(product);
        return product;
    }
    
    @Override
    public Product findById(Integer id) {
        return productMapper.selectById(id);
    }
    
    @Override
    public List<Product> findList(Map<String, Object> params) {
        return productMapper.selectList(params);
    }
    
    @Override
    public int count(Map<String, Object> params) {
        return productMapper.selectCount(params);
    }
    
    @Override
    public boolean update(Product product) {
        return productMapper.update(product) > 0;
    }
    
    @Override
    public boolean audit(Integer id, Integer status) {
        return productMapper.updateStatus(id, status) > 0;
    }
    
    @Override
    public void increaseViewCount(Integer id) {
        productMapper.increaseViewCount(id);
    }
}
