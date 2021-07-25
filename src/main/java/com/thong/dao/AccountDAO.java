package com.thong.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thong.entity.Account;

public interface AccountDAO extends JpaRepository<Account, String>{
}
