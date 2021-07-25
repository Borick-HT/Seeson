package com.thong.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thong.entity.*;

public interface CategoryDAO extends JpaRepository<Category, String>{
}
