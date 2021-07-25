package com.thong.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thong.entity.*;

public interface OrderDAO extends JpaRepository<Order, Long>{
}
